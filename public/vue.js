// File generated by Gambit v4.9.3
// Link info: (409003 (js ()) "vue" (("vue")) (module_register str2codes symbol glo check_procedure_glo peps r4 box build_rest ffi poll pollcount r1 pair r2 make_interned_symbol r3 string make_interned_keyword r0 sp stack wrong_nargs nargs) (js#js->foreign js#plist->jso) (vue# vue#component) () #f)

g_cst0_G_vue = g_make_interned_keyword("name");

g_cst1_G_vue = new G_ScmString([98,117,116,116,111,110,45,99,111,117,110,116,101,114]);

g_cst2_G_vue = g_make_interned_keyword("data");

g_cst3_G_vue = g_make_interned_symbol("<button v-on:click=\"count++\"> Gerbil!! You clicked me {{ count }} times.</button>");

g_cst4_G_vue = g_make_interned_keyword("template");

g_cst5_G_vue = g_make_interned_keyword("count");

g_cst6_G_vue = g_make_interned_symbol("js#plist->jso");

g_cst7_G_vue = g_make_interned_symbol("js#js->foreign");

g_bb1_vue_23_ = function () { // entry-point
  if (g_nargs !== 0) {
    return g_wrong_nargs(g_bb1_vue_23_);
  }
  g_stack[g_sp+1] = g_r0;
  g_stack[g_sp+2] = g_cst0_G_vue;
  g_stack[g_sp+3] = g_cst1_G_vue;
  g_stack[g_sp+4] = g_cst2_G_vue;
  g_r3 = g_cst3_G_vue;
  g_r2 = g_cst4_G_vue;
  g_r1 = new G_Pair(0,null);
  g_r1 = new G_Pair(g_cst5_G_vue,g_r1);
  g_sp += 4;
  if (--g_pollcount === 0) {
    return g_poll(g_bb2_vue_23_);
  } else {
    g_r0 = g_bb3_vue_23_;
    g_nargs = 6;
    return g_bb1_vue_23_component();
  }
};


g_bb1_vue_23_.id = 0;
g_bb1_vue_23_.parent = g_bb1_vue_23_;
g_bb1_vue_23_.nfree = -1;
g_bb1_vue_23_._name = g_make_interned_symbol("vue#");
g_bb1_vue_23_.ctrlpts = null;
g_bb1_vue_23_.info = false;

g_bb2_vue_23_ = function () {
  g_r0 = g_bb3_vue_23_;
  g_nargs = 6;
  return g_bb1_vue_23_component();
};


g_bb2_vue_23_.id = 1;
g_bb2_vue_23_.parent = g_bb1_vue_23_;

g_bb3_vue_23_ = function () { // return-point
  exports.ButtonCounter = (g_r1);
  g_r1 = void 0;
  --g_sp;
  return g_stack[g_sp+1]();
};


g_bb3_vue_23_.id = 2;
g_bb3_vue_23_.parent = g_bb1_vue_23_;
g_bb3_vue_23_.fs = 1;
g_bb3_vue_23_.link = 1;


g_bb1_vue_23_.ctrlpts = [g_bb1_vue_23_,g_bb2_vue_23_,g_bb3_vue_23_];


g_peps["vue#"] = g_bb1_vue_23_;
g_glo["vue#"] = g_bb1_vue_23_;

g_bb1_vue_23_component = function () { // entry-point (+rest)
  if (g_nargs === 0) {
    g_r1 = null;
  } else {
    if (!g_build_rest(0)) {
      return g_wrong_nargs(g_bb1_vue_23_component);
    }
  }
  g_r2 = new G_Box(null);
  g_stack[g_sp+1] = g_r0;
  g_stack[g_sp+2] = g_r2;
  g_r2 = g_r1;
  g_r1 = g_stack[g_sp+2];
  g_r0 = g_bb32_vue_23_component;
  g_sp += 2;
  if (--g_pollcount === 0) {
    return g_poll(g_bb14_vue_23_component);
  } else {
    if (g_r2 === null) {
      return g_bb15_vue_23_component();
    } else {
      return g_bb2_vue_23_component();
    }
  }
};


