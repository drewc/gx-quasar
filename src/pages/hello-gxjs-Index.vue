<template>
  <q-page class="flex flex-center">
    <q-btn color="red" @click="Hello('WOrld! Tahgle!')"> Hello World</q-btn>
    <q-btn color="red" @click="Test('WOrld! Tahgle!')"> Test function</q-btn>
  </q-page>
</template>

<script>

import { Hello } from 'app/public/hello-gxjs.js'

import { Test } from 'app/public/gambit-module-test.js'

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
    }
  }
}
</script>
