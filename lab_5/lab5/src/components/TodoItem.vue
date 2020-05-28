<template>
    <li>
        <label v-bind:class="{done: todo.completed}">
            <input type="checkbox" 
                   v-on:change="todo.completed = !todo.completed">
            <strong>{{index + 1}}</strong>
            {{todo.title | uppercase}}
        </label>
        <button class="rm" v-on:click="$emit('remove-todo',todo.id)">&times;</button>
    </li>
</template>

<script>
export default {
    props:{
        todo:{
            type: Object,
            required: true,
        },
        index: Number
    },
    filters:{
        uppercase(value) {
            return value.toUpperCase()
        }
    }
}
</script>

<style scoped>
li{
    border: 1px solid #ccc;
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    padding: .5rem 2rem;
    margin-bottom: 1rem;
}
.rm {
    width: 24px;
    height: 24px;
    padding: 0;
    flex-shrink: 0;
    background: #791a1a;
    color: #fff;
    border-radius: 50%;
    border: none;
    font-weight: bold;
}

.done {
    text-decoration: line-through;
}

input{
    margin-right: 1rem;
}


</style>