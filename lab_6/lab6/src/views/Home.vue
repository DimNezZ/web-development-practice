<template>
    <div class="home">
        <Form />
        <Table />
    </div>
</template>

<script>
import Form from '@/components/Form';
import Table from '@/components/Table';

export default {
    name: 'Home',
    components: {
        Form,
        Table
    },
    mounted() {
        const employees = JSON.parse(localStorage.getItem('employees'));

        if (employees !== null) {
            this.$store.dispatch('updateEmployees', employees);
        }
    }
};
</script>

<style lang="scss" scoped>
.home {
    padding: 24px;
    gap: 24px;
    display: grid;
}
</style>