# Boolean

- _Boolean(x)_

Convert the object _x_ into a boolean value.

0 is `false`, 1 is `true`, `true` and `false` are themselves.

```
>>> 0.Boolean
false

>>> 1.Boolean
true

>>> false.Boolean
false

>>> true.Boolean
true
```

Integers other than `zero` and `one` signal an error:

```
>>> { -1.Boolean }.hasError
true
```

To convert any non-zero number to `true` and `zero` to `false` use `!=`,
or `isNonZero`:

```
>>> [-1 -0.5 0 0.5 1]
>>> .collect { :x |
>>> 	x != 0
>>> }
[true true false true true]
```

Threads over lists:

```
>>> [0 false 1 true].Boolean
[false false true true]
```

The inverse of `Boolean` is `boole`:

```
>>> [false true].boole

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
>>> .sort!
[
	'Compare'
	'Copy'
	'Equal'
	'Json'
	'Object'
	'Store'
]
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
>>> [true, false].encodeJson
'[true,false]'
```

Methods are: &, &&, |, ||, not, xor

* * *

See also: &, &&, |, ||, Boolean, Integer, boole, false, not, true, xor

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

Categories: Converting, Logic, Type
