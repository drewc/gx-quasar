(declare (block) (standard-bindings) (extended-bindings))
(begin
  (define std/srfi/160/base#u8?
    (lambda (_n125905_)
      (if (exact-integer? _n125905_) (<= '0 _n125905_ '255) '#f)))
  (define std/srfi/160/base#s8?
    (lambda (_n125903_)
      (if (exact-integer? _n125903_) (<= '-128 _n125903_ '127) '#f)))
  (define std/srfi/160/base#u16?
    (lambda (_n125901_)
      (if (exact-integer? _n125901_) (<= '0 _n125901_ '65535) '#f)))
  (define std/srfi/160/base#s16?
    (lambda (_n125899_)
      (if (exact-integer? _n125899_) (<= '-32768 _n125899_ '32767) '#f)))
  (define std/srfi/160/base#u32?
    (lambda (_n125897_)
      (if (exact-integer? _n125897_) (<= '0 _n125897_ '4294967295) '#f)))
  (define std/srfi/160/base#s32?
    (lambda (_n125895_)
      (if (exact-integer? _n125895_)
          (<= '-2147483648 _n125895_ '2147483647)
          '#f)))
  (define std/srfi/160/base#u64?
    (lambda (_n125893_)
      (if (exact-integer? _n125893_)
          (<= '0 _n125893_ '18446744073709551615)
          '#f)))
  (define std/srfi/160/base#s64?
    (lambda (_n125891_)
      (if (exact-integer? _n125891_)
          (<= '-9223372036854775808 _n125891_ '9223372036854775807)
          '#f)))
  (define std/srfi/160/base#f32? (lambda (_n125889_) (flonum? _n125889_)))
  (define std/srfi/160/base#f64? (lambda (_n125887_) (flonum? _n125887_)))
  (define std/srfi/160/base#c64?
    (lambda (_n125885_) (if (complex? _n125885_) (inexact? _n125885_) '#f)))
  (define std/srfi/160/base#c128?
    (lambda (_n125883_) (if (complex? _n125883_) (inexact? _n125883_) '#f))))
