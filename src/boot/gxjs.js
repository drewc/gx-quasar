import { Loading } from 'quasar'

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
