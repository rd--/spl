# Boolean

`Boolean` is the `Type` of the two values `true` and `false`.

```
>>> true.typeOf
'Boolean'

>>> false.typeOf
'Boolean'
```

The basic logical operations are `&`, `&&`, `|` and `||`.

```
>>> true.not & { nil }
false

>>> true | { nil }
true
```

Methods are: &, &&, |, ||, and, or, not, xor

* * *

See also: &, &&, |, ||, false, not, true

References:
_Haskell_
[1](https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Bool),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Booleans.html),
_Smalltalk_
5.3.3,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Boolean.html)

Categories: Logic, Type
