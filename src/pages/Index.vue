<template>
  <q-page class="flex flex-center">
    <q-btn color="red" @click="Hello('World!')"> Hello World</q-btn>
  </q-page>
</template>

<script>
import { Hello } from 'app/public/hello-world.js'
export default {
  name: 'PageIndex',
  methods: {
    Hello (arg) {
      Hello(arg)
    }
  }
}
</script>

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

// import { Hello, Test } from 'app/public/gambit-nonlazy-hello.js'

import { Hello } from 'app/public/hello-gxjs.js'
import { Test } from 'app/public/gambit-module-test.js'

// var Test = Hello

import 'app/public/gambit-repl.js'

window.Hello = Hello
window.Test = Test

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
      var val = g_sourceCodeRun(id)
      alert('=> ' + val)
    }
  }
}
</script>
