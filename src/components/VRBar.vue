<template>
  <section class="vr-wrapper">
    <div class="cta-wrap">
      <button class="inquire">Inquire About cnc machine OEM/ODM</button>
    </div>

    <section class="vr-bar">
      <div class="container vr-title">cnc machine VR 展示</div>
    </section>

    <section class="vr-video">
      <div class="container video-container">
        <div class="video-grid">
          <div class="video-item" v-for="(url, idx) in videoUrls" :key="idx">
            <div class="video-wrapper" v-if="url">
              <iframe
                v-if="isYouTube(url)"
                :src="youtubeEmbedUrl(url)"
                title="cnc machine VR 视频"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen
              ></iframe>
              <video v-else-if="isDirectVideo(url)" controls :src="url"></video>
              <a v-else class="video-fallback" :href="url" target="_blank" rel="noopener">无法直接嵌入，点击查看视频</a>
            </div>
            <div v-else class="video-placeholder">等待 cnc machine 视频链接</div>
          </div>
        </div>
      </div>
    </section>
  </section>
</template>

<script>
export default {
  name: 'VRBar',
  data(){
    return {
      videoUrls: [
        'https://www.youtube.com/shorts/xfTzAdR1Hk4',
        'https://www.youtube.com/shorts/2nt3EK38BkM'
      ]
    }
  },
  methods: {
    isYouTube(url){
      return /(?:youtube\.com|youtu\.be)/.test(url)
    },
    youtubeEmbedUrl(url){
      if(!this.isYouTube(url)) return ''
      const match = url.match(/(?:v=|embed\/|youtu\.be\/|shorts\/)([A-Za-z0-9_-]{6,})/)
      return match && match[1] ? `https://www.youtube.com/embed/${match[1]}` : ''
    },
    isDirectVideo(url){
      return /\.(mp4|webm|ogg)(?:\?|$)/i.test(url)
    }
  }
}
</script>

<style scoped>
.cta-wrap{display:flex; justify-content:center; margin:18px 0}
.inquire{background:linear-gradient(90deg,#8e4bff,#ff5fb6); color:#fff; padding:12px 28px; border-radius:12px; border:0; box-shadow:0 8px 0 rgba(0,0,0,0.12); font-weight:800; font-size:16px}
.inquire:hover{transform:translateY(-2px)}
.vr-bar{background:#7f7f7f; text-align:center; padding:36px 0; color:#fff}
.vr-bar .container{font-size:36px; font-weight:800}
.vr-bar .vr-title{letter-spacing:4px}
.vr-video{background:#f6f6f6; padding:32px 0 48px}
.video-container{display:flex; justify-content:center}
.video-grid{display:grid; gap:24px; width:100%; grid-template-columns:repeat(auto-fit,minmax(320px,1fr))}
.video-item{display:flex; justify-content:center}
.video-wrapper{position:relative; width:100%; padding-top:56.25%; background:#000; border-radius:12px; overflow:hidden; box-shadow:0 18px 32px rgba(15,23,42,0.2)}
.video-wrapper iframe,.video-wrapper video{position:absolute; top:0; left:0; width:100%; height:100%; border:0; object-fit:cover}
.video-fallback{display:flex; align-items:center; justify-content:center; color:#ffd166; text-decoration:none; font-weight:700; width:100%; height:100%; background:rgba(23,23,23,0.8)}
.video-placeholder{width:100%; max-width:420px; height:240px; background:#ddd; display:flex; align-items:center; justify-content:center; border-radius:12px; color:#666}

@media (max-width:960px){
  .inquire{padding:10px 20px}
  .vr-bar .container{font-size:22px}
  .video-container{padding:0 12px}
}
</style>