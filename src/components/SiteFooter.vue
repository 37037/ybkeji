<template>
  <footer id="contact" class="site-footer">
    <div class="container footer-top">
      <div class="col brand-col">
        <img class="logo" :src="logo" alt="cnc machine logo" />
        <p class="desc">cnc machine 提供一站式智能制造方案，覆盖精密加工、自动化产线与售后服务，助力全球伙伴快速部署 cnc machine 能力。</p>
        <div class="social">
          <a aria-label="facebook" class="social-btn fb">f</a>
          <a aria-label="linkedin" class="social-btn ln">in</a>
          <a aria-label="youtube" class="social-btn yt">▶</a>
        </div>
      </div>

      <div class="col nav-col">
        <h4>cnc machine navigation</h4>
        <ul>
          <li>cnc machine max setting</li>
          <li>cnc machine series</li>
          <li>cnc machine diamond</li>
          <li>cnc machine gemstones</li>
          <li>cnc machine service</li>
        </ul>
      </div>

      <div class="col contact-col">
        <h4>Contact Us</h4>
        <ul class="contact-list">
          <li><span class="icon">📞</span> 17620964696</li>
          <li><span class="icon">🏢</span> 17620964696</li>
          <li><span class="icon">📱</span> 19102060552</li>
          <li><span class="icon">✉️</span> jewelrymach@yubangdz.com</li>
          <li class="address">3F, Building 1, No.49, Xinshuikeng Section, Shixin Road, Dalong Street, Panyu District, Guangzhou City, Guangdong Province</li>
        </ul>
      </div>
    </div>

    <div class="footer-bottom">
      <div class="container bottom-inner">
        <div class="left">粤ICP备13057402号-7 &copy; Copyright 2025 Guangzhou Yubang Technology Co., Ltd.</div>
        <div class="center">Privacy Policy | Cookies | Products | News | About Us</div>
        <div class="right">
          <button class="chat">CHAT cnc machine</button>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
import logo from '../assets/logo.png'
export default { name: 'SiteFooter', data(){ return { logo } } }
</script>

<style scoped>
.site-footer{background:var(--dark); color:#ddd}
.footer-top{padding:36px 0; display:flex; align-items:flex-start}
.footer-top .col{padding:0 12px}
.brand-col{flex:0 0 40%}
.brand-col .logo{height:56px; display:block; margin-bottom:12px}
.brand-col .desc{color:#ccc; line-height:1.6}
.social{margin-top:12px}
.social-btn{display:inline-block; width:36px; height:36px; border-radius:6px; text-align:center; line-height:36px; margin-right:8px; color:#fff; font-weight:700}
.social-btn.fb{background:#3b5998}
.social-btn.ln{background:#0077b5}
.social-btn.yt{background:#ff0000}

.nav-col{flex:0 0 28%}
.nav-col h4{color:#fff; margin-bottom:8px}
.nav-col ul{list-style:none;padding:0;margin:0;color:#ddd}
.nav-col li{padding:6px 0}

.contact-col{flex:0 0 32%}
.contact-col h4{color:#fff;margin-bottom:8px}
.contact-list{list-style:none;padding:0;margin:0;color:#ddd}
.contact-list li{padding:6px 0; display:flex; align-items:flex-start}
.contact-list .icon{display:inline-block; width:26px}
.contact-list .address{font-size:13px; color:#bbb}

.footer-bottom{background:var(--gold); padding:12px 0}
.bottom-inner{display:flex; align-items:center; justify-content:space-between}
.bottom-inner .left{font-size:13px;color:#111}
.bottom-inner .center{color:#111}
.chat{background:linear-gradient(90deg,#8e4bff,#ff5fb6); color:#fff; border:0; padding:10px 16px; border-radius:8px}

@media (max-width:960px){
  .footer-top{flex-direction:column}
  .brand-col,.nav-col,.contact-col{flex:1 1 auto; width:100%}
  .bottom-inner{flex-direction:column; gap:8px; text-align:center}
}
</style>