<template>
  <div class="product-detail">
    <TopBar />
    <section class="hero">
      <div class="container">
        <h1>cnc machine {{ productId }} detail</h1>
        <p class="subtitle">Comprehensive cnc machine introduction covering precision manufacturing and automation.</p>
      </div>
    </section>

    <section class="content container">
      <div class="media">
        <img :src="productImage" alt="cnc machine" />
      </div>
      <div class="info">
        <h2>cnc machine key features</h2>
        <ul>
          <li>cnc machine high precision cutting and milling</li>
          <li>cnc machine OEM/ODM customization</li>
          <li>cnc machine stable output for continuous production lines</li>
        </ul>
      </div>
    </section>

    <SiteFooter />
  </div>
</template>

<script>
import TopBar from '../components/TopBar.vue'
import SiteFooter from '../components/SiteFooter.vue'
import product2 from '../assets/product2.jpg'

export default {
  name: 'ProductDetail',
  props: {
    productId: {
      type: String,
      default: '1'
    }
  },
  components: {
    TopBar,
    SiteFooter
  },
  computed: {
    productImage(){
      return product2
    }
  }
}
</script>

<style scoped>
.product-detail{background:#f6f6f6; min-height:100vh; display:flex; flex-direction:column}
.hero{background:linear-gradient(90deg,#8f63ff,#ff7dba); padding:48px 0; color:#fff}
.hero .container{max-width:var(--container-width); margin:0 auto}
.subtitle{margin-top:12px; font-size:18px; color:rgba(255,255,255,0.9)}
.content{display:flex; gap:40px; padding:40px 0; max-width:var(--container-width); flex:1}
.media img{width:100%; border-radius:12px; object-fit:cover}
.media{flex:1}
.info{flex:1; background:#fff; padding:32px; border-radius:12px; box-shadow:0 12px 32px rgba(15,23,42,0.08)}
.info h2{margin-bottom:16px; font-size:28px}
.info ul{padding-left:18px; line-height:1.8}
.back{display:inline-block; margin-top:24px; color:#8e4bff; font-weight:700}

@media (max-width:960px){
  .content{flex-direction:column}
}
</style>
