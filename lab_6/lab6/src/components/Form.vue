<template>
    <form class="form" @submit.prevent="submitData">
        <div class="form__group">
            <Control
                type="text"
                label="Имя"
                v-model="firstname"
            />
            <Control
                type="text"
                label="Фамилия"
                v-model="lastname"
            />
        </div>
        <div class="form__group">
            <Control
                type="date"
                label="Дата выдачи заработной платы"
                v-model="payDate"
            />
            <Control
                type="text"
                label="Количество отработанных дней"
                flag="numeric"
                v-model="countOfWorkedDays"
            />
        </div>
        <div class="form__group">
            <Control
                type="text"
                label="Оклад"
                flag="numeric"
                v-model="payAmount"
            />
        </div>

        <div class="form__wrapper">
            <button class="form__button">Добавить</button>
        </div>
    </form>
</template>

<script>
import Control from '@/components/Control';

export default {
    name: 'Form',
    components: {
        Control
    },
    data() {
        return {
            firstname: null,
            lastname: null,
            payDate: null,
            payAmount: null,
            countOfWorkedDays: null
        };
    },
    methods: {
        submitData() {
            const store = this.$store.state.employees;
            store.push({
                firstname: this.firstname,
                lastname: this.lastname,
                payDate: this.payDate,
                payAmount: this.payAmount,
                countOfWorkedDays: this.countOfWorkedDays
            });

            localStorage.setItem('employees', JSON.stringify(store));

            this.$store.dispatch('updateEmployees', store);
            this.clearData();
        },
        clearData() {
            this.firstname = null;
            this.lastname = null;
            this.payDate = null;
            this.payAmount = null;
            this.countOfWorkedDays = null;
        }
    }
};
</script>

<style lang="scss" scoped>
.form {
    gap: 24px;
    display: grid;

    &__group,
    &__wrapper {
        gap: 24px;
        display: grid;
        grid-auto-flow: column;
    }

    &__group {
        grid-auto-columns: 1fr;
    }

    &__wrapper {
        grid-auto-columns: max-content;
    }

    &__button {
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        font: inherit;
        background: var(--primary-color);
        color: #ffffff;

        &:focus {
            box-shadow: 0 0 0 2px var(--primary-transparent-color);
            outline: none;
        }
    }
}
</style>