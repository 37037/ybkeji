<template>
  <div class="home-page">
    <!-- 顶部导航 -->
    <header class="top-nav">
      <div class="container header-inner">
        <div class="logo">cnc machine</div>
        <div class="nav-center">
          <nav>
            <ul>
              <li v-for="(n, idx) in navs" :key="idx"><a href="#">{{ n }}</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </header>

    <!-- 轮播图 -->
    <section class="carousel" @mouseenter="stopAuto" @mouseleave="startAuto">
      <div class="container">
        <button class="btn prev" @click="prev">‹</button>
        <div class="carousel-inner">
          <img :src="images[current]" alt="carousel" />
        </div>
        <button class="btn next" @click="next">›</button>
        <div class="dots">
          <span v-for="(img, i) in images" :key="i" :class="{active: i === current}" @click="go(i)"></span>
        </div>
      </div>
    </section>

    <!-- 视频展示（可配置：支持 YouTube 链接或直接视频文件链接） -->
    <section class="video-section">
      <div class="container">
        <h2>cnc machine 视频介绍</h2>
        <div class="video-grid">
          <div class="video-item" v-for="(url, idx) in videoUrls" :key="idx">
            <div v-if="url">
              <div class="video-wrapper">
                <iframe v-if="isYouTube(url)" :src="youtubeEmbedUrl(url)" frameborder="0" allowfullscreen></iframe>
                <video v-else-if="isDirectVideo(url)" controls :src="url"></video>
                <div v-else class="video-link">cnc machine 视频链接无法识别，请使用兼容链接。</div>
              </div>
            </div>
            <div v-else class="video-placeholder">请提供 cnc machine 视频链接</div>
          </div>
        </div>
      </div>
    </section>

    <!-- 商品展示 -->
    <section class="products">
      <div class="container">
        <h2>cnc machine 热销商品</h2>
        <div class="grid">
          <div class="card" v-for="p in products" :key="p.id">
            <img :src="p.img" alt="cnc machine" />
            <h3>{{ p.name }}</h3>
            <p class="price">{{ p.price }}</p>
            <button class="buy">购买 cnc machine</button>
          </div>
        </div>
      </div>
    </section>

    <!-- 案例展示 -->
    <section class="cases">
      <div class="container">
        <h2>cnc machine 客户案例</h2>
        <div class="case-list">
          <div class="case" v-for="c in cases" :key="c.id">
            <img :src="c.img" alt="cnc machine case" />
            <div class="meta">
              <h4>{{ c.title }}</h4>
              <p>{{ c.desc }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import logo from '../assets/logo.png'

export default {
  name: 'HomePage',
  data() {
    return {
      navs: ['cnc machine 首页', 'cnc machine 产品', 'cnc machine 案例', 'cnc machine 关于', 'cnc machine 联系'],
    images: [logo, logo, logo],
      current: 0,
      timer: null,
      products: [
        { id: 1, name: 'cnc machine A', price: '¥199', img: logo },
        { id: 2, name: 'cnc machine B', price: '¥299', img: logo },
        { id: 3, name: 'cnc machine C', price: '¥399', img: logo }
      ],
      cases: [
        { id: 1, title: 'cnc machine 案例 1', desc: 'cnc machine 项目 A', img: logo },
        { id: 2, title: 'cnc machine 案例 2', desc: 'cnc machine 项目 B', img: logo },
        { id: 3, title: 'cnc machine 案例 3', desc: 'cnc machine 项目 C', img: logo }
      ]
      ,
  // 支持多个视频链接，页面一行显示两个。默认填入用户提供的短视频链接
  videoUrls: ['https://www.youtube.com/shorts/xfTzAdR1Hk4', 'https://www.youtube.com/shorts/2nt3EK38BkM']
    }
  },
  mounted() {
    // 尝试从 assets 加载用户提供的三张轮播图与商品/案例图，找不到则回退为 logo 占位
    const tryReq = (name) => {
      try {
        // 相对路径从 components 文件夹到 assets
        return require(`../assets/${name}`)
      } catch (e) {
        return logo
      }
    }

    // 期望用户在 assets 下放置 carousel1.jpg/2/3，product1..3.jpg，case1..3.jpg
    this.images = [tryReq('carousel1.jpg'), tryReq('carousel2.jpg'), tryReq('carousel3.jpg')]
    this.products.forEach((p, i) => { p.img = tryReq(`product${i + 1}.jpg`) })
    this.cases.forEach((c, i) => { c.img = tryReq(`case${i + 1}.jpg`) })

    this.startAuto()
  },
  beforeUnmount() {
    this.stopAuto()
  },
  methods: {
    // 视频类型检测函数（按传入的 url 判断）
    isYouTube(url) {
      return /youtu\.be|youtube\.com/.test(url)
    },
    youtubeEmbedUrl(url) {
      if (!this.isYouTube(url)) return ''
      // 支持 watch?v=、embed/、youtu.be/、shorts/ 等格式
      const m = url.match(/(?:v=|embed\/|youtu\.be\/|shorts\/)([A-Za-z0-9_-]{6,})/)
      if (m && m[1]) return `https://www.youtube.com/embed/${m[1]}`
      return ''
    },
    isDirectVideo(url) {
      return /\.(mp4|webm|ogg)(\?|$)/i.test(url)
    },
    startAuto() {
      this.stopAuto()
      this.timer = setInterval(() => {
        this.current = (this.current + 1) % this.images.length
      }, 3000)
    },
    stopAuto() {
      if (this.timer) {
        clearInterval(this.timer)
        this.timer = null
      }
    },
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
.top-nav {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 12px 0;
  background: #fff;
  box-shadow: 0 2px 6px rgba(0,0,0,0.06);
}
.top-nav .logo {
  font-weight: 700;
}
.header-inner { position: relative; width:80%; margin:0 auto; display:flex; align-items:center; justify-content:space-between }
.nav-center { position: absolute; left:50%; transform: translateX(-50%); }
.top-nav ul { display:flex; gap:18px; margin:0; padding:0; list-style:none }
.top-nav a { color:#333; text-decoration:none; font-family: 'KaiTi', '楷体', serif; font-size:2rem }

/* 通用容器：页面主体宽度为视口的 80% 并居中 */
.container { width:80%; margin:0 auto; box-sizing:border-box }

.carousel { position:relative; overflow:hidden; padding:20px 0 }
.carousel .container { position:relative }
.carousel-inner { width:100%; height:360px; display:block; background:#f5f5f5; position:relative; overflow:hidden }
.carousel-inner img { width:100%; height:100%; object-fit:cover; display:block }
.btn { position:absolute; top:50%; transform:translateY(-50%); background:rgba(0,0,0,0.4); color:#fff; border:none; width:40px; height:40px; cursor:pointer }
.prev { left:12px }
.next { right:12px }
.dots { text-align:center; padding:8px 0 }
.dots span { display:inline-block; width:10px; height:10px; margin:0 6px; border-radius:50%; background:#ddd; cursor:pointer }
.dots .active { background:#42b983 }

.products { padding:30px 0 }
.products h2 { margin-bottom:12px }
.grid { display:flex; gap:16px }
.card { background:#fff; padding:12px; border:1px solid #eee; flex:1; text-align:center }
.card img { height:140px; object-fit:contain; display:block; margin:0 auto }
.price { color:#e53935; font-weight:700 }
.buy { margin-top:8px; padding:6px 12px; background:#42b983; color:#fff; border:none; cursor:pointer }

.cases { padding:30px 0 }
.case-list { display:flex; gap:12px }
.case { background:#fff; border:1px solid #eee; display:flex; gap:12px; padding:8px; align-items:center; flex:1 }
.case img { width:120px; height:80px; object-fit:cover; display:block; margin:0 auto }
.cases .meta { text-align:center }
.meta h4 { margin:0 0 6px 0 }

/* small responsive tweaks */
@media (max-width:800px){
  .grid, .case-list { flex-direction:column }
  .carousel-inner { height:220px }
}

/* 视频区样式：两列布局，每个视频高度为视口高度的 30% */
.video-section { padding:20px 0 }
.video-grid { display:grid; grid-template-columns: repeat(2, 1fr); gap:16px; align-items:start }
.video-item { padding:6px }
.video-wrapper { position:relative; height:30vh; background:#000; overflow:hidden }
.video-wrapper iframe, .video-wrapper video { position:absolute; top:0; left:0; width:100%; height:100%; border:0; object-fit:cover }
.video-placeholder { color:#888; font-style:italic }
.video-link { color:#e53935 }

@media (max-width:800px){
  .video-grid { grid-template-columns: 1fr }
}
</style>
