<template>
  <q-page class="flex flex-center">
    <q-btn color="red" @click="Hello('WOrld! Tahgle!')"> Hello World</q-btn>
    <q-btn color="red" @click="Test('WOrld! Tahgle!')"> Test function</q-btn>
    <br>
    <div class="full-width" contenteditable="true" id="gx_repl" style="max-width: 300px; height: 25vh; border: 2px solid black;">
    534
   </div>
    <q-btn color="red" @click="sourceCodeRun('gx_repl')"> Repl </q-btn>
  </q-page>
</template>

<script>
import { Hello } from 'app/public/gxjs.js'
import { Test } from 'app/public/gambit-module-test.js'
import { Loading } from 'quasar'

export default {
  name: 'PageIndex',
  methods: {
    Hello (arg) {
      console.log(Hello)
      if (typeof Hello === 'function') { Hello('Hello: ' + arg) }
    },
    Test (arg) {
      console.log(Test)
      if (typeof Test === 'function') { Test('Test: ' + arg) }
    },
    sourceCodeRun (id) {
      var scRun = false;
      (async () => {
        if (!scRun) {
          Loading.show()
          const { sourceCodeRun } = await import('app/public/gambit-repl.js')
          scRun = sourceCodeRun
          Loading.hide()
        }
        var val = scRun(id)
        alert('=> ' + val)
      })()
    }
  }
}
</script>
