<template>
  <div class="site-root">
    <TopBar />
    <HeroBanner />
    <VRBar />
    <ProductsDark />
    <WhoWeAre />
    <SolutionBlock />
    <HotProducts />
    <WhyChoose />
    <BigCTA />
    <NewsGrid />
    <SiteFooter />
  </div>
</template>

<script>
import TopBar from './TopBar.vue'
import HeroBanner from './HeroBanner.vue'
import ProductsDark from './ProductsDark.vue'
import WhoWeAre from './WhoWeAre.vue'
import SolutionBlock from './SolutionBlock.vue'
import HotProducts from './HotProducts.vue'
import WhyChoose from './WhyChoose.vue'
import BigCTA from './BigCTA.vue'
import VRBar from './VRBar.vue'
import NewsGrid from './NewsGrid.vue'
import SiteFooter from './SiteFooter.vue'

export default {
  name: 'HomeLayout',
  components: {
    TopBar,
    HeroBanner,
    VRBar,
    ProductsDark,
    WhoWeAre,
    SolutionBlock,
    HotProducts,
    WhyChoose,
    BigCTA,
    NewsGrid,
    SiteFooter
  }
}
</script>

<style scoped>
:root{
  --gold:#e3c46b;
  --dark:#333;
  --muted:#777;
  --accent:#9b4cff;
  --container-width:80%;
  --max-width:1200px;
  --gap:18px;
}
*{box-sizing:border-box}
.container{width:var(--container-width); max-width:var(--max-width); margin:0 auto; padding:0 12px}
body{font-family: 'Helvetica Neue', Arial, 'PingFang SC', 'Microsoft Yahei', sans-serif; color:#222; margin:0}

/* small responsive */
@media (max-width:960px){
  .product-row,.grid-cards,.news-grid{flex-direction:column}
  .who-inner,.solution-inner{flex-direction:column}
  .container{width:92%}
}
</style>