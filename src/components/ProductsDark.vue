<template>
  <section id="products" class="products-dark">
    <div class="container">
      <h2 class="section-title">cnc machine product lineup</h2>
      <div class="product-row">
        <article
          class="product-card"
          v-for="i in 4"
          :key="i"
          role="button"
          tabindex="0"
          @click="openProduct(i)"
          @keypress.enter="openProduct(i)"
        >
          <div class="card-media">
            <img :src="product" alt="cnc machine" />
          </div>
          <h3>cnc machine {{ i }}</h3>
          <p class="muted">cnc machine 服务亮点与核心卖点</p>
          <a class="readmore">Read cnc machine</a>
        </article>
      </div>
    </div>
  </section>
</template>

<script>
import product2 from '../assets/product2.jpg'

export default {
  name: 'ProductsDark',
  data(){
    return { product: product2 }
  },
  methods: {
    openProduct(id){
      this.$router.push({ name: 'ProductDetail', params: { productId: id.toString() } })
    }
  }
}
</script>

<style scoped>
.products-dark{background:#eee; padding:22px 0}
.products-dark .section-title{ text-align:center; margin:12px 0 18px; font-weight:700}
.product-row{display:flex; gap:16px; justify-content:space-between}
.product-card{background:var(--dark); color:#fff; padding:20px; flex:1; text-align:center; cursor:pointer; transition:transform 0.2s ease, box-shadow 0.2s ease}
.product-card:focus,.product-card:hover{transform:translateY(-4px); box-shadow:0 16px 24px rgba(0,0,0,0.3)}
.product-card .card-media{height:140px; margin-bottom:12px; display:flex; align-items:center; justify-content:center}
.product-card .card-media img{max-width:100%; max-height:100%; object-fit:cover; display:block}
.muted{color:#cfcfcf}

@media (max-width:960px){
  .product-row{flex-wrap:wrap}
  .product-card{flex:1 1 calc(50% - 16px)}
}
@media (max-width:600px){
  .product-row{flex-direction:column}
  .product-card{flex:1 1 auto}
}
</style>
