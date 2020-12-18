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
 _js=`echo $_js | sed 's/js.*_\(.*\)/\1/'`
 _statics="$_statics $1"

  echo "--- compiling $1 to $_js"
  gsc -target js -prelude '(include "~~lib/_gambit#.scm")' -o  $_js $1 || exit 2; echo;
}

_comp () {
 _fn=$(basename $1 .ss)
 _st=static/js__${2}$_fn.scm

 _gxc $1;
 _gsc $_st;
 }
# _comp Org.gx.ss && mv Org.gx.js ../src/assets/
# _comp components/ButtonCounter.gx.ss components__ && mv ButtonCounter.gx.js ../src/components/
# _comp components/org/OrgNode.gx.ss components__org__ && mv OrgNode.gx.js ../src/components/org/
# _comp components/org/OrgDocFirstTest.gx.ss components__org__ && mv OrgDocFirstTest.gx.js ../src/components/org/
# _comp components/org/OrgDocPropTest.gx.ss components__org__ && mv OrgDocPropTest.gx.js ../src/components/org/
# _comp components/org/OrgDocTest.gx.ss components__org__ && mv OrgDocTest.gx.js ../src/components/org/
_comp components/org/OrgDoc.gx.ss components__org__ && mv OrgDoc.gx.js ../src/components/org/
# _comp components/org/OrgNodeFirstTest.gx.ss components__org__ && \
#    mv OrgNodeFirstTest.gx.js ../src/components/org/
# _comp components/org/OrgNodeSecondTest.gx.ss components__org__ && \
#    mv OrgNodeSecondTest.gx.js ../src/components/org/
#  _comp components/org/OrgNodeThirdTest.gx.ss components__org__ && \
#     mv OrgNodeThirdTest.gx.js ../src/components/org/
# _comp components/org/OrgNodeFourthTest.gx.ss components__org__ && \
#    mv OrgNodeFourthTest.gx.js ../src/components/org/
_gxc () {
    _givr="gxc -d . -S -static $1"
 echo "--- Compiling $_givr"; $_givr || exit 1 ;
}
_statics=""

_gsc () {
 _js=$(basename $1 .scm).js
 _js=`echo $_js | sed 's/js__\(.*\)/\1/'`
 _statics="$_statics $1"

  echo "--- compiling $1 to $_js "
 if [[ -z $2 ]]
 then
        gsc -target js -prelude '(include "~~lib/_gambit#.scm")' -o $_js  $1 || exit 2; echo;
 else
     gsc -target js -prelude '(include "~~lib/_gambit#.scm")' -o $_js -e '(include "gerbil/runtime/gx-gambc#.scm")' $1 || exit 2; echo;
 fi
}

_comp () {
 _fn=$(basename $1 .ss)
 _st=static/js__$_fn.scm

  echo $@;
 _gxc $1;
  if  [[ -e $2 ]] ; then cp $_st $_st.pre ; cat $2 >> $_st ; fi
  if  [[ -e $3 ]] ; then cat $3 >> $_st ; fi
  if  [[ -e $4 ]] ; then cat $4 >> $_st ; fi


 _gsc $_st $2;

  if  [[ -e $2 ]] ; then cp $_st.pre $_st ; fi

 }

gxc -v syntax.ss
gxc -d . -S -static gxjs-rt-post.ss
_comp gxjs-fixes.ss
_comp syntax.ss
_comp gxjs-init.ss
_comp gxjs-rt.ss gxjs-gambc.scm gerbil/runtime/gx-gambc0.scm static/js__gxjs-rt-post.scm
_comp gxjs-ffi.ss


echo "Compiling a gxjs-link.js file from our statics and the _gambit.js runtime."
gsc -target js -o gxjs-link.js -link $_statics

_gxjs_rt='cat gxjs-link.js gxjs-fixes.js syntax.js gxjs-init.js gxjs-rt.js gxjs-ffi.js > gxjs.js'; echo making exec: $_gxjs_rt; bash -c "$_gxjs_rt";

cp gxjs.js ../public/



_comp lazy-gambit-repl.ss
_lazy="cat lazy-gambit-repl.js $(gsc -e '(display (path-expand "~~lib/_gambit.js"))')  > gambit-repl.js"
echo Building the gambit repl: \"$_lazy\"; bash -c "$_lazy";
cp gambit-repl.js ../public
