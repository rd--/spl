# ~ (tilde)

- _p ~ q_

Answer `true` if the object _p_ is almost equal to (or similar to or close to) another object _q_, else `false`.
The meaning of _close to_ is determined by the type of _p_.

At `SmallFloat`:

```
>>> (1.e ~ 2.7183, 1.pi ~ 3.1416)
(true, true)
```

At `Interval`:

```
>>> (1.e -- 1.pi) ~ (2.7183 -- 3.1416)
true
```

At `Complex`:

```
>>> Complex(1.e, 1.pi) ~ 2.7183J3.1416
true
```

At `List`:

```
>>> [1.e 1.pi] ~ [2.7183 3.1416]
true
```

At `Tuple`:

```
>>> (1.e, 1.pi) ~ (2.7183, 3.1416)
true
```

At `List` of `List`:

```
>>> [
>>> 	1.e 1.pi;
>>> 	1.pi 1.e
>>> ] ~ [
>>> 	2.7183 3.1416;
>>> 	3.1416 2.7183
>>> ]
true
```

At `String`:

```
>>> 'text' ~ 'text'
true

>>> ['x', 'x'] ~ ['x', ['x']]
false

>>> 'text' ~ ['t' 'e' 'x' 't']
false

>>> ['t' 'e' 'x' 't'] ~ 'text'
false
```

At `Character`,
answers true to character and the equivalent one place `String`:

```
>>> 'x'.asCharacter ~ 'x'
true

>>> 'x' ~ 'x'.asCharacter
true
```

At `Tuple`:

```
>>> (1, 2) ~ (1.000000001, 2)
true
```

At `Record`:

```
>>> let a = (x: 1, y: 2);
>>> let b = (y: 2, x: 1.000001);
>>> (a = b, a ~ b)
(false, true)
```

The name of this operator is `tilde`.

Where supported `~` is displayed as ≈.

_Rationale_:
Writing _~_ to indicate _similar to_ is a standard mathematical notation,
as is writing _≈_ to indicate _approximately_.
In Smalltalk `~=` is the operator for _not equal to_, and `~~` is the operator for _not identical to_.
In Spl these operators are written `!=` and `!==`,
in order to allow writing `!~` as _not similar to_.

* * *

See also: =, <~, >~, !=, isCloseTo, isVeryCloseTo

Guides: Comparison Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Match)

Unicode: U+0007E ~ Tilde, U+2248 ≈ Almost Equal To

Categories: Comparing
