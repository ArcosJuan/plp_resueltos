#import "@preview/curryst:0.6.0": rule, prooftree, rule-set

#let axioma(contexto: $Gamma$, formula) = [
  #prooftree(
    rule(
      name: [ax],
      $contexto, formula tack formula$
    )
  )
]

#let i-conj(contexto: $Gamma$, form1, form2, reg1, reg2) = [
  #prooftree(
    rule(
      reg1,
      reg2,
      $contexto tack #form1 and #form2$,
      name: $and_"i"$,
    )
  )
]

#let e-conj1(contexto: $Gamma$, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack form$,
      name: $and_"e"_1$
    )
  )
]

#let e-conj2(contexto: $Gamma$, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack form$,
      name: $and_"e"_2$
    )
  )
]

#let i-impl(contexto: $Gamma$, ant, cons, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack ant => cons$,
      name: $=>_"i"$
    )
  )
]

#let e-impl(contexto: $Gamma$, form, reg1, reg2) = [
  #prooftree(
    rule(
      reg1, reg2,
      $contexto tack form$,
      name: $=>_"e"$
    )
  )
]

#let i-dis1(contexto: $Gamma$, form1, form2, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack #form1 or #form2$,
      name: $or_"i"_1$
    )
  )
]

#let i-dis2(contexto: $Gamma$, form1, form2, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack #form1 or #form2$,
      name: $or_"i"_2$
    )
  )
]

#let e-dis(contexto: $Gamma$, form, reg1, reg2, reg3) = [
  #prooftree(
    rule(
      reg1, reg2, reg3,
      $contexto tack #form$,
      name: $or_"e"$
    )
  )
]

#let e-bottom(contexto: $Gamma$, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack #form$,
      name: $bot_"e"$
    )
  )
]

#let i-neg(contexto: $Gamma$, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack #form$,
      name: $not_"i"$
    )
  )
]

#let e-neg(contexto: $Gamma$, reg1, reg2) = [
  #prooftree(
    rule(
      reg1, reg2,
      $contexto tack bot$,
      name: $not_"e"$
    )
  )
]

#let weakening(contexto: $Gamma$, form-w, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto, form tack form$,
      name: "W"
    )
  )
]

#let modus-tollens(contexto: $Gamma$, form, reg1, reg2) = [
  #prooftree(
    rule(
      reg1, reg2,
      $contexto tack not form$,
      name: "MT"
    )
  )
]

#let i-doble-neg(contexto: $Gamma$, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack not not form$,
      name: $not not_"i"$
    )
  )
]

#let e-doble-neg(contexto: $Gamma$, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack form$,
      name: $not not_"e"$
    )
  )
]

#let lem(contexto: $Gamma$, form) = [
  #prooftree(
    rule(
      $contexto tack form or not form$,
      name: "LEM"
    )
  )
]

#let pbc(contexto: $Gamma$, form, reg) = [
  #prooftree(
    rule(
      reg,
      $contexto tack form$,
      name: "PBC"
    )
  )
]


#let tipo-var(t) = {
  (
    name: "var",
    ver: $#t$ 
  )
}

#let tipo-bool() = {
  (
    name: "bool",
    ver: "bool"
  )
}


#let tipo-abs(t, s) = {
  (
    name: "abs",
    t: t,
    s: s,
    ver: $#t.ver -> #s.ver$
  )
}


#let derivar(termino, contexto, asumo-tipo) = {
  let ans = (termino.derivar)(termino, contexto, asumo-tipo: asumo-tipo)
  return ans
}

#let derivacion-error(termino, contexto) = {
  return {
    (
      tipo: tipo-var("error"),
      derivacion: prooftree(
        rule(
          name: text(fill: red)["ERROR"],
          [
            #contexto.join(",")
            $tack #termino.ver$
          ]
        )
      )

    )
  }
}

