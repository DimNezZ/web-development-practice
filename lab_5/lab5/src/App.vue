<template>
  <div id="app">
    <h1>Todo application</h1>
        <router-link to="/">Home</router-link>
    <hr>
    
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'app'
};
</script>>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  color: #2c3e50;
}
</style>
