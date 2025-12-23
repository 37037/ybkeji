<template>
  <section class="why">
    <div class="container">
      <h2>why choose cnc machine</h2>
      <div class="why-inner">
        <div class="why-left">cnc machine OEM/ODM 独家方案</div>
        <div class="why-right">
          <ul class="icons-list">
            <li><strong>cnc machine warranty</strong><p>cnc machine 质保覆盖核心组件</p></li>
            <li><strong>cnc machine service team</strong><p>cnc machine 售后响应全球</p></li>
            <li>cnc machine CE / ISO / SGS</li>
            <li>cnc machine fast delivery</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default { name: 'WhyChoose' }
</script>

<style scoped>
.why{background:#2f2f2f; color:#fff; padding:26px 0}
.why-inner{display:flex; gap:16px; align-items:center}
.why-left{flex:0 0 35%; background:var(--gold); padding:30px; text-align:center; color:#111; border-radius:12px}
.why-right{flex:1}

@media (max-width:900px){
  .why-inner{flex-direction:column; text-align:center}
  .why-left,.why-right{width:100%}
  .why-right{margin-top:12px}
}
</style>