<template>
    <table>
        <thead>
            <tr>
                <th>№</th>
                <th>Сотрудник</th>
                <th>Дата выдачи заработной платы</th>
                <th>Количество отработанных дней</th>
                <th>Оклад</th>
                <th>Оклад с НДС</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(employee, index) in employees" :key="index">
                <td>{{ index + 1 }}</td>
                <td>{{ employee.firstname }} {{ employee.lastname }}</td>
                <td>{{ date(employee.payDate) }}</td>
                <td>{{ employee.countOfWorkedDays }}</td>
                <td>{{ employee.payAmount }}</td>
                <td>{{ employee.payAmount * 0.85 }}</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4"><strong>Итого</strong></td>
                <td><strong>{{ total }}</strong></td>
                <td><strong>{{ total * 0.85 }}</strong></td>
            </tr>
        </tfoot>
    </table>
</template>

<script>
import format from '@/modules/format';

export default {
    name: 'Table',
    computed: {
        employees() {
            return this.$store.state.employees;
        },
        total() {
            return this.employees.reduce((accumulator, employee) => {
                accumulator += Number(employee.payAmount);

                return accumulator;
            }, 0);
        }
    },
    methods: {
        date(raw) {
            return format(new Date(raw), '[day] [month] [year]');
        }
    }
};
</script>

<style lang="scss" scoped>
table {
    --border-color: #191919;

    border: 1px solid var(--border-color);
    border-collapse: collapse;

    thead {
        background: var(--primary-color);
        color: #ffffff;
    }

    tfoot {
        td:nth-child(1) {
            text-align: right;
        }
    }

    th,
    td {
        padding: 8px 16px;
        border: 1px solid var(--border-color);
    }

    th {
        font-weight: 500;
    }
}

strong {
    font-weight: 500;
}
</style>