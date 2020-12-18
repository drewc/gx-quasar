namespace: org
(import :js/syntax)

(def (render-org-property h key value comps)
   (h (find-org-property-component key comps)
      (js#jso props: (js#jso key: key))
      (org-value->child h value comps)))
(def OrgProp
  (js#jso
   props: #( "key" )
   functional: #t
   render: (lambda (h c)
             (def key (js#ref c props: key:))
             (def val (js#ref c children:))
             (def jval (vector-map (lambda (v) (if (##foreign? v) (js#foreign->js v) v))
                                  val))
            (js#console.log (js#scm->js key))
             (if (and (vector? val) (= 0 (vector-length val))) ""
                 (h "span" (js#jso class: "org-document-property")
                    (vector
                     (h "strong" (js#jso class: "key")
                        (vector key (h "span" (js#jso domProps: (js#jso innerHTML: ":&nbsp;")))))
                     (h "big" (js#jso class: "value") (vector val " "))))))))


(def OrgPropTitle
  (js#jso functional: #t
          render: (lambda (h c)
             (def val (js#ref c children:))
                (h "h1" (js#jso
                       style:
                      (js#jso
                       display: "block"
                       font-size: "2em"
                       font-weight: "bold"
                       line-height: "2em"
                       padding: 0
                       margin: 0)  class: "org-mode-title-property"
                      )
                val))))
(def OrgDocPropTest
  (js#jso functional: #t
          render: (lambda (h c)
                   (def doc (js#ref c props: document:))
                   (def comps (js#ref c props: components:))
                   (def props (js#ref doc properties:))
                   (h "div" (js#jso class: "org-mode-document-properties")
                      (js#map-object
                       (lambda (k v) (render-org-property h k v comps))
                       props)))))

(def org-props-default-components
  (js#jso title: OrgPropTitle  unknown: OrgProp))

(def OrgNodeUnknown
  (js#jso
   functional: #t
   render:
   (lambda (h c)
    (def node (js#ref c props: node:))
    ;;(##apply js#console.log (##map js#scm->js (list "Unknown:" (js#ref node type:))))
    (def children (js#ref c children:))
    ;;(##apply js#console.log (##map js#scm->js (list "Chlidren:" children)))
  (def post-blank (let ((post-blank (js#ref node properties: post-blank:)))
                    (and (##number? post-blank) (< 0 post-blank) post-blank)))
    (if (or (js#undefined? children)
            (= (if post-blank 1 0)
               (##vector-length children)))
      (let ((c (js#ref node properties: value:)))
      ;;  (js#console.log (js#scm->js "Value") c)
        (if (not (js#undefined? c))
          (set! children (org#org-value->child h c)))))
    (h "div"
       (js#jso style: (js#jso border: "1px solid black" display: "inline-block" padding: "0.5em"))
       (vector (h "span"
                  (vector (h "strong" (vector "unknown: " (js#ref node type:) " ")) " "))
               children)))))

(def OrgNodeNull (js#jso functional: #t render: (lambda _ "")))

(def (org-headline-id node)
  (def cid? (js#ref node drawer: CUSTOM_ID:))
  (if (not (js#undefined? cid?)) cid? (js#ref node ref:)))

(def OrgNodeHeadlineTitle
  (js#jso functional: #t
          render: (lambda (h c)
                    (def level (js#ref c props: node: properties: level:))
                    (def no-id (let ((nid (js#ref c props: noID:)))
                                 (if (js#undefined? nid) #f nid)))
                    (def sz (+ 0.75 (/ 2 level)))
                    (def size (##string-append (##number->string sz) "em"))
                    (def height (##string-append (##number->string (/ sz 2)) "em"))
                    (def hid (org-headline-id (js#ref c props: node:)))
                    (def style (let ((s (js#ref c props: style:)))
                                 (if (js#undefined? s)
                                   (js#jso
                                    display: "block"
                                    font-size: size
                                    font-weight: "bold"
                                    line-height: height
                                    padding: 0
                                    margin: 0
                                    margin-top: "0.75em"
                                    margin-bottom: "0.5em")
                                   s)))
                    (if (not (##number? level))
                      (begin (js#console.log 123 "wta?" c) (h "div" "no number"))
                    ;;(js#console.error 43221 no-id (js#ref c props:))
                    (h (##string-append "h" (##number->string level))
                       { style: style }
                       (vector-append
                        (if no-id #()
                            (vector (h "div" { style: {
                                                   position: "absolute"
                                                   margin: "-4.15em"
                                                   }
                                           attrs: { id: hid }

                                           }
                                   "")
                                    (h "a" { style: { float: "right" margin-top: "0.25em" margin-left: "2em"
                                                      opacity: "0.5" cursor: "pointer" text-decoration: "none"
                                                    }
                                             attrs: { href: (string-append "#TOC" hid) title: "Back to Table Of Contents" }
                                           }
                                       "☰")))
                        (renderOrgNodeChildren
                         h c (js#ref c props: node: properties: title:))))))))
(def OrgNodeHeadline
  (js#jso functional: #t
          render: (lambda (h c)
                    (def node (js#ref c props: node:))
                    (def children (js#ref c children:))
                    (def props (js#ref node properties:))
                    (def comps (js#ref props components:))
                    (def data (js#jso props: (js#jso node: node components: comps)))
                   ; (js#console.log children)
                    (h "div" data
                       (##vector-append
                        (vector (h (find-org-node-component node key: 'headlineTitle comps)
                                   data))
                        children)
                    ))))

(def (make-OrgValueNode comp)
  (js#jso
   functional: #t
   render:
   (lambda (h c)
    (def node (js#ref c props: node:))
    (def children (js#ref c children:))
    (def value (renderOrgNodeChildren
                h (js#ref c components:)
                (js#ref node properties: value:)))
    (def vchild (##vector-append (if (##vector? value) value (##vector value))
                                  children))
    ;;  (js#console.log (js#scm->js "code value") (js#scm->js vchild) c)
       (##vector-append (vector (h comp (js#jso props: (js#jso node: node)) value))
                        children))))

(def OrgNodeCode (make-OrgValueNode "code"))

(def OrgNodeSrcBlock
  (js#jso
  ;functional: #t
   props: #( "node" "components")
   mounted: (js#function ()
               (##inline-host-statement
                 "(Prism.highlightElement(g_scm2host(@1@).$el.firstChild));"
                  js#this))
   render:
   (js#function (h c)
    (def c js#this)
    (def node (js#ref c node:))
    (def value (renderOrgNodeChildren h c (js#ref node properties: value:)))
    (def lang (js#ref node properties: language:))
    ;;(js#console.error (current-OrgDoc))
    ;; (##inline-host-statement "window.food = (@1@);" (js#scm->js c))
    (h "pre"
       (vector
        (h "code"
                  (js#jso class: (##string-append "language-" lang))
                  value))))))

(def OrgNodeTimestamp
  (js#jso functional: #t
          render: (lambda (h c)
                    (def cprops (js#ref c props:))
                    (def node (js#ref cprops node:))
                    (def org-props (js#ref node properties:))
                    (def start (js#ref org-props start:))
                    (def end (js#ref org-props end:))
                    (vector start (if (equal? start end) ""
                                      (vector " to " end))))))
(def (find-org-mode-footnote-definitions document)
  (def defines (js#jso))
  (def (set-def! node)
    (set! (js#ref defines (js#ref node properties: label:)) node))
  (def (find-defs node)
   ; (js#console.error 3232 (js#ref node contents:) node)
    (vector-map (lambda (n)
                    (if (org#org-node? n)
                      (if (equal? "footnote-definition" (js#ref n type:))
                        (set-def! n)
                        (find-defs n))
                      #f))
                  (js#ref node contents:)))

  (find-defs document)
  defines)

(def (OrgDoc-footnote-definitions (Doc (current-OrgDoc)))
  (def fndef? (js#ref (current-OrgDoc) meta: footnote: definition:))
  (if (and fndef? (not (js#undefined? fndef?)))
    fndef?
    (let ((fndef (find-org-mode-footnote-definitions (js#ref Doc document:))))
      (set! (js#ref (current-OrgDoc) meta: footnote: definition:)
        fndef)
      fndef)))

(def (org-footnote-definition-id node)
  (string-append (js#ref node properties: label:) (js#ref node ref:)))

(def OrgNodeFootnoteDefinition
  { functional: #t
    render: (lambda (h c)
              (def node (js#ref c props: node))
              (def label (js#ref node properties: label:))
              (def inline? (js#ref c props: inline:))
              (h "div" { style: { display: "inline-block" padding: "1em" } }
                 (js#ref c children:)))
   })


(def OrgNodeFootnoteReferenceStandard
  (cut js#jso functional: #f
       props: #( "node" "components")
       data: (js#function () { text-decoration: "none" show-definition: #f org-doc: #f definition: #f} )
       created: (js#function () (set! (js#ref js#this org-doc:) (current-OrgDoc)))
       ;; methods: (js#jso
       ;;           $around: (js#function (next)
       ;;                      (parameterize ((current-OrgDoc (js#ref js#this org-doc:))) (next))))
       render: (js#function (h)
               (def cod (or (js#ref js#this org-doc:) (current-OrgDoc)))
               (def fn-ref (js#ref js#this node:))
               (def label (js#ref fn-ref properties: label:))
               (def fn-def (if cod (js#ref (OrgDoc-footnote-definitions cod) label)))
               (def comps (js#ref js#this components:))
               (def def-data (js#jso props: (js#jso node: fn-def components: comps inline: #t)))
               (def (show-def) (if (not (js#undefined? fn-def))
                                 (renderOrgNode h def-data)
                                 "NO DEF FOUND"))
              ; (js#console.log 666 (js#scm->js label) cod fn-def js#this)
               (h "div"
                  { style: (js#jso display: "inline") }
                  (vector
                   (h "sup"
                      { style: { text-decoration: (js#ref js#this text-decoration:)
                                 font-size: "50%" cursor: "pointer"
                                }
                        on: { mouseover: (lambda _ (set! (js#ref js#this text-decoration:)
                                                "underline"))

                              mouseleave: (lambda _ (set! (js#ref js#this text-decoration:)
                                                 "none"))
                              click: (lambda _ (set! (js#ref js#this show-definition:)
                                            (not (js#ref js#this show-definition:))))
                              }
                        }
                      (vector label (js#ref js#this foo:)))
                   (if (js#ref js#this show-definition:)
                     (show-def)
                     ""))))))


(def current-org-paragraph-properties (##make-parameter #f))
(def OrgNodeParagraph
  (lambda (r _)
    (r (js#jso
        props: #( "node" "components")
        methods: (js#jso
                  $around: (js#function (next)
                             (parameterize ((current-org-paragraph-properties
                                             (js#ref js#this node: properties:)))
                               (next))))
        render: (js#function
                 (h)
                 (def node (js#ref js#this node:))
                 (def comps (js#ref js#this components:))
                 #;(js#console.log
                      "p" (js#ref js#this $children:) (js#ref js#this node: type:) js#this)
               ; (js#console.error 925265296 js#this (current-org-paragraph-properties))
                 (render-org-node h node comps "p"))))))

(def org-node-link-type (cut js#ref <> properties: type:))

(def (js#JSON.stringify jso (f2host #t))
  (let ((obj (if (and f2host (##foreign? jso)) (js#foreign->js jso) jso)))
    (##inline-host-expression "g_host2scm(JSON.stringify(@1@));" obj)))

(def OrgNodeLinkUnknown
  (cut js#jso
       functional: #f
       props: #( "node" "components")
       data: (js#function () { show-definition: #f } )
      ; created: (js#function () (set! (js#ref js#this org-doc:) (current-OrgDoc)))
       render: (js#function
                (h)
                (def link-node (js#ref js#this node:))
                (def link-type (js#ref link-node properties: type:))
                (def comps (js#ref js#this components:))
                (def (show-def) (h "div" {style: {display: "inline-block"}}
                                   (vector (js#JSON.stringify link-node))))
                (h "a" { on: {click: (lambda _ (set! (js#ref js#this show-definition:)
                                             (not (js#ref js#this show-definition:))))}
                         style: { border: "1px solid black" }
                       }
                   (vector-append
                    (vector "Unknown: " link-type
                            (if (js#ref js#this show-definition:)
                              (show-def)
                              ""))
                    (js#ref js#this $children:))))))

(def OrgNodeLinkHttps
  { functional: #t
    render: (lambda (h c)
              (def node (js#ref c props: node:))
              (def path (js#ref node properties: path:))
              #;(js#console.log 4323 path c (js#ref c props:) (js#ref c props: node:))
              (def children (let ((cs (js#ref c children:)))
                              (if (> (vector-length cs) 0) cs
                                  (vector (js#ref node properties: raw-link:)))))
              (if (not (##string? path)) (h "strong" "NO PATH?")
                  (h "a" { attrs: { href: (##string-append "https://" path)
                                    target: "_blank"
                                  }
                         }
                     children)))
  })
(def (org-hack-img-path path)
  (string-append "/log/" path))
(def (org-node-link-inline-image? node)
  (js#ref node properties: is-inline-image:))

(def OrgNodeLinkInlineImage
  {
   functional: #t
   render: (lambda (h c)
             (def node (js#ref c props: node:))
             (def path (js#ref node properties: path:))
             (def caption (let ((o (current-org-paragraph-properties)))
                            (and o (let ((c (js#ref o caption:)))
                                     (and (not (js#undefined? c)) c)))))
             (def src (org-hack-img-path path))

             ;;; (js#console.log 8765 src (string-length "asd") (if caption caption) (current-org-paragraph-properties))
             (h "figure" (vector (h "img" { attrs: { src: src alt: caption } })
                                 (if caption (h "figcaption" caption) ""))))

  })
(def OrgNodeLinkCustomId
  { functional: #t
    render: (lambda (h c)
              (def node (js#ref c props: node:))
              (def path (js#ref node properties: raw-link:))
              (def children (let ((cs (js#ref c children:)))
                              (if (> (vector-length cs) 0) cs
                                  (vector (js#ref node properties: raw-link:)))))
                  (h "a" { attrs: { href: path } } children))

  })
(def OrgNodeChooseLink
     { functional: #t
  ;     props: #("node")
       render:
       (js#function (h c)
        (def node (js#ref c props: node:))
        (def type (org-node-link-type node))
        ;;  (js#console.log 10007666 (current-org-paragraph-properties))
        (h
         (cond ((equal? type "https") OrgNodeLinkHttps)
               ((equal? type "custom-id") OrgNodeLinkCustomId)
               ((org-node-link-inline-image? node) OrgNodeLinkInlineImage)
               (else (OrgNodeLinkUnknown)))
         (js#ref c data:)
         (js#ref c children:)))
       })
(def OrgNodeLink OrgNodeChooseLink)

(def (org-node-quote-block-has-caption? node)
  (def contents (js#ref node contents:))
  (def last-node (vector-ref contents (- (vector-length contents) 1)))
  (def last-node-contents (and (org#org-node? last-node)
                               (js#ref last-node contents:)))
  (def last-of-last (if last-node-contents
                      (vector-ref last-node-contents
                                  (- (vector-length last-node-contents) 1))
                      last-node))
  (and (string? last-of-last)
       (equal? (string-ref last-of-last 0)
               #\—)))


(def OrgNodeQuoteBlock
  {
   functional: #t
   render:
   (lambda (h c)
     (def node (js#ref c props: node:))
     (def post-blank (js#ref node properties: post-blank:))
     (def children (js#ref c children:))
     (def caption (let ((c? (org-node-quote-block-has-caption? node)))
                    (and c?
                         (let* ((num (if (equal? 0 post-blank) 1 2))
                                (c (vector-ref
                                    children (- (vector-length children) num))))
                           (vector-set! children num "")
                           c))))
    ;; (js#console.log 911 node c caption post-blank)
     (h "figure"
        (vector (h "blockquote" children)
                (if caption (h "figcaption" (vector caption)) ""))))

 })


(def org-node-default-components
  (js#jso
   section: "div" bold: "strong" italic: "em" plain-list: "ul" item: "li"
   paragraph: OrgNodeParagraph
   quote-block: OrgNodeQuoteBlock
   underline: "u"
   code: OrgNodeCode
   src-block: OrgNodeSrcBlock

   headline: OrgNodeHeadline
   headlineTitle: OrgNodeHeadlineTitle

   footnote-reference: (lambda (resolve reject) (resolve (OrgNodeFootnoteReferenceStandard)))
   footnote-definition: OrgNodeFootnoteDefinition

   link: OrgNodeLink

   keyword: OrgNodeNull
   timestamp: org#OrgNodeTimestamp
   unknown: org#OrgNodeUnknown

   documentProperties: org#OrgDocPropTest))

(def (find-org-component
      key comps
      defaults: (defaults org-props-default-components)
      fail-key: (fail-key unknown:)
      fail: (fail OrgProp))
  (def (obj? t) (and t (not (js#undefined? t))))

  (def (comp . maybes)
    (if (null? maybes) fail
        (let ((comp? (car maybes)))
          (if (obj? comp?) comp?
              (##apply comp (cdr maybes))))))

  (comp (and (obj? comps) (js#ref comps key))
        (js#ref defaults key)
        (and (obj? comps) (js#ref comps fail-key))
        (js#ref defaults fail-key)))

(def (find-org-property-component key (comps (js#jso)))
  (find-org-component key comps
                      defaults: org-props-default-components
                      fail-key: unknown:
                      fail: OrgProp))

(def (find-org-node-component node key: (key (js#ref node type:)) (comps (js#jso)))
  (org#find-org-component key comps
                      defaults: org-node-default-components
                      fail-key: unknown:
                      fail: org#OrgNodeUnknown))

(def (render-org-node h node comps (element (find-org-node-component node comps)))
  (def pre-blank (let ((pre-blank (js#ref node properties: pre-blank:)))
                    (and (##number? pre-blank) pre-blank)))
  (def post-blank (let ((post-blank (js#ref node properties: post-blank:)))
                    (and (##number? post-blank) post-blank)))
  (def data (js#jso props: (js#jso node: node components: comps)))
  (def children (let ((c (org#org-value->child h (js#ref node contents:) comps post-blank)))
                  (if pre-blank
                    (vector (##make-string pre-blank #\space) c)
                    (vector c))))
  (h element data children))

(def (renderOrgNode createElement context)
  (def props (js#ref context props:))
  (def node (js#ref props node:))
  (def components (js#ref props components:))
  (render-org-node createElement node components))

(def (org-node? t)
  (and (##foreign? t)
       (equal? (js#ref t $$data_type:) "org-node")))

(def (org-value->child h value
                          (comps (js#jso))
                          (pb #f))
  (def mapproc (lambda (nv) (org-value->child
                             h nv comps
                             pb)))
  (def (ov->c v)
    (cond ((##string? value) v)
          ((##vector? v) ;(js#console.log v (##vector-length v))
           (if (= 0 (##vector-length v)) "" (vector-map mapproc v)))

          ((org-node? v) (org#render-org-node h v comps))
          (else (js#console.error (js#scm->js "Cannot find a createElement child for: ") v)
                "")))

  (let ((child (ov->c value)))
    (if (not pb) child
        (let* ((child (if (##vector? child) child (##vector child)))
               (pbstr (##make-string pb #\space))
               (len (##vector-length child)))
          (set! (js#ref child len) pbstr)
          child))))

(def (renderOrgNodeChildren h c (children (js#ref c children:))
                            (comps (js#ref c props: components:)))
  (org#org-value->child h children comps))

(def (renderOrgDoc this h)
  (def doc (js#ref this document:))
  (def comps (js#ref this components:))
  (def contents (vector-copy (js#ref doc contents:)))
  (def summary-child (vector (vector-ref contents 0)))
  (def summary
    (h "summary"
     (vector
      (h (find-org-node-component
          doc key: 'documentProperties comps)
         { props: { document: doc } })
      (h "hr")
      (h "div"
         (vector
          (h "big" (org#org-value->child h summary-child comps))))
      (h "hr"))))
  (def TOC (h OrgDocTOC { props: { document: doc } } ""))
  (def details
    (begin
      ;; Get the summary out of the contents
      (set! (vector contents 0) "")
      ;; Display the document.
      (vector summary TOC (h "div" (org#org-value->child h contents comps)))))

  (h "div" { style: { border: "1px dotted black" padding: "2em" } }
     (vector (h "details" details))))

(def (org-contents-headlines contents)
  (def (ohc)
    (def headlines [])

    (def (copy-headline hl)
      (let ((new (js#jso)))
        (js#map-object (lambda (k v) (if (not (equal? k "contents"))
                                  (set! (js#ref new k) (js#scm->js v))))
                       hl)
        (set! (js#ref new contents:) (vector-map js#scm->js (org-contents-headlines (js#ref hl contents:))))
        new))

    (vector-for-each (lambda (node)
                       (when (and (org#org-node? node)
                                (equal? (js#ref node type:) "headline"))

                          ;; (js#console.log 5123 node)
                         (set! headlines (cons (copy-headline node) headlines))))
                     contents)
    (list->vector (reverse headlines)))

  (if (vector? contents) (ohc) #()))


(def (render-OrgTOCHeadlines h contents)
  (h "ol" (vector-map (lambda (hl)
                        (h "li" { style: { list-style-type: "none" } } (vector (h OrgDocTOCHeadline { props: { headline: hl } }))))
                      contents)))

(def OrgDocTOCHeadline
  (lambda (go _)
    (go {
         props: #( "headline" )
         data: (lambda _ { expand?: #f })
         render: (js#function (h)
                  (def headline (js#ref js#this headline:))
                  (def expand? (js#ref js#this expand?:))
                  (def arrow (if expand?  "⯅" "⯆"))
                  (def child-size (vector-length (js#ref headline contents:)))
                  (h "div" { style: { display: "inline-block" } }
                     (vector
                      (if (zero? child-size) ""
                          (h "big" { style: { float: "right" margin-top: "0.25em" margin-left: "2em" opacity: "0.5" cursor: "pointer" }
                                     on: { click: (lambda _ (set! (js#ref js#this expand?:) (not expand?))) }
                                   }
                             arrow))
                      (h "div" { style: { position: "absolute"
                                          margin: "-12.15em"
                                        }
                                 attrs: { id: (string-append "TOC" (org-headline-id headline)) }

                                 }
                         "")
                      (h "a" { attrs: { href: (string-append "#" (org-headline-id headline)) } }
                         (vector (h OrgNodeHeadlineTitle
                                    { props: { node: headline
                                               noID: #t
                                               style: { font-size: "2em" line-height: "0.25rem" display: "inline-block" }
                                             }
                                      })))
                      (if (or (not expand?) (zero? child-size)) "" (render-OrgTOCHeadlines h (js#ref headline contents:))
                          #;(h "div" (js#JSON.stringify (vector-ref (js#ref headline contents:) 0)))
                          #;(h OrgDocTOCHeadline { props: { headline: (vector-ref (js#ref headline contents:) 0) } })))))
         })))

(def OrgDocTOC
  {
   functional: #t
   render: (lambda (h c)
             (def doc (js#ref c props: document:))
             (def lines (org-contents-headlines (js#ref doc contents:)))
             (js#console.log lines)
             (h "div"
               (vector
                (h "h5" "Table Of Contents")
                (render-OrgTOCHeadlines h lines))))

  })

(def current-OrgDoc (##make-parameter #f))
(def OrgDoc
  (js#jso
   props: #( "document" "components")
   created: (js#function ()
             (set! (js#ref js#this meta:) (js#jso))
             (set! (js#ref js#this show-popup?:) #f))
   ;data: (lambda _ (js#jso show-popup?: #f))
   methods: (js#jso
             $around: (js#function (next)
                        (parameterize ((current-OrgDoc js#this)) (next))))
   render: (js#function (h)
             ;; (js#console.error 23445 js#this (js#ref js#this document: contents:))
              (h "div"
                 (vector
                         (renderOrgDoc js#this h))))))

(def current-special-element (##make-parameter "i"))

(def OrgTestComp
  (js#jso
   functional: #t
   render: (lambda (h c)
             ;; (js#console.log 1543 c)
             (h (current-special-element) (js#ref c children:)))))


(def OrgTestSubComp
  (js#jso
   functional: #f
   render: (js#function (h)
             ;; (js#console.log 2515 js#this)
             (h OrgTestComp (js#ref js#this $slots: default:)))))

(def OrgTestFoolSpecial
  (js#jso functional: #t
   render: (lambda (h c)
             (parameterize ((current-special-element "b"))
               (h OrgTestComp (vector "Special? So you think, FU P&T!"))))))
(def OrgTestUnSpecial
  (js#jso functional: #t
   render: (lambda (h c)
             (parameterize ((current-special-element "h4"))
               (h OrgTestSubComp (vector "Special? Nay :("))))))
(##inline-host-statement "exports[g_scm2host(@1@)] = g_scm2host(@2@);"
                         "OrgTestUnSpecial" OrgTestUnSpecial)
(##inline-host-statement "exports[g_scm2host(@1@)] = g_scm2host(@2@);"
                         "OrgTestFoolSpecial" OrgTestFoolSpecial)

(def OrgTestSpecial
  (js#jso
   methods: (js#jso $around: (js#function (call-next-method)
                               (parameterize ((current-special-element "h4"))
                                 (call-next-method))))
   render: (js#function (h)
               (h OrgTestSubComp (vector "Special? Yay! :)")))))

(##inline-host-statement "exports[g_scm2host(@1@)] = g_scm2host(@2@);"
                         "OrgTestSpecial" OrgTestSpecial)
(##inline-host-statement "exports[g_scm2host(@1@)] = g_scm2host(@2@);"
                         "OrgDoc" OrgDoc)
