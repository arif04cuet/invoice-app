<?php

namespace Crater\Models;

use Carbon\Carbon;
use Crater\Models\Address;
use Illuminate\Database\Eloquent\Model;
use Crater\Models\User;
use Crater\Models\CompanySetting;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Company extends Model implements HasMedia
{
    use InteractsWithMedia;

    use HasFactory;

    protected $fillable = ['name', 'logo', 'unique_hash'];

    protected $appends = ['logo', 'logo_path', 'formattedCreatedAt'];

    public function getLogoPathAttribute()
    {
        $logo = $this->getMedia('logo')->first();

        $isSystem = FileDisk::whereSetAsDefault(true)->first()->isSystem();

        if ($logo) {
            if ($isSystem) {
                return $logo->getPath();
            } else {
                return $logo->getFullUrl();
            }
        }

        return null;
    }

    public function getLogoAttribute()
    {
        $logo = $this->getMedia('logo')->first();

        if ($logo) {
            return $logo->getFullUrl();
        }

        return null;
    }

    public function user()
    {
        return $this->hasOne(User::class);
    }

    public function settings()
    {
        return $this->hasMany(CompanySetting::class);
    }

    public function address()
    {
        return $this->hasOne(Address::class);
    }

    public function getFormattedCreatedAtAttribute($value)
    {
        $dateFormat = CompanySetting::getSetting('carbon_date_format', $this->id);
        return Carbon::parse($this->created_at)->format($dateFormat);
    }

    public function scopeApplyFilters($query, array $filters)
    {
        $filters = collect($filters);

        if ($filters->get('name')) {
            $query->where('name', 'LIKE', '%' . $filters->get('name') . '%');
        }

        if ($filters->get('email')) {
            $email = $filters->get('email');
            $query->whereHas('user', function ($q) use ($email) {
                $q->whereEmail($email);
            });
        }

        if ($filters->get('phone')) {
            $phone = $filters->get('phone');
            $query->whereHas('user', function ($q) use ($phone) {
                $q->wherePhone($phone);
            });
        }

        if ($filters->get('orderByField') || $filters->get('orderBy')) {
            $field = $filters->get('orderByField') ? $filters->get('orderByField') : 'name';
            $orderBy = $filters->get('orderBy') ? $filters->get('orderBy') : 'asc';
            $query->orderBy($field, $orderBy);
        }
    }
}
