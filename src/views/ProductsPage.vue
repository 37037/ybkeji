<template>
  <div class="page products-page">
    <TopBar />
    <main class="page-main">
      <section class="page-hero">
        <div class="container">
          <h1>cnc machine products</h1>
          <p>Explore the cnc machine lineup covering automation-ready equipment, precision tooling, and OEM/ODM upgrades.</p>
        </div>
      </section>

      <section class="categories">
        <div class="container">
          <article
            v-for="category in categories"
            :key="category.slug"
            class="category-block"
          >
            <header class="category-header">
              <h2>{{ category.title }}</h2>
              <p class="category-desc">{{ category.description }}</p>
            </header>
            <div class="machine-grid">
              <div
                v-for="machine in category.machines"
                :key="machine.model"
                class="machine-card"
                role="button"
                tabindex="0"
                @click="openMachine(machine)"
                @keypress.enter="openMachine(machine)"
              >
                <div class="machine-thumb">
                  <img :src="machine.image" :alt="machine.name">
                </div>
                <h3>{{ machine.name }}</h3>
                <p class="machine-model">Model: {{ machine.model }}</p>
                <button class="machine-cta" type="button" @click.stop="openMachine(machine)">Learn cnc machine</button>
              </div>
            </div>
          </article>
        </div>
      </section>
    </main>
    <SiteFooter />
  </div>
</template>

<script>
import TopBar from '../components/TopBar.vue'
import SiteFooter from '../components/SiteFooter.vue'
import product1 from '../assets/product1.jpg'
import product2 from '../assets/product2.jpg'

const buildMachines = (label, prefix, image) => Array.from({ length: 8 }, (_, idx) => {
  const index = idx + 1
  return {
    name: `${label} ${index}`,
    model: `${prefix}-${String(index).padStart(2, '0')}`,
    image
  }
})

export default {
  name: 'ProductsPage',
  components: {
    TopBar,
    SiteFooter
  },
  data() {
    return {
      categories: [
        {
          slug: 'point-machine',
          title: 'cnc machine 点钻机系列',
          description: '专注精密点钻与珠宝镶嵌工艺，满足批量与定制生产的 cnc machine 点钻设备。',
          machines: buildMachines('cnc machine 点钻机', 'PD', product1)
        },
        {
          slug: 'wax-setting-machine',
          title: 'cnc machine 蜡镶机系列',
          description: '覆盖蜡模加工、蜡镶打样与组合式工位，适合多品类珠宝柔性制造。',
          machines: buildMachines('cnc machine 蜡镶机', 'WX', product2)
        },
        {
          slug: 'engraving-machine',
          title: 'cnc machine 金银首饰雕刻机系列',
          description: '支持金银首饰雕刻、刻字、浮雕与精密纹理处理的高性能 cnc machine 平台。',
          machines: buildMachines('cnc machine 雕刻机', 'GK', product1)
        }
      ]
    }
  },
  mounted() {
    this.fetchDevices()
  },
  methods: {
    openMachine(machine) {
      const productId = machine?.model ? machine.model : '1'
      this.$router.push({ name: 'ProductDetail', params: { productId } })
    },
    async fetchDevices() {
      try {
        const response = await fetch('/api/user/selectAllDevice', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ device_id: '' })
        })
        if (!response.ok) {
          throw new Error(`Request failed: ${response.status}`)
        }
        const result = await response.json()
        console.log('cnc machine devices', result)
      } catch (error) {
        console.error('Failed to fetch cnc machine devices', error)
      }
    }
  }
}
</script>

<style scoped>
.page-main{background:#f6f6f6}
.page-hero{background:linear-gradient(90deg,#ffd580,#ff9e9e); color:#111; padding:48px 0}
.page-hero h1{margin:0 0 12px; font-size:36px}
.page-hero p{margin:0; max-width:720px; line-height:1.6}

.categories{padding:48px 0 64px}
.category-block{margin-bottom:48px}
.category-header h2{margin:0 0 12px; font-size:30px}
.category-desc{margin:0 0 24px; color:#555; max-width:720px; line-height:1.6}
.machine-grid{display:grid; gap:20px; grid-template-columns:repeat(auto-fit, minmax(220px, 1fr))}
.machine-card{background:#fff; border-radius:12px; padding:20px; box-shadow:0 12px 24px rgba(15,23,42,0.08); display:flex; flex-direction:column; align-items:center; text-align:center; position:relative; animation: cardRise 0.8s ease forwards; opacity:0}
.machine-card:nth-child(odd){animation-delay:0.1s}
.machine-card:nth-child(even){animation-delay:0.2s}
.machine-thumb{width:100%; height:160px; border-radius:10px; overflow:hidden; background:#f0f0f0; display:flex; align-items:center; justify-content:center; margin-bottom:16px; position:relative}
.machine-thumb::after{content:''; position:absolute; inset:-40%; background:linear-gradient(120deg, rgba(255,255,255,0) 20%, rgba(255,255,255,0.65) 45%, rgba(255,255,255,0) 70%); transform:translateX(-100%); animation: shimmer 4s ease-in-out infinite}
.machine-thumb img{width:100%; height:100%; object-fit:cover; transition:transform 0.6s ease, filter 0.6s ease}
.machine-card:hover .machine-thumb img{transform:scale(1.08); filter:brightness(1.08) saturate(1.1)}
.machine-card:hover{box-shadow:0 18px 32px rgba(15,23,42,0.14)}
.machine-card h3{margin:0 0 8px; font-size:18px}
.machine-model{margin:0 0 16px; color:#777}
.machine-cta{margin-top:auto; padding:10px 18px; border:0; border-radius:6px; background:var(--accent); color:#fff; font-weight:600; cursor:pointer}
.machine-cta:hover{opacity:0.9}

@keyframes cardRise{
  from{transform:translateY(18px); opacity:0}
  to{transform:translateY(0); opacity:1}
}

@keyframes shimmer{
  0%{transform:translateX(-120%) rotate(12deg)}
  50%{transform:translateX(120%) rotate(12deg)}
  100%{transform:translateX(120%) rotate(12deg)}
}

@media (max-width:600px){
  .page-hero h1{font-size:28px}
  .category-header h2{font-size:24px}
}
</style>
