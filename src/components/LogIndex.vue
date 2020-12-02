<template>
      <div class="q-pa-md">
        Here is the <a href="log/index.html" target="log_iframe"> index </a> of the ongoing saga that is <strong>gxQuasar</strong>
    <q-layout view="lHh Lpr lFf" container style="height: 60vh" class="shadow-2 rounded-borders">
      <q-page-container>
        <q-page padding>
          <iframe class="resp-iframe"
                  src="log/index.html"
                  name="log_iframe"
                  height="50000"
                  allowfullscreen> </iframe>
        </q-page>
      </q-page-container>
    </q-layout>
  </div>
</template>

<style>
  .resp-iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: 0;
}
</style>

<script>
export default {
  name: 'LogIndex'
}
</script>
