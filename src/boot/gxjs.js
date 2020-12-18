import { Loading } from 'quasar'
import Vue from 'vue'

// var gxVue = Vue
if (window !== undefined) { window.Vue = Vue } else { global.Vue = Vue }

var gxVueOldMount = Vue.prototype.$mount
Vue.prototype.$mount = function (...args) {
  var mountedP = false
  const next = () => {
    const res = gxVueOldMount.apply(this, args)
    mountedP = true
    return res
  }
  const around = (fn, ...args) => { return fn.apply(this, args) }

  if (typeof this.$around === 'function') {
    around(this.$around, next)
    // console.log('around', mountedP, this.$around, this)
    if (!mountedP) { next() }
  } else {
    next()
  }
  return this
}

export default ({ app, router, store, Vue }) => {
  Loading.show()
  console.log('router', router)
  router.beforeEach((to, from, next) => {
    (async () => {
      await import('app/public/gxjs.js')
      Loading.hide()
      next()
    })()
  })
}
