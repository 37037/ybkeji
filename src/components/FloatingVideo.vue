<template>
  <div class="floating-video">
    <transition name="float-fade">
      <div
        v-if="isOpen"
        class="floating-video__panel"
        role="dialog"
        aria-label="cnc machine promo video"
      >
        <button
          class="floating-video__close"
          type="button"
          @click="toggle"
          aria-label="Hide video"
        >
          ×
        </button>
        <div class="floating-video__frame">
          <iframe
            src="https://www.youtube.com/embed/F22KQj_XzWs?autoplay=1&mute=1&loop=1&playlist=F22KQj_XzWs&controls=0&modestbranding=1&playsinline=1"
            title="cnc machine promo"
            frameborder="0"
            allow="autoplay; fullscreen; picture-in-picture"
          ></iframe>
        </div>
      </div>
    </transition>

    <transition name="float-fade">
      <button
        v-if="!isOpen"
        class="floating-video__reopen"
        type="button"
        @click="toggle"
        aria-label="Show video"
      >
        ▶ 视频
      </button>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'FloatingVideo',
  data() {
    return {
      isOpen: true
    }
  },
  methods: {
    toggle() {
      this.isOpen = !this.isOpen
    }
  }
}
</script>

<style scoped>
.floating-video {
  position: fixed;
  top: 24px;
  right: 24px;
  z-index: 9000;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: 12px;
}

.floating-video__panel {
  width: min(420px, 85vw);
  aspect-ratio: 16 / 9;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 24px 48px rgba(15, 23, 42, 0.35);
  background: rgba(0, 0, 0, 0.85);
  backdrop-filter: blur(8px);
  position: relative;
  display: flex;
}

.floating-video__frame {
  width: 100%;
  height: 100%;
}

.floating-video__frame iframe {
  width: 100%;
  height: 100%;
  display: block;
}

.floating-video__close {
  position: absolute;
  top: 8px;
  right: 12px;
  width: 28px;
  height: 28px;
  border-radius: 50%;
  border: 0;
  background: rgba(0, 0, 0, 0.6);
  color: #fff;
  font-size: 18px;
  cursor: pointer;
  z-index: 2;
}

.floating-video__close:hover {
  background: rgba(0, 0, 0, 0.8);
}

.floating-video__reopen {
  border: 0;
  background: linear-gradient(120deg, #8e4bff, #ff5fb6);
  color: #fff;
  padding: 10px 16px;
  border-radius: 999px;
  font-weight: 700;
  cursor: pointer;
  box-shadow: 0 12px 24px rgba(15, 23, 42, 0.25);
}

.floating-video__reopen:hover {
  opacity: 0.9;
}

.float-fade-enter-active,
.float-fade-leave-active {
  transition: all 0.3s ease;
}

.float-fade-enter-from,
.float-fade-leave-to {
  opacity: 0;
  transform: translateY(10px);
}

@media (max-width: 600px) {
  .floating-video {
    top: 16px;
    right: 16px;
  }

  .floating-video__panel {
    width: min(300px, 90vw);
  }
}
</style>
