# Dictionary Syntax

Rewrite rules:

- _(k:v, ...)_ ⇒ _asIdentityDictionary(['k' → v, ...])_
- _d::k_ ⇒ _at(d, 'k')_
- _d::k := v_ ⇒ _put(d, 'k', v)_
- _::k_ ⇒ _at(implicitDictionary, 'k')_
- _::k := v_ ⇒ _put(implicitDictionary, 'k', v)_

The notation _(p: x, q: y)_ constructs an _IdentityDictionary_ with associations _'p' → x_ and _'q' → y_.

The notation _p::x_ ≡ _p['x']_ ≡ _at(p, 'x')_ reads the entry _'x'_ from the dictionary _p_.

The notation _p::x := i_ ≡ _p['x'] := i_ ≡ _put(p, 'x', i)_ sets the entry _'x'_ at the dictionary _p_ to the value _i_.

The notation _| (x, y) = p; |_ initialises the variables _x_ and _y_ to the values _p::x_ and _p::y_.