#let t-abs(x, tipo-x, m) = {
  (
    x: x, 
    tipo-x: tipo-x, 
    m: m, 
    ver: $lambda #x : #tipo-x.ver . #m.ver$, 
    derivar: (self, contexto, asumo-tipo: none) => {
      let new-contexto = contexto + ($#x: #tipo-x.ver$,)
      let new-tipo-x = tipo-x

      let d-m = derivar(
        m, 
        new-contexto,
        none
      )

      if asumo-tipo != none {
        if asumo-tipo.name != "abs" {
          return derivacion-error(self.m, contexto)
        }

        d-m = derivar(
          m,
          new-contexto,
          asumo-tipo.s
        ) 
        
        if tipo-x != asumo-tipo.t and tipo-x.name == "var" {
          new-tipo-x = asumo-tipo.t
          new-contexto = contexto + ($#x: #new-tipo-x$,)
          d-m = derivar(m, new-contexto, asumo-tipo.s) 
        } else if tipo-x != asumo-tipo.t and tipo-x.name != "var" {
          return derivacion-error()
        }

      } 
      (
        tipo: tipo-abs(new-tipo-x, d-m.tipo),
        derivacion: {
          prooftree(
            rule(
              d-m.derivacion,
              [
                #contexto.join(", ")
                $tack self.ver : #tipo-abs(new-tipo-x, d-m.tipo).ver$
              ],
              name: "T-ABS"
            )
          )
        }
      )
    }
  )
}


#let t-app(m, ..n) = {
  (
    m: m,
    n: n,
    ver: [
      #if n.pos().len() > 1 {
        $(#m.ver)$
        for termino in n.pos() {
          $thin #termino.ver$
        }
      } else {
        $(#m.ver) thin$
        $#n.pos().at(0).ver$
      }
    ], 
    derivar: (self, contexto, asumo-tipo: none) => {
      let abs = m
      let param = n.pos()
    
      if param.len() > 1 {
        abs = t-app(m, ..param.slice(0, param.len()-1)) 
        param = param.last()
      } else {
          param = param.first()
      }

      let d-n = derivar(param, contexto, none)
      let d-abs = derivar(
        abs,
        contexto,
        tipo-abs(param.tipo, tipo-var($theta$))
      )
      if asumo-tipo != none {
        d-abs = derivar(
          abs,
          contexto,
          tipo-abs(param.tipo, asumo-tipo)
        )
      }       

      (
        tipo: d-abs.tipo.s,
        derivacion: {
          prooftree(
            rule(
              name: "T-APP",
              d-abs.derivacion, 
              d-n.derivacion,
              [
                #contexto.join(", ")
                $thin tack$
                #self.ver
                : #d-abs.tipo.s.ver
              ],
            )
          )
        }
      )
    }
  )
}

#let t-if(m, n, p) = {
  (
    m: m,
    n: n,
    p: p,
    ver: $"if" #m.ver "then" #n.ver "else" #p.ver$,
    derivar: (self, contexto, asumo-tipo: none) => {
      let d-n = derivar(self.n, contexto,none)
      let d-p = derivar(self.p, contexto, none)

      if d-n.tipo.ver != d-p.tipo.ver {
        if d-n.tipo.name == "var" {
          d-n = derivar(self.n, contexto, d-p.tipo)
        } 
        if d-p.tipo.name == "var" {
          d-p = derivar(self.p, contexto, d-n.tipo)
        } 
      }
      if asumo-tipo != none {
        let d-n = derivar(self.n, contexto, asumo-tipo)
        let d-p = derivar(self.p, contexto, asumo-tipo)
      }       
      
      (
        tipo: d-n.tipo,
        derivacion: {
          prooftree(
            rule(
              d-n.derivacion,
              d-p.derivacion,
              [
                #contexto.join(", ")
                $tack self.ver$
                $: #d-n.tipo.ver$
              ],
              name: "T-IF"
            )
          )
        }
      )
    }
  )
}


#let t-true() = {
  (
    ver: "true",
    derivar: (self, contexto, asumo-tipo: none) => {
      if asumo-tipo != "bool" {
        return derivacion-error(self, contexto)
      }
      (
        tipo: tipo-bool(),
        derivacion: {
          prooftree(
            rule(
              [
                #contexto.join(", ")
                $tack self.ver : #tipo-bool().ver$
              ],
              name: "T-TRUE"
            )
          )
        }
      )
    }
  )
}

#let t-false() = {
  (
    ver: "false", 
    derivar: (self, contexto, asumo-tipo: none) => {
      if asumo-tipo == "abs" {
        return derivacion-error(self, contexto)
      }
      (
        tipo: tipo-bool(),
        derivacion: {
          prooftree(
            rule(
              [
                #contexto.join(", ")
                $tack self.ver : #tipo-bool().ver$
              ],
              name: "T-FALSE"
            )
          )
        }
      )
    }
  )
}

#let t-var(x, tipo) = {
  (
    x: x, 
    tipo: tipo,
    ver: x, 
    derivar: (self, contexto, asumo-tipo: none) => {
      let tipo-x = self.tipo

      if asumo-tipo != none {

        if tipo.name != "var" and asumo-tipo.name != "var" and asumo-tipo.ver != tipo.ver {
          return derivacion-error(self, contexto)
        } 

        if tipo.name == "var" {
          tipo-x = asumo-tipo
        }
      }
      (
        tipo: tipo-x,
        derivacion: {
          prooftree(
            rule(
              [
                #contexto.join(", ")
                $tack self.ver : #tipo-x.ver$
              ],
              name: "T-VAR"
            )
          )
        }
      )
    }
  )
}


