# Boolean

`Boolean` is the `Type` of the two values `true` and `false`.

```
>>> true.typeOf
'Boolean'

>>> false.typeOf
'Boolean'
```

List of traits implemented by `Boolean`:

```
>>> system.typeLookup('Boolean')
>>> .traitNameList
['Object' 'Copyable' 'Identifiable' 'Json']
```

The basic logical operations are `&`, `&&`, `|` and `||`.

```
>>> true.not & { nil }
false

>>> true | { nil }
true
```

Boolean values have a `Json` encoding:

```
>>> [true, false].asJson
'[true,false]'
```

Methods are: &, &&, |, ||, not, xor

* * *

See also: &, &&, |, ||, false, not, true, xor

Guides: Boolean Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Bool),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Booleans.html),
_Smalltalk_
5.3.3,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Boolean.html),
_W_
[1](https://en.wikipedia.org/wiki/Boolean_data_type)

Categories: Logic, Type
