<template>
  <div class="page about-page">
    <TopBar />
    <main class="page-main">
      <section class="page-hero">
        <div class="container">
          <h1>about cnc machine</h1>
          <p>Learn about our cnc machine heritage, manufacturing capacity, and commitment to precision engineering.</p>
        </div>
      </section>
      <WhoWeAre />
      <WhyChoose />
      <NewsGrid />
    </main>
    <SiteFooter />
  </div>
</template>

<script>
import TopBar from '../components/TopBar.vue'
import WhoWeAre from '../components/WhoWeAre.vue'
import WhyChoose from '../components/WhyChoose.vue'
import NewsGrid from '../components/NewsGrid.vue'
import SiteFooter from '../components/SiteFooter.vue'

export default {
  name: 'AboutPage',
  components: {
    TopBar,
    WhoWeAre,
    WhyChoose,
    NewsGrid,
    SiteFooter
  }
}
</script>

<style scoped>
.page-main{background:#f6f6f6}
.page-hero{background:linear-gradient(120deg,#fff6b7,#f6a6ff); color:#111; padding:48px 0}
.page-hero h1{margin:0 0 12px; font-size:36px; text-transform:capitalize}
.page-hero p{margin:0; max-width:720px; line-height:1.6}
</style>
