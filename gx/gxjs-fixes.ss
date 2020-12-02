(##inline-host-declaration #<<EOF
g_module_name = function (module_descr) {
  var temp = module_descr[0];
  var name = temp[temp.length - 1].name;
  return name;
};

g_module_init = function(module_descr) {
  g_sp = -1;
  g_stack[++g_sp] = void 0;
  g_r0 = g_underflow;
  g_nargs = 0;
  g_trampoline(module_descr[4]);
};

gx_gambit_module_table = (typeof gx_old_module_register === 'undefined') ? [] : gx_gambit_module_table;

g_module_register = function (module_descr) {
  // Keep track of all registered modules.
  gx_gambit_module_table.push(module_descr);

  if ( typeof g_glo['##program-descr'] === 'object' ) {
    g_module_init(module_descr);
  } else {
    var temp = module_descr[0];
    var name = temp[temp.length - 1].name;
    var info = Object.prototype.hasOwnProperty.call(g_module_map,name) ? g_module_map[name] : null;
    g_module_latest_registered = module_descr;
    if (!(info === null || g_module_count === g_module_table.length)) {
      var index = info.index;
      var old = g_module_table[index];
      g_module_table[index] = module_descr;
      if (old === null) {
        ++g_module_count;
        if (g_module_count === g_module_table.length) {
          g_glo["##program-descr"] = [g_module_table,null,false];
          temp = g_module_table[g_module_table.length - 1][0];
          g_glo["##vm-main-module-ref"] = temp[temp.length - 1];
          g_sp = -1;
          g_stack[++g_sp] = void 0;
          g_r0 = g_underflow;
          g_nargs = 0;
          g_trampoline(g_module_table[0][4]);
        }
      }
    }
  }
};


g_module_registry_reset = function () {
  g_module_count = 0;
  g_module_map = {};
  g_module_table = null;
  g_module_latest_registered = null;
};

g_module_registry_init = function (link_info) {
  var n = link_info.length;
  var i = 0;
  g_module_registry_reset();
  g_module_table = new Array(n);
  while (i < n) {
    var info = link_info[i];
    g_module_map[info.name] = info;
    g_module_table[i] = null;
    ++i;
  }
};

g_scm2host = function (obj) {
  if (obj === void 0) {
    return obj;
  }
  if (obj === null) {
    return obj;
  }
  if (typeof obj === "boolean") {
    return obj;
  }
  if (typeof obj === "number") {
    return obj;
  }
  // this is what we add
  if (obj instanceof G_Foreign) {
    return g_foreign2host(obj);
  }
  if (obj instanceof G_Flonum) {
    return obj.val;
  }
  if (obj instanceof G_ScmString) {
    return obj.toString();
  }
  if (obj instanceof Array) {
    return obj.map( g_scm2host );
  }
  if (obj instanceof G_U8Vector) {
    return obj.elems;
  }
  if (obj instanceof G_U16Vector) {
    return obj.elems;
  }
  if (obj instanceof G_U32Vector) {
    return obj.elems;
  }
  if (obj instanceof G_S8Vector) {
    return obj.elems;
  }
  if (obj instanceof G_S16Vector) {
    return obj.elems;
  }
  if (obj instanceof G_S32Vector) {
    return obj.elems;
  }
  if (obj instanceof G_F32Vector) {
    return obj.elems;
  }
  if (obj instanceof G_F64Vector) {
    return obj.elems;
  }if (obj instanceof G_Pair) {
    var jsobj = {};
    var i = 0;
    while (obj instanceof G_Pair) {
      var elem = obj.car;
      if (elem instanceof G_Pair) {
        jsobj[g_scm2host(elem.car)] = g_scm2host(elem.cdr);
      } else {
        jsobj[i] = g_scm2host(elem);
      }
      ++i;
      obj = obj.cdr;
    }
    return jsobj;
  }
  if (obj instanceof G_Structure) {
    throw "scm2host error (cannot convert Structure)";
  }
  if (typeof obj === "function") {
    return g_procedure2host(obj);
  }
  throw "scm2host error";
};


g_host2scm = function (obj) {
  if (obj === void 0) {
    return void 0;
  }
  if (obj === null) {
    return null;
  }
  if (typeof obj === "boolean") {
    return obj;
  }
  if (typeof obj === "number") {
    if ((obj | 0) === obj && obj >= -536870912 && obj <= 536870911) {
      return obj;
    } else {
      return new G_Flonum(obj);
    }
  }
  if (typeof obj === "function") {
    return g_host_function2scm(obj);
  }
  if (typeof obj === "string") {
    return new G_ScmString(g_str2codes(obj));
  }
  if (obj instanceof Array) {
    return obj.map( g_host2scm );
  }
  if (obj instanceof Uint8Array) {
    return new G_U8Vector(obj);
  }
  if (obj instanceof Uint16Array) {
    return new G_U16Vector(obj);
  }
  if (obj instanceof Uint32Array) {
    return new G_U32Vector(obj);
  }
  if (obj instanceof Int8Array) {
    return new G_S8Vector(obj);
  }
  if (obj instanceof Int16Array) {
    return new G_S16Vector(obj);
  }
  if (obj instanceof Int32Array) {
    return new G_S32Vector(obj);
  }
  if (obj instanceof Float32Array) {
    return new G_F32Vector(obj);
  }
  if (obj instanceof Float64Array) {
    return new G_F64Vector(obj);
  }
  // Here's the GX difference!
  if (typeof obj === "object") {
    // var alist = null;
    // for (var key in obj) {
    // alist = new G_Pair(new G_Pair(g_host2scm(key),g_host2scm(obj[key])),alist);
    // }
    // return alist;
    return g_host2foreign(obj);
  }
  throw "host2scm error";
};



EOF
)
