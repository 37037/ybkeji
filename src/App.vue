<template>
  <div id="app">
    <router-view />
    <FloatingVideo />
  </div>
</template>

<script>
export default {
  name: 'App',
  components: {
    FloatingVideo: () => import('./components/FloatingVideo.vue')
  }
}
</script>

<style>
#app {
  font-family: 'KaiTi', '楷体', serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>

<!-- Global site variables and container (non-scoped) -->
<style>
:root{
  --gold:#e3c46b;
  --dark:#333;
  --muted:#777;
  --accent:#9b4cff;
  --container-width:90%;
  --max-width:1400px;
  --gap:18px;
}
*{box-sizing:border-box}
body{margin:0;font-family: 'Helvetica Neue', Arial, 'PingFang SC', 'Microsoft Yahei', sans-serif;color:#222}
.container{width:var(--container-width); max-width:var(--max-width); margin:0 auto; padding:0 12px}
@media (max-width:960px){
  .container{width:92%; padding:0 10px}
}
@media (max-width:600px){
  .container{width:95%; padding:0 8px}
  body{font-size:15px}
}
</style>