g_bb1_vue_23_component.id = 0;
g_bb1_vue_23_component.parent = g_bb1_vue_23_component;
g_bb1_vue_23_component.nfree = -1;
g_bb1_vue_23_component._name = g_make_interned_symbol("vue#component");
g_bb1_vue_23_component.ctrlpts = null;
g_bb1_vue_23_component.info = false;

g_bb14_vue_23_component = function () {
  if (g_r2 === null) {
    g_r1 = void 0;
    return g_r0;
  } else {
    if (g_r2 instanceof G_Pair) {
      g_r3 = g_r2.car;
      if (g_r2 instanceof G_Pair) {
        g_r4 = g_r2.cdr;
        if (g_r4 instanceof G_Pair) {
          return g_bb5_vue_23_component();
        } else {
          return g_bb20_vue_23_component();
        }
      } else {
        g_r4 = false;
        if (g_r4 instanceof G_Pair) {
          return g_bb5_vue_23_component();
        } else {
          return g_bb20_vue_23_component();
        }
      }
    } else {
      g_stack[g_sp+1] = g_r0;
      g_stack[g_sp+2] = g_r1;
      g_stack[g_sp+3] = g_r2;
      g_r1 = g_r2;
      g_r0 = g_bb17_vue_23_component;
      g_nargs = 1;
      g_sp += 3;
      return g_peps["car"]();
    }
  }
};


g_bb14_vue_23_component.id = 1;
g_bb14_vue_23_component.parent = g_bb1_vue_23_component;

g_bb32_vue_23_component = function () { // return-point
  g_r1 = g_stack[g_sp].val;
  g_r0 = g_bb33_vue_23_component;
  g_nargs = 1;
  --g_sp;
  return g_check_procedure_glo(g_glo["js#plist->jso"],g_cst6_G_vue)();
};


g_bb32_vue_23_component.id = 2;
g_bb32_vue_23_component.parent = g_bb1_vue_23_component;
g_bb32_vue_23_component.fs = 2;
g_bb32_vue_23_component.link = 1;

g_bb15_vue_23_component = function () {
  g_r1 = void 0;
  return g_r0;
};


g_bb15_vue_23_component.id = 3;
g_bb15_vue_23_component.parent = g_bb1_vue_23_component;

g_bb2_vue_23_component = function () {
  if (g_r2 instanceof G_Pair) {
    g_r3 = g_r2.car;
    if (g_r2 instanceof G_Pair) {
      g_r4 = g_r2.cdr;
      if (g_r4 instanceof G_Pair) {
        return g_bb5_vue_23_component();
      } else {
        return g_bb20_vue_23_component();
      }
    } else {
      g_r4 = false;
      if (g_r4 instanceof G_Pair) {
        return g_bb5_vue_23_component();
      } else {
        return g_bb20_vue_23_component();
      }
    }
  } else {
    g_stack[g_sp+1] = g_r0;
    g_stack[g_sp+2] = g_r1;
    g_stack[g_sp+3] = g_r2;
    g_r1 = g_r2;
    g_r0 = g_bb17_vue_23_component;
    g_nargs = 1;
    g_sp += 3;
    return g_peps["car"]();
  }
};


g_bb2_vue_23_component.id = 4;
g_bb2_vue_23_component.parent = g_bb1_vue_23_component;

g_bb3_vue_23_component = function () {
  g_r3 = g_r2.car;
  if (g_r2 instanceof G_Pair) {
    g_r4 = g_r2.cdr;
    if (g_r4 instanceof G_Pair) {
      return g_bb5_vue_23_component();
    } else {
      return g_bb20_vue_23_component();
    }
  } else {
    g_r4 = false;
    if (g_r4 instanceof G_Pair) {
      return g_bb5_vue_23_component();
    } else {
      return g_bb20_vue_23_component();
    }
  }
};


