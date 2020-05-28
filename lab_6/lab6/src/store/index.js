import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        employees: []
    },
    mutations: {
        updateEmployees(state, data) {
            state.employees = data;
        }
    },
    actions: {
        updateEmployees(context, data) {
            context.commit('updateEmployees', data);
        }
    }
});