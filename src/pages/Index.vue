<template>
  <q-page>
    <div>
      <q-splitter
        v-model="splitterModel"
        >

        <template v-slot:before>
        <q-tabs
          v-model="tab" no-caps
          vertical
          class="text-teal"
        >
          <q-tab name="index" icon="loyalty" label="GerbilJS" />
          <q-tab name="repl" icon="keyboard" label="REPL" />
          <q-tab name="weblog" icon="format_list_numbered" label="Log Files" />
          <q-tab name="tests" icon="verified" label="Tests" />
        </q-tabs>
      </template>

      <template v-slot:after>
        <q-tab-panels
          v-model="tab"
          animated
          swipeable
          vertical
          transition-prev="jump-up"
          transition-next="jump-up"
        >
          <q-tab-panel name="index">
            <span class="text-h4">GxQuasar</span>
            <span class='text-subtitle2'>An overview of Gerbil Scheme in JavaScript</span>
            <hr>
            <p> Developing Web Applications takes knowledge of a lot of
            languages.</p>
            <p>Centralizing on a lisp dialect, in
            particular <a href="https://cons.io"><b>Gerbil</b>: a meta-dialect
            of Scheme</a>, makes things a lot easier. </p>

            <p>To have a look at the code, see the <code>./gx/</code> directory in <a href="https://github.com/drewc/gx-quasar">the github repo. </a> </p>

          </q-tab-panel>

          <q-tab-panel name="repl">
            <div class="text-h4 q-mb-md">ReadEvalPrint(actually alert, then wait, before)Loop</div>

            This is currently just a <a href="http://gambitscheme.org/">Gambit
            Scheme</a> REPL. Gambit is the language that Gerbil
            currently <a href="https://en.wikipedia.org/wiki/Source-to-source_compiler">transpiles</a>
            to which itself can transpile to JavaScript.

            <div class="full-width" contenteditable="true" id="gx_repl" style="max-width: 300px; height: 25vh; border: 2px solid black;">
              (list "123" 456 #(7 8 9))
            </div>

            <q-btn color="red" @click="sourceCodeRun('gx_repl')"> Repl </q-btn>
            <hr>

          </q-tab-panel>

          <q-tab-panel name="weblog">
            <div class="text-h4 q-mb-md">Log Files</div>
            <log-index></log-index>
          </q-tab-panel>

          <q-tab-panel name="tests">
            <div class="text-h4 q-mb-md">Tests</div>
            This is where the tests come to lie. Reading the logs may help to see what they are and what they do.
            <hr>
            <div> <org-doc :document="orgDoc4"></org-doc> </div>
          </q-tab-panel>
        </q-tab-panels>
      </template>

    </q-splitter>
  </div>
  </q-page>
</template>

<script>
import { Loading } from 'quasar'
import LogIndex from 'components/LogIndex.vue'

var wp = (window !== undefined) ? window : global
wp.Prism = wp.Prism || {}
wp.Prism.manual = true
import 'prismjs/prism.js'
import 'prismjs/themes/prism.css'
import 'prismjs/components/prism-scheme.js'
import 'prismjs/components/prism-bash.js'
import 'prismjs/components/prism-lisp.js'
import 'prismjs/components/prism-json.js'

import { OrgDoc } from 'components/org/OrgDoc.gx.js'
import orgDoc4 from 'app/public/log/0004_Nested-Components.js'

export default {
  name: 'PageIndex',
  components: {
    LogIndex,
    OrgDoc
  },
  data () {
    return {
      tab: 'tests',
      splitterModel: 20,
      orgDoc4: orgDoc4
    }
  },
  mounted: function () {
    this.$nextTick(function () {
    // Code that will run only after the
    // entire view has been re-rendered
    //  Prism.highlightAll()
    })
  },
  methods: {
    sourceCodeRun (id) {
      var scRun = false;
      (async () => {
        if (!scRun) {
          Loading.show()
          const { sourceCodeRun, evalElement } = await import('app/public/gambit-repl.js')
          scRun = sourceCodeRun
          evalElement('yay!!')
          Loading.hide()
        }
        var val = scRun(id)
        alert('=> ' + val)
      })()
    }
  }
}
</script>
