<template>
  <div>
    <AddTodo @add-todo="addTodo"/>
    <select v-model="filter">
        <option value="all">All</option>
        <option value="completed">Completed</option>
        <option value="not-completed">Not copleted</option>
    </select>
    <TodoList v-if="filteredTodos.length" v-bind:todos="filteredTodos" @remove-todo="removeTodo"  />
    <p v-else>Нет элементов!</p>
    <Loader v-if="loading" />
  </div>
</template>

<script>
import TodoList from '@/components/TodoList'
import AddTodo from '@/components/AddTodo'
import Loader from '@/components/Loader'
export default {
  name: 'Todos',
  components: {
    TodoList, AddTodo, Loader
  },
  data() {
    return {
      loading: true,
      todos: [],
      filter: 'all',
    }
  },
  mounted(){
    fetch('https://jsonplaceholder.typicode.com/todos?_limit=3')
      .then(response => response.json())
      .then(json => {
        setTimeout(() =>{
        this.todos = json;
        this.loading = false;
        }, 2000)
      })
  },
  computed: {
    filteredTodos() {
      if (this.filter === 'completed'){
        return this.todos.filter (t => t.completed);
      }
      if (this.filter === 'not-completed'){
        return this.todos.filter (t => !t.completed);
      }
      return this.todos;
    }
  },
  methods: {
    removeTodo(id) {
      this.todos = this.todos.filter(t => t.id !==id);
    },
    addTodo(todo ){
      this.todos.push(todo);
    }
  },
};
</script>