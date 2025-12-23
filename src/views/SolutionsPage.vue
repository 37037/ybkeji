<template>
  <div class="page solutions-page">
    <TopBar />
    <main class="page-main">
      <section class="page-hero">
        <div class="container">
          <h1>cnc machine solutions</h1>
          <p>Discover cnc machine integration services, automation consulting, and turnkey production solutions.</p>
        </div>
      </section>
      <SolutionBlock />
      <VRBar />
      <BigCTA />
    </main>
    <SiteFooter />
  </div>
</template>

<script>
import TopBar from '../components/TopBar.vue'
import SolutionBlock from '../components/SolutionBlock.vue'
import VRBar from '../components/VRBar.vue'
import BigCTA from '../components/BigCTA.vue'
import SiteFooter from '../components/SiteFooter.vue'

export default {
  name: 'SolutionsPage',
  components: {
    TopBar,
    SolutionBlock,
    VRBar,
    BigCTA,
    SiteFooter
  }
}
</script>

<style scoped>
.page-main{background:#fff}
.page-hero{background:linear-gradient(120deg,#9dd6ff,#c9a7ff); color:#111; padding:48px 0}
.page-hero h1{margin:0 0 12px; font-size:36px}
.page-hero p{margin:0; max-width:720px; line-height:1.6}
</style>
