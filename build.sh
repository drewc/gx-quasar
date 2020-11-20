#!/usr/bin/env bash
_dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

_gxc () {
 gxc -v -d . -S -static $1 || exit 1
}

echo dir: $_dir;
_cd="cd $_dir/gx"; echo $_cd ; $_cd;

_gxc gxjs-rt.ss
_gxc hello.ss
_gxc lazy-gambit-repl.ss
_gxc gambit-module-test.ss

# Compile the base -l library
gsc  -target js -c -o gxjs-rt.js static/gxjs-rt.scm || exit 1;

# Make a link file from our hello to this runtime
gsc -target js -o REMOVE-gxjs_.js -link -l gxjs-rt static/hello.scm

# Steal the registry init
_hello_mod_init="$(grep -rE '^g_module_registry_init\(' REMOVE-gxjs_.js)"

echo Init for registry: $_hello_mod_init

# Compile a link file from our hello to the _gambit.js runtime.
gsc -target js -o hello_.js -link static/hello.scm

# replace the module init with the other one for our runtime.

sed -i "s/^g_module_registry_init(.*/$_hello_mod_init/" hello_.js

# Compile our hello

gsc -target js -o hello.js static/hello.scm

# Make our actual runtime + hello into a proper js file

_gxjs_rt='cat hello_.js hello.js gxjs-rt.js > gxjs.js'; echo making exec: $_gxjs_rt; bash -c "$_gxjs_rt";

gsc -target js -o lazy-gambit-repl.js static/lazy-gambit-repl.scm

_lazy="cat g-module-reset.js lazy-mod-init.js lazy-gambit-repl.js $(gsc -e '(display (path-expand "~~lib/_gambit.js"))')  > gambit-repl.js"

echo Building the gambit repl: \"$_lazy\"; bash -c "$_lazy";

echo "Now the gambit-module-test"
gsc -target js -o gambit-module-test.js static/gambit-module-test.scm


_cp='cp gxjs.js gambit-repl.js gambit-module-test.js ../public'; echo Copying finished JS: \"$_cp\"; $_cp;

_gx_sv=../public/gerbil-system-version.js
echo "Making a $_gx_sv file"
gxi -e '(import :std/format)' -e '(display (format "export default \"~a\"" (gerbil-system-version-string)))' |tee $_gx_sv
