<template>
  <section id="solutions" class="solution">
    <div class="container solution-inner">
      <div class="solution-left">
        <h3>cnc machine processing solution</h3>
        <ul class="bullet-list">
          <li>cnc machine 解决方案一... <a>Learn cnc machine</a></li>
          <li>cnc machine 解决方案二... <a>Discover cnc machine</a></li>
          <li>更多 cnc machine...</li>
        </ul>
      </div>
      <div class="solution-right">
        <div class="video-placeholder">一站式解决方案公司宣传视频 - YouTube 链接</div>
      </div>
    </div>
  </section>
</template>

<script>
export default { name: 'SolutionBlock' }
</script>

<style scoped>
.solution{padding:28px 0; background:#fff}
.solution-inner{display:flex; gap:20px; align-items:flex-start}
.solution-left{flex:1}
.solution-right{flex:1; display:flex; align-items:center; justify-content:center; background:#eee; min-height:160px}
.video-placeholder{padding:20px; text-align:center; line-height:1.6}

@media (max-width:900px){
  .solution-inner{flex-direction:column; align-items:stretch}
  .solution-right{width:100%; min-height:220px}
}
</style>