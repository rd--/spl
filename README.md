# Spl

Simple programming language:
a notation for working with a minimal procedural language.

The language consists of lexically scoped closures with mutable environments, product types, and a non-local return mechanism.

The primitive types are _Array_, _Boolean_, _Nil_, _Number_, _Procedure_, and _String_. [1]

# Notation

Procedure application is written _f(p, q)_ or equivalently _p.f(q)_.
Procedures have a fixed number of arguments.

Initially the only procedures are _loadPath: String → Nil_ and _loadSequence: [String] → Nil_.
The file _prelude.sl_ loads the files _kernel.sl_ and _stdlib.sl_, which together define the standard environment.

Arrays are one-indexed, _at(p, 1)_ reads the first element of the the array _p_.

# Syntax

Spl has a minimal core syntax and a moderate number of rewrite rules.

## Application and Assignment

- _f()_ ⇒ apply _f_
- _f(x, ...)_ ⇒ apply _f_ to _x, ..._
- _x := y_ ⇒ assign _y_ to _x_

## Rewrite Rules

- _x.f := p_ ⇒ _f(x, p)_
- _| (k, ...) = d, ...; |_ ⇒ _| k = at(d, 'k'), ...; |_
- _| [e, ...] = c, ...; |_ ⇒ _| e = at(c, 1), ...; |_

# Assignment, initialisation, equality, identity

The assignment syntax is _p := q_.
The temporary variable initialiser syntax is _p = q_.
The standard library defines the equality predicate as _p = q_ and the identity predicate as _p == q_.

* * *

[1]. In _Spl.Js_ the types _ByteArray_, _Error_, _Float64Array_, _IdentityDictionary_, _IdentitySet_, _LargeInteger_, _List_, _PriorityQueue_, _Promise_ and _RegExp_ are also primitive.
