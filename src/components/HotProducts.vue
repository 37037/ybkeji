<template>
  <section class="hot-products">
    <div class="container">
      <h2 class="section-title">cnc machine hot products</h2>
      <div class="grid-cards">
        <article
          class="grid-card"
          v-for="i in 4"
          :key="i"
          role="button"
          tabindex="0"
          @click="openProduct(i)"
          @keypress.enter="openProduct(i)"
        >
          <div class="thumb">
            <img :src="product" alt="cnc machine" />
          </div>
          <h4>cnc machine {{ i }}</h4>
        </article>
      </div>
    </div>
  </section>
</template>
<script>
import product1 from '../assets/product1.jpg'
export default {
  name: 'HotProducts',
  data(){
    return { product: product1 }
  },
  methods: {
    openProduct(id){
      this.$router.push({ name: 'ProductDetail', params: { productId: id.toString() } })
    }
  }
}
</script>
<style scoped>
.grid-cards{display:flex; gap:16px; justify-content:space-between}
.grid-card{background:#fff; padding:16px; text-align:center; flex:1; border:1px solid #eee; cursor:pointer; transition:transform 0.2s ease, box-shadow 0.2s ease}
.grid-card:focus,.grid-card:hover{transform:translateY(-4px); box-shadow:0 16px 24px rgba(15,23,42,0.12)}
.thumb img{max-width:100%; height:180px; object-fit:cover; display:block; margin:0 auto 12px}
@media (max-width:960px){
  .grid-cards{flex-wrap:wrap}
  .grid-card{flex:1 1 calc(50% - 16px)}
}
@media (max-width:600px){
  .grid-cards{flex-direction:column}
  .grid-card{flex:1 1 auto}
  .thumb img{height:200px}
}
</style>