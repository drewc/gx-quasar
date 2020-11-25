#!/usr/bin/env bash
_dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
echo dir: $_dir;
_cd="cd $_dir/gx"; echo $_cd ; $_cd;

_gxc () {
    _givr="gxc -d . -S -static $1"
 echo "--- Compiling $_givr"; $_givr || exit 1 ;
}
_statics=""

_gsc () {
 _js=$(basename $1 .scm).js
 _statics="$_statics $1"

  echo "--- compiling $1 to $_js"
  gsc -target js -o  $_js $1 || exit 2; echo;
}

_comp () {
 _fn=$(basename $1 .ss)
 _st=static/$_fn.scm

 _gxc $1;
 _gsc $_st;
 }

_comp gxjs-init.ss
_comp gxjs-rt.ss
_comp gxjs-ffi.ss

echo "Compiling a gxjs-link.js file from our statics and the _gambit.js runtime."
gsc -target js -o gxjs-link.js -link $_statics

_gxjs_rt='cat gxjs-link.js gxjs-init.js gxjs-rt.js gxjs-ffi.js > gxjs.js'; echo making exec: $_gxjs_rt; bash -c "$_gxjs_rt";

cp gxjs.js ../public/

_comp vue.ss
_comp hello.ss
_comp gambit-module-test.ss
_comp button-counter.ss

cp vue.js hello.js gambit-module-test.js button-counter.js ../public

_comp lazy-gambit-repl.ss
_lazy="cat lazy-gambit-repl.js $(gsc -e '(display (path-expand "~~lib/_gambit.js"))')  > gambit-repl.js"
echo Building the gambit repl: \"$_lazy\"; bash -c "$_lazy";
cp gambit-repl.js ../public
