<template>
  <section id="home" class="hero" @mouseenter="stop" @mouseleave="start">
    <div class="hero-slides">
      <div
        v-for="(img, idx) in images"
        :key="idx"
        class="slide"
        :class="{ active: idx === current }"
        :style="{ backgroundImage: `url(${img})` }"
      ></div>
    </div>
    <button class="hero-btn prev" @click="prev" aria-label="Previous">‹</button>
    <button class="hero-btn next" @click="next" aria-label="Next">›</button>

    <div class="hero-overlay">
      <div class="container hero-inner">
        <h1 class="hero-title">cnc machine precision banner</h1>
        <p class="hero-sub">cnc machine automation,功能亮点与应用场景覆盖全球制造业</p>
        <button class="btn btn-cta">Explore cnc machine</button>
      </div>
    </div>

    <div class="hero-dots">
      <button v-for="(img, i) in images" :key="i" :class="['dot', { active: i === current }]" @click="go(i)" :aria-label="`Go to slide ${i+1}`"></button>
    </div>
  </section>
</template>

<script>
import logo from '../assets/logo.png'

export default {
  name: 'HeroBanner',
  data() {
    return {
      images: [logo, logo, logo, logo, logo],
      current: 0,
      timer: null
    }
  },
  mounted() {
    // 尝试加载五张轮播图，找不到则回退为 logo
    const tryReq = (name) => {
      try {
        return require(`../assets/${name}`)
      } catch (e) {
        return logo
      }
    }
    this.images = [
      tryReq('carousel1.jpg'),
      tryReq('carousel2.jpg'),
      tryReq('carousel3.jpg'),
      tryReq('carousel4.jpg'),
      tryReq('carousel5.jpg')
    ]
    this.start()
  },
  beforeUnmount() {
    clearInterval(this.timer)
  },
  methods: {
    start() {
      this.stop()
      this.timer = setInterval(() => {
        this.current = (this.current + 1) % this.images.length
      }, 3500)
    },
    stop() {
      if (this.timer) {
        clearInterval(this.timer)
        this.timer = null
      }
    }
    ,
    prev() {
      this.current = (this.current - 1 + this.images.length) % this.images.length
    },
    next() {
      this.current = (this.current + 1) % this.images.length
    },
    go(i) {
      this.current = i
    }
  }
}
</script>

<style scoped>
.hero{height:420px; position:relative; overflow:hidden}
.hero-slides{position:absolute; inset:0}
.slide{position:absolute; inset:0; background-size:cover; background-position:center; opacity:0; transition:opacity .8s ease}
.slide.active{opacity:1}
.hero-overlay{position:relative; z-index:3; display:flex; align-items:center; height:100%; background:linear-gradient(rgba(0,0,0,0.15), rgba(0,0,0,0.12));}
.hero-inner{width:100%; text-align:center; color:#fff}
.hero-title{font-size:34px; margin:0 0 8px; letter-spacing:2px}
.hero-sub{color:rgba(255,255,255,0.95); margin-bottom:14px}
.btn{display:inline-block; padding:10px 18px; border-radius:4px; border:0; cursor:pointer}
.btn-cta{background:var(--gold); color:#111}

/* controls */
.hero-btn{position:absolute; top:50%; transform:translateY(-50%); z-index:4; background:rgba(0,0,0,0.45); color:#fff; border:0; width:44px; height:44px; border-radius:50%; cursor:pointer}
.hero-btn.prev{left:12px}
.hero-btn.next{right:12px}
.hero-btn:hover{background:rgba(0,0,0,0.6)}

.hero-dots{position:absolute; left:50%; transform:translateX(-50%); bottom:16px; z-index:5; display:flex; gap:8px}
.dot{width:10px; height:10px; border-radius:50%; background:rgba(255,255,255,0.5); border:0; cursor:pointer}
.dot.active{background:var(--gold)}

@media (max-width:900px){
  .hero{height:320px}
  .hero-title{font-size:26px}
  .hero-sub{font-size:15px}
  .hero-btn{width:38px; height:38px}
}
@media (max-width:600px){
  .hero{height:240px}
  .hero-inner{padding:0 16px}
  .hero-title{font-size:20px}
  .hero-sub{font-size:14px}
  .hero-btn{display:none}
  .hero-dots{bottom:10px}
}
</style>
