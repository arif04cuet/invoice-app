import * as types from './mutation-types'

export default {
  [types.BOOTSTRAP_COMPANIES](state, companies) {
    state.companies = companies
  },

  [types.SET_TOTAL_COMPANIES](state, totalCompanies) {
    state.totalCompanies = totalCompanies
  },

  [types.ADD_COMPANY](state, data) {
    state.companies.push(data.company)
  },

  [types.UPDATE_COMPANY](state, data) {
    let pos = state.companies.findIndex((company) => company.id === data.company.id)

    state.companies[pos] = data.company
  },

  [types.DELETE_COMPANY](state, id) {
    let index = state.companies.findIndex((company) => company.id === id[0])
    state.companies.splice(index, 1)
  },

  [types.DELETE_MULTIPLE_COMPANIES](state, selectedCompanies) {
    selectedCompanies.forEach((company) => {
      let index = state.companies.findIndex((_company) => _company.id === company.id)
      state.companies.splice(index, 1)
    })

    state.selectedCompanies = []
  },

  [types.SET_SELECTED_COMPANIES](state, data) {
    state.selectedCompanies = data
  },

  [types.SET_SELECT_ALL_STATE](state, data) {
    state.selectAllField = data
  },
}
