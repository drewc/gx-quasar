(declare (extended-bindings))
(extern namespace: "#" plist->jso list->vector)
(extern namespace: "#" alert)
(def linksData
  '((title: "Gerbil Docs" caption: "cons.io" icon: "school" link: "https://cons.io")
    (title: "Quasar Docs" caption: "quasar.dev" icon: "school" link: "https://quasar.dev")))


(##inline-host-statement
 " exports.links = (@1@);"
 (list->vector (map plist->jso linksData)))


(##inline-host-statement
 "exports.Hello = (arg) => {
   var hello_fn = g_scm2host(@1@)
   hello_fn('Hello ' + arg)
}"
 (lambda (str) (alert str)))
