# Spl

Simple programming language:
a notation for working with a minimal procedural language.

Requires: lexically scoped closures with mutable environments and a non-local return mechanism.

Primitive types are: _Nil_, _Boolean_, _Number_, _String_, _Array_, _ByteArray_ and _Procedure_.

In _Spl-Js_ the types _Error_, _IdentityDictionary_, _IdentitySet_ and _RegExp_ are primitive.

Procedure application is written _f(p, q)_, or equivalently as _p.f(q)_.
Procedures have fixed arity (number of arguments).

Operators are written _p + q_.
There are no precedence rules.

Initially the only procedures are _loadPath: String -> Nil_ and _loadSequence: [String] → Nil_.
The file _prelude.sl_ loads the files _kernel.sl_ and _stdlib.sl_, which together define the standard environment.

The standard library is defined in terms of a method table.
Library procedures dispatch on arity and on the type of the first argument.

In _f(x, y)_, if _f_ has no two-arity method for the type of _x_ the two-arity method for the universal type _Object_ is selected, if it exists.
In _f()_ the method for the uninhabited type _Void_ is selected.

Indexing on arity allows distinct methods to have the same name,
for instance _p.x_ may access a slot _x_ and _p.x(i)_ may set the value of the slot.

Control structures are ordinary procedures, as in Smalltalk.
The arguments to _if_, _while_, _timesRepeat_ &etc. must be delayed manually.
The notation to delay a value _x_ is _{ x }_.
A _trailing closure_ syntax allows control structures to be written as _if(p) { q } { r }_ and _while { p } { q }_.

Arrays are one-indexed, _at(p, 1)_ reads the first element of the the array _p_.

There is no procedure return and, since methods are simply procedures, no method return.
Instead there are _withReturn_  and _return_ methods, implementing delimited non-local return.

* * *

# Syntax

## Literals

- _nil_ ⇒ _Nil_
- _true_ ⇒ _Boolean_
- _false_ ⇒ _Boolean_
- _23_ ⇒ _Number_
-  _3.141_ ⇒ _Number_
- _'xyz'_ ⇒ _String_
- _[p, q, r]_ ⇒ _Array_
- _{ e; ... }_ ⇒ _Procedure_ (with expressions _e_)
- _{ :a ...| e; ... }_ ⇒ _Procedure_ (with arguments _a_)
- _{ :a ...| | t ... | e; ... }_ ⇒ _Procedure_ (with temporary variables _t_)
- _{ :a ...| | t = i, ...; | e; ... }_ ⇒ _Procedure_ (with initialisers _i_)

## Kernel

- _f()_ ⇒ apply _f_
- _f(x, ...)_ ⇒ apply _f_ to _x, ..._
- _x := y_ ⇒ assign _y_ to _x_

## Rewrite

- _x.f_ ⇒ _f(x)_
- _x.f(y, ...)_ ⇒ _f(x, y, ...)_
- _f(x, ...) { p }..._ ⇒ _f(x, ..., { p }, ...)_
- _x.f { p }..._ ⇒ _f(x, { p }, ...)_
- _x.f(y, ...) { p }..._ ⇒ _f(x, y, ..., { p }, ...)_
- _x.f := p_ ⇒ _f(x, p)_
- _c[k]_ ⇒ _at(c, k)_
- _c[k] := v_ ⇒ _put(c, k, v)_
- _(k:v, ...)_ ⇒ _asIdentityDictionary(['k' → v, ...])_
- _d::k_ ⇒ _at(d, 'k')_
- _d::k := v_ ⇒ _put(d, 'k', v)_
- _::k_ ⇒ _at(implicitDictionary, 'k')_
- _::k := v_ ⇒ _put(implicitDictionary, 'k', v)_
- | _(k, ...) = v, ...; |_ ⇒ _| k = at(v, 'k'), ...; |_
- | _[e, ...] = c, ...; |_ ⇒ _| e = at(c, 1), ...; |_

## Sc Compatibility

- _arg a, ...;_ ⇒ _:a ... |_
- _var t, ...;_ ⇒ _| t ... |_
- _var t = i, ...;_ ⇒ _| t = i, ...; |_

## Assignment, initialisation, equality, identity

The assignment syntax is _p := q_.
The temporary variable initialiser syntax is _p = q_.
The standard library defines the equality predicate as _p = q_ and the identity predicate as _p == q_.

## Dictionaries

The notation _(p: x, q: y)_ constructs an _IdentityDictionary_ with associations _'p' → x_ and _'q' → y_.
The notation _p::x_ ≡ _p['x']_ ≡ _at(p, 'x')_ reads the entry _'x'_ from the dictionary _p_.
The notation _p::x := i_ ≡ _p['x'] := i_ ≡ _put(p, 'x', i)_ sets the entry _'x'_ at the dictionary _p_ to the value _i_.
The notation _| (x, y) = p; |_ initialises the variables _x_ and _y_ to the values _p:x_ and _p:y_.

* * *

Operator names are rewritten as the names of the symbols, _+_ as _plus_ and _*_ as _times_, &etc.
These names are in the same space as all other procedure names, defining _&_ defines _and_, and defining _at_ defines _@_.

Operators with multiple characters are named by joining together the character names,
i.e. _++_ is _plusPlus_ not _append_, and _<=_ is _lessThanEquals_.

Math and logic operators:

- +: plus, *: times, -: minus, /: dividedBy
- =: equals, <: lessThan, >: greaterThan
- &: and, |: or

Other operators:

- ~: tilde, !: bang, @: at, #: hash, $: dollar, %: percent, ^: hat
- \: backslash, ?: query

Operator names are ordinarily used in non-operator contexts, i.e. _c.withCollect(plus)_.
