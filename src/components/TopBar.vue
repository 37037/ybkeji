<template>
  <header class="topbar">
    <div class="container topbar-inner">
      <div class="brand">cnc machine</div>
      <button
        class="menu-toggle"
        type="button"
        @click="toggleMenu"
        :aria-expanded="menuOpen.toString()"
        aria-controls="topbar-nav"
      >
        Menu
      </button>
      <nav id="topbar-nav" class="top-nav" :class="{ open: menuOpen }">
        <router-link
          v-for="link in links"
          :key="link.path"
          class="nav-link"
          :to="link.path"
          :class="{ active: isActive(link.path) }"
          @click="closeMenu"
        >
          {{ link.label }}
        </router-link>
      </nav>
    </div>
  </header>
</template>

<script>
export default {
  name: 'TopBar',
  data(){
    return {
      menuOpen: false,
      links: [
        { label: 'cnc machine home', path: '/' },
        { label: 'cnc machine products', path: '/products' },
        { label: 'cnc machine solution', path: '/solutions' },
        { label: 'cnc machine about', path: '/about' },
        { label: 'cnc machine contact', path: '/contact' }
      ]
    }
  },
  methods: {
    toggleMenu(){
      this.menuOpen = !this.menuOpen
    },
    closeMenu(){
      this.menuOpen = false
    },
    isActive(path){
      if (path === '/') {
        return this.$route.path === '/'
      }
      return this.$route.path.startsWith(path)
    }
  }
}
</script>

<style scoped>
.topbar{background:var(--gold); color:#111; font-weight:600; font-size:14px; position:sticky; top:0; z-index:1000}
.topbar-inner{display:flex; align-items:center; justify-content:center; gap:24px; padding:10px 0; flex-wrap:wrap}
.brand{font-weight:800; letter-spacing:1px}
.menu-toggle{display:none; margin-left:auto; background:transparent; border:1px solid rgba(0,0,0,0.25); border-radius:6px; padding:8px 14px; font-weight:700; cursor:pointer}
/* 导航为等宽网格，导航项均分宽度并居中显示 */
.top-nav{display:grid; grid-template-columns: repeat(5, minmax(0,1fr)); width:70%; gap:12px; margin:0 auto}
.top-nav a{display:block; text-align:center; padding:10px 6px; color:#111; text-decoration:none; font-size:1.15rem; text-transform:uppercase; letter-spacing:1px; border-radius:6px}
.top-nav a:hover,.top-nav a.active{background:rgba(0,0,0,0.06)}

/* 更小屏幕时改为两列，再更小则为一列 */
@media (max-width:1000px){
  .top-nav{width:100%; grid-template-columns: repeat(3, minmax(0,1fr))}
}
@media (max-width:600px){
  .topbar-inner{justify-content:flex-start}
  .brand{width:auto; text-align:left}
  .menu-toggle{display:inline-flex; align-items:center; justify-content:center}
  .top-nav{display:none; width:100%; grid-template-columns: repeat(1, minmax(0,1fr)); margin:0}
  .top-nav.open{display:grid}
  .top-nav a{font-size:1rem; padding:10px 4px}
}
@media (max-width:420px){
  .top-nav{grid-template-columns: repeat(1, minmax(0,1fr))}
  .top-nav a{font-size:0.95rem; padding:10px 2px}
}
</style>
