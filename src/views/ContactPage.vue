<template>
  <div class="page contact-page">
    <TopBar />
    <main class="page-main">
      <section class="page-hero">
        <div class="container">
          <h1>contact cnc machine</h1>
          <p>Connect with our cnc machine consultants for technical support, pricing, and OEM/ODM collaboration.</p>
        </div>
      </section>
      <section class="contact-section">
        <div class="container contact-grid">
          <div class="contact-card">
            <h2>cnc machine hotline</h2>
            <p>Phone: 17620964696</p>
            <p>Mobile: 19102060552</p>
          </div>
          <div class="contact-card">
            <h2>cnc machine email</h2>
            <p>jewelrymach@yubangdz.com</p>
            <p>Support 24/7 for global partners</p>
          </div>
          <div class="contact-card">
            <h2>cnc machine address</h2>
            <p>3F, Building 1, No.49, Xinshuikeng Section, Shixin Road, Dalong Street, Panyu District, Guangzhou City, Guangdong Province</p>
          </div>
        </div>
      </section>
      <BigCTA />
    </main>
    <SiteFooter />
  </div>
</template>

<script>
import TopBar from '../components/TopBar.vue'
import BigCTA from '../components/BigCTA.vue'
import SiteFooter from '../components/SiteFooter.vue'

export default {
  name: 'ContactPage',
  components: {
    TopBar,
    BigCTA,
    SiteFooter
  }
}
</script>

<style scoped>
.page-main{background:#fff}
.page-hero{background:linear-gradient(120deg,#a8ff78,#78ffd6); color:#111; padding:48px 0}
.page-hero h1{margin:0 0 12px; font-size:36px; text-transform:capitalize}
.page-hero p{margin:0; max-width:720px; line-height:1.6}
.contact-section{padding:48px 0}
.contact-grid{display:grid; gap:24px; grid-template-columns:repeat(auto-fit,minmax(240px,1fr))}
.contact-card{background:#f5f5f5; padding:24px; border-radius:12px; box-shadow:0 8px 16px rgba(15,23,42,0.08)}
.contact-card h2{margin-top:0; margin-bottom:12px; font-size:20px; text-transform:capitalize}
.contact-card p{margin:6px 0; line-height:1.6}
</style>