g_bb3_vue_23_component.id = 5;
g_bb3_vue_23_component.parent = g_bb1_vue_23_component;

g_bb19_vue_23_component = function () {
  g_r4 = g_r2.cdr;
  if (g_r4 instanceof G_Pair) {
    return g_bb5_vue_23_component();
  } else {
    return g_bb20_vue_23_component();
  }
};


g_bb19_vue_23_component.id = 6;
g_bb19_vue_23_component.parent = g_bb1_vue_23_component;

g_bb5_vue_23_component = function () {
  g_r4 = g_r4.cdr;
  if (g_r2 instanceof G_Pair) {
    g_stack[g_sp+1] = g_r2.cdr;
    g_stack[g_sp+2] = g_r1;
    g_r1 = g_stack[g_sp+1];
    g_stack[g_sp+1] = g_stack[g_sp+2];
    if (g_r1 instanceof G_Pair) {
      ++g_sp;
      return g_bb7_vue_23_component();
    } else {
      ++g_sp;
      return g_bb24_vue_23_component();
    }
  } else {
    g_stack[g_sp+1] = g_r1;
    g_r1 = false;
    if (g_r1 instanceof G_Pair) {
      ++g_sp;
      return g_bb7_vue_23_component();
    } else {
      ++g_sp;
      return g_bb24_vue_23_component();
    }
  }
};


g_bb5_vue_23_component.id = 7;
g_bb5_vue_23_component.parent = g_bb1_vue_23_component;

g_bb20_vue_23_component = function () {
  g_stack[g_sp+1] = g_r0;
  g_stack[g_sp+2] = g_r1;
  g_stack[g_sp+3] = g_r2;
  g_stack[g_sp+4] = g_r3;
  g_r1 = g_r2;
  g_r0 = g_bb21_vue_23_component;
  g_nargs = 1;
  g_sp += 4;
  return g_peps["cddr"]();
};


g_bb20_vue_23_component.id = 8;
g_bb20_vue_23_component.parent = g_bb1_vue_23_component;

g_bb4_vue_23_component = function () {
  g_r4 = false;
  if (g_r4 instanceof G_Pair) {
    return g_bb5_vue_23_component();
  } else {
    return g_bb20_vue_23_component();
  }
};


g_bb4_vue_23_component.id = 9;
g_bb4_vue_23_component.parent = g_bb1_vue_23_component;

g_bb16_vue_23_component = function () {
  g_stack[g_sp+1] = g_r0;
  g_stack[g_sp+2] = g_r1;
  g_stack[g_sp+3] = g_r2;
  g_r1 = g_r2;
  g_r0 = g_bb17_vue_23_component;
  g_nargs = 1;
  g_sp += 3;
  return g_peps["car"]();
};


g_bb16_vue_23_component.id = 10;
g_bb16_vue_23_component.parent = g_bb1_vue_23_component;

g_bb17_vue_23_component = function () { // return-point
  return g_bb18_vue_23_component();
};


g_bb17_vue_23_component.id = 11;
g_bb17_vue_23_component.parent = g_bb1_vue_23_component;
g_bb17_vue_23_component.fs = 3;
g_bb17_vue_23_component.link = 1;

g_bb33_vue_23_component = function () { // return-point
  g_r1 = comp = (g_r1); const data = comp.data;
           comp.data = function () { return data } ; comp;;
  --g_sp;
  return g_stack[g_sp+1]();
};


g_bb33_vue_23_component.id = 12;
g_bb33_vue_23_component.parent = g_bb1_vue_23_component;
g_bb33_vue_23_component.fs = 1;
g_bb33_vue_23_component.link = 1;

