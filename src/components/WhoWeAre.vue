<template>
  <section id="about" class="who">
    <div class="container who-inner">
      <div class="who-media">图片/轮播占位</div>
      <div class="who-text">
        <h2>cnc machine experts</h2>
        <p>cnc machine 技术优势、智能工艺、精密加工经验全面覆盖，支持全球客户快速落地</p>
        <button class="btn small">cnc machine detail</button>
      </div>
    </div>
  </section>
</template>

<script>
export default { name: 'WhoWeAre' }
</script>

<style scoped>
.who{padding:28px 0}
.who-inner{display:flex; gap:20px; align-items:center}
.who-media{flex:0 0 40%; background:#ddd; height:160px}
.who-text{flex:1}
.btn.small{padding:8px 12px}
</style>