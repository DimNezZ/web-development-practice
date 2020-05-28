<template>
    <div id="app">
        <router-view/>
    </div>
</template>

<style>
:root {
    --primary-color: rgb(30, 144, 255);
    --primary-transparent-color: rgb(30, 144, 255, 0.5);
}

body {
    margin: 0;
}

#app {
    font: 16px 'Segoe UI', Arial, Helvetica, sans-serif;
}
</style>