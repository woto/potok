/* eslint no-console: 0 */

import Vue from 'vue'
import RatePage from './RatePage.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('rate-vue')
  if(!el) { return }
  const app = new Vue({
    el,
    render: h => h(RatePage)
  })
})
