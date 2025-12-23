<template>
  <section class="news">
    <div class="container">
  <h2 class="news-title">cnc machine news and blogs</h2>
      <div class="news-grid">
        <article class="news-card" v-for="i in 3" :key="i">
          <div class="thumb-wrap">
            <div class="thumb-placeholder">博文首图</div>
          </div>
          <h3 class="card-title">cnc machine insight {{ i }}</h3>
          <div class="read-more">...[<span>Read cnc machine</span>]</div>
        </article>
      </div>
    </div>
  </section>
</template>

<script>
export default { name: 'NewsGrid' }
</script>

<style scoped>
.news-title{ text-align:center; font-size:28px; margin:8px 0 22px; letter-spacing:1px }
.news-grid{display:flex; gap:36px; justify-content:space-between; align-items:stretch}
.news-card{background:#fff; padding:22px; border:1px solid #e6e6e6; text-align:center; width:32%; box-shadow:0 2px 0 rgba(0,0,0,0.03)}
.thumb-wrap{height:260px; display:flex; align-items:center; justify-content:center}
.thumb-placeholder{width:64%; height:64%; background:#ead494; display:flex; align-items:center; justify-content:center; color:#666; font-size:22px}
.card-title{font-size:34px; margin:18px 0; font-weight:700}
.read-more{color:#b99b2d; font-weight:700; margin-top:8px}
.read-more span{color:#b99b2d}

@media (max-width:960px){
  .news-grid{flex-direction:column; gap:18px}
  .news-card{width:100%}
  .thumb-wrap{height:180px}
}
</style>