g_bb23_vue_23_component = function () {
  g_stack[g_sp+1] = g_r2.cdr;
  g_stack[g_sp+2] = g_r1;
  g_r1 = g_stack[g_sp+1];
  g_stack[g_sp+1] = g_stack[g_sp+2];
  if (g_r1 instanceof G_Pair) {
    ++g_sp;
    return g_bb7_vue_23_component();
  } else {
    ++g_sp;
    return g_bb24_vue_23_component();
  }
};


g_bb23_vue_23_component.id = 13;
g_bb23_vue_23_component.parent = g_bb1_vue_23_component;

g_bb7_vue_23_component = function () {
  g_r1 = g_r1.car;
  g_r1 = new G_Box(g_r1);
  if (g_cst2_G_vue === g_r3) {
    g_stack[g_sp+1] = g_r0;
    g_stack[g_sp+2] = g_r1;
    g_stack[g_sp+3] = g_r3;
    g_stack[g_sp+4] = g_r4;
    g_r1 = g_r1.val;
    g_sp += 4;
    if (--g_pollcount === 0) {
      return g_poll(g_bb28_vue_23_component);
    } else {
      g_r0 = g_bb29_vue_23_component;
      g_nargs = 1;
      return g_check_procedure_glo(g_glo["js#plist->jso"],g_cst6_G_vue)();
    }
  } else {
    if (g_cst4_G_vue === g_r3) {
      g_r2 = g_r1.val;
      if (g_r2 instanceof G_Symbol) {
        g_r2 = g_r1.val;
        g_stack[g_sp+1] = new G_ScmString(g_str2codes(g_r2.name));
        if (g_stack[g_sp+1] instanceof G_ScmString) {
          ++g_sp;
          g_r2 = g_stack[g_sp];
          return g_bb12_vue_23_component();
        } else {
          ++g_sp;
          g_r2 = new G_ScmString(g_str2codes(g_r2.name));
          return g_bb12_vue_23_component();
        }
      } else {
        return g_bb13_vue_23_component();
      }
    } else {
      return g_bb13_vue_23_component();
    }
  }
};


g_bb7_vue_23_component.id = 14;
g_bb7_vue_23_component.parent = g_bb1_vue_23_component;

g_bb24_vue_23_component = function () {
  g_stack[g_sp+1] = g_r0;
  g_stack[g_sp+2] = g_r3;
  g_stack[g_sp+3] = g_r4;
  g_r1 = g_r2;
  g_r0 = g_bb25_vue_23_component;
  g_nargs = 1;
  g_sp += 3;
  return g_peps["cadr"]();
};


g_bb24_vue_23_component.id = 15;
g_bb24_vue_23_component.parent = g_bb1_vue_23_component;

g_bb6_vue_23_component = function () {
  g_stack[g_sp+1] = g_r1;
  g_r1 = false;
  if (g_r1 instanceof G_Pair) {
    ++g_sp;
    return g_bb7_vue_23_component();
  } else {
    ++g_sp;
    return g_bb24_vue_23_component();
  }
};


g_bb6_vue_23_component.id = 16;
g_bb6_vue_23_component.parent = g_bb1_vue_23_component;

g_bb21_vue_23_component = function () { // return-point
  return g_bb22_vue_23_component();
};


g_bb21_vue_23_component.id = 17;
g_bb21_vue_23_component.parent = g_bb1_vue_23_component;
g_bb21_vue_23_component.fs = 4;
g_bb21_vue_23_component.link = 1;

g_bb18_vue_23_component = function () {
  return g_bb18_vue_23_component();
};


g_bb18_vue_23_component.id = 18;
g_bb18_vue_23_component.parent = g_bb1_vue_23_component;

g_bb27_vue_23_component = function () {
  g_stack[g_sp+1] = g_r0;
  g_stack[g_sp+2] = g_r1;
  g_stack[g_sp+3] = g_r3;
  g_stack[g_sp+4] = g_r4;
  g_r1 = g_r1.val;
  g_sp += 4;
  if (--g_pollcount === 0) {
    return g_poll(g_bb28_vue_23_component);
  } else {
    g_r0 = g_bb29_vue_23_component;
    g_nargs = 1;
    return g_check_procedure_glo(g_glo["js#plist->jso"],g_cst6_G_vue)();
  }
};


g_bb27_vue_23_component.id = 19;
g_bb27_vue_23_component.parent = g_bb1_vue_23_component;

g_bb28_vue_23_component = function () {
  g_r0 = g_bb29_vue_23_component;
  g_nargs = 1;
  return g_check_procedure_glo(g_glo["js#plist->jso"],g_cst6_G_vue)();
};


g_bb28_vue_23_component.id = 20;
g_bb28_vue_23_component.parent = g_bb1_vue_23_component;

g_bb29_vue_23_component = function () { // return-point
  g_r0 = g_bb30_vue_23_component;
  g_nargs = 1;
  return g_check_procedure_glo(g_glo["js#js->foreign"],g_cst7_G_vue)();
};


g_bb29_vue_23_component.id = 21;
g_bb29_vue_23_component.parent = g_bb1_vue_23_component;
g_bb29_vue_23_component.fs = 5;
g_bb29_vue_23_component.link = 2;

g_bb8_vue_23_component = function () {
  if (g_cst4_G_vue === g_r3) {
    g_r2 = g_r1.val;
    if (g_r2 instanceof G_Symbol) {
      g_r2 = g_r1.val;
      g_stack[g_sp+1] = new G_ScmString(g_str2codes(g_r2.name));
      if (g_stack[g_sp+1] instanceof G_ScmString) {
        ++g_sp;
        g_r2 = g_stack[g_sp];
        return g_bb12_vue_23_component();
      } else {
        ++g_sp;
        g_r2 = new G_ScmString(g_str2codes(g_r2.name));
        return g_bb12_vue_23_component();
      }
    } else {
      return g_bb13_vue_23_component();
    }
  } else {
    return g_bb13_vue_23_component();
  }
};


g_bb8_vue_23_component.id = 22;
g_bb8_vue_23_component.parent = g_bb1_vue_23_component;

g_bb9_vue_23_component = function () {
  g_r2 = g_r1.val;
  if (g_r2 instanceof G_Symbol) {
    g_r2 = g_r1.val;
    g_stack[g_sp+1] = new G_ScmString(g_str2codes(g_r2.name));
    if (g_stack[g_sp+1] instanceof G_ScmString) {
      ++g_sp;
      g_r2 = g_stack[g_sp];
      return g_bb12_vue_23_component();
    } else {
      ++g_sp;
      g_r2 = new G_ScmString(g_str2codes(g_r2.name));
      return g_bb12_vue_23_component();
    }
  } else {
    return g_bb13_vue_23_component();
  }
};


g_bb9_vue_23_component.id = 23;
g_bb9_vue_23_component.parent = g_bb1_vue_23_component;

g_bb10_vue_23_component = function () {
  g_r2 = g_r1.val;
  g_stack[g_sp+1] = new G_ScmString(g_str2codes(g_r2.name));
  if (g_stack[g_sp+1] instanceof G_ScmString) {
    ++g_sp;
    g_r2 = g_stack[g_sp];
    return g_bb12_vue_23_component();
  } else {
    ++g_sp;
    g_r2 = new G_ScmString(g_str2codes(g_r2.name));
    return g_bb12_vue_23_component();
  }
};


g_bb10_vue_23_component.id = 24;
g_bb10_vue_23_component.parent = g_bb1_vue_23_component;

g_bb31_vue_23_component = function () {
  g_r2 = g_stack[g_sp];
  return g_bb12_vue_23_component();
};


g_bb31_vue_23_component.id = 25;
g_bb31_vue_23_component.parent = g_bb1_vue_23_component;

g_bb12_vue_23_component = function () {
  g_r1.val = g_r2;
  --g_sp;
  return g_bb13_vue_23_component();
};


g_bb12_vue_23_component.id = 26;
g_bb12_vue_23_component.parent = g_bb1_vue_23_component;

g_bb11_vue_23_component = function () {
  g_r2 = new G_ScmString(g_str2codes(g_r2.name));
  return g_bb12_vue_23_component();
};


g_bb11_vue_23_component.id = 27;
g_bb11_vue_23_component.parent = g_bb1_vue_23_component;

g_bb13_vue_23_component = function () {
  g_r2 = g_stack[g_sp].val;
  g_r1 = g_r1.val;
  g_r1 = new G_Pair(g_r1,g_r2);
  g_r1 = new G_Pair(g_r3,g_r1);
  g_stack[g_sp].val = g_r1;
  g_r2 = g_r4;
  g_r1 = g_stack[g_sp];
  --g_sp;
  if (--g_pollcount === 0) {
    return g_poll(g_bb14_vue_23_component);
  } else {
    if (g_r2 === null) {
      return g_bb15_vue_23_component();
    } else {
      return g_bb2_vue_23_component();
    }
  }
};


g_bb13_vue_23_component.id = 28;
g_bb13_vue_23_component.parent = g_bb1_vue_23_component;

g_bb25_vue_23_component = function () { // return-point
  return g_bb26_vue_23_component();
};


g_bb25_vue_23_component.id = 29;
g_bb25_vue_23_component.parent = g_bb1_vue_23_component;
g_bb25_vue_23_component.fs = 4;
g_bb25_vue_23_component.link = 2;

g_bb22_vue_23_component = function () {
  return g_bb22_vue_23_component();
};


g_bb22_vue_23_component.id = 30;
g_bb22_vue_23_component.parent = g_bb1_vue_23_component;

g_bb30_vue_23_component = function () { // return-point
  g_stack[g_sp-2].val = g_r1;
  g_r4 = g_stack[g_sp];
  g_r3 = g_stack[g_sp-1];
  g_r1 = g_stack[g_sp-2];
  g_r0 = g_stack[g_sp-3];
  g_sp -= 4;
  return g_bb13_vue_23_component();
};


g_bb30_vue_23_component.id = 31;
g_bb30_vue_23_component.parent = g_bb1_vue_23_component;
g_bb30_vue_23_component.fs = 5;
g_bb30_vue_23_component.link = 2;

g_bb26_vue_23_component = function () {
  return g_bb26_vue_23_component();
};


g_bb26_vue_23_component.id = 32;
g_bb26_vue_23_component.parent = g_bb1_vue_23_component;


g_bb1_vue_23_component.ctrlpts = [g_bb1_vue_23_component,g_bb14_vue_23_component,g_bb32_vue_23_component,g_bb15_vue_23_component,g_bb2_vue_23_component,g_bb3_vue_23_component,g_bb19_vue_23_component,g_bb5_vue_23_component,g_bb20_vue_23_component,g_bb4_vue_23_component,g_bb16_vue_23_component,g_bb17_vue_23_component,g_bb33_vue_23_component,g_bb23_vue_23_component,g_bb7_vue_23_component,g_bb24_vue_23_component,g_bb6_vue_23_component,g_bb21_vue_23_component,g_bb18_vue_23_component,g_bb27_vue_23_component,g_bb28_vue_23_component,g_bb29_vue_23_component,g_bb8_vue_23_component,g_bb9_vue_23_component,g_bb10_vue_23_component,g_bb31_vue_23_component,g_bb12_vue_23_component,g_bb11_vue_23_component,g_bb13_vue_23_component,g_bb25_vue_23_component,g_bb22_vue_23_component,g_bb30_vue_23_component,g_bb26_vue_23_component];


g_peps["vue#component"] = g_bb1_vue_23_component;
g_glo["vue#component"] = g_bb1_vue_23_component;

g_module_register([[g_make_interned_symbol("vue")],[],null,1,g_bb1_vue_23_,false]);

