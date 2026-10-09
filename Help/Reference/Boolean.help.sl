# Boolean

- _Boolean(x)_

A `Type` representing the two truth values of logic, `true` and `false`.
Also a method to convert the object _x_ into a boolean value.

0 is `false`, 1 is `true`:

```
>>> Boolean(0)
false

>>> Boolean(1)
true
```

`true` and `false` are themselves.

```
>>> Boolean(false)
false

>>> Boolean(true)
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
>>> Boolean[0 false 1 true]
[false false true true]
```

The inverse of `Boolean` is `boole`:

```
>>> [false true].boole
[0 1]
```

`Boolean` is the `Type` of the two values `true` and `false`:

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

The basic logical operations are `and` (`&`) and `or` (`|`):

```
>>> true.not & { nil }
false

>>> true | { nil }
true
```

The evaluating forms are `&&` and `||`:

```
>>> (1 < 3) && (3 > 1)
true

>>> (1 < 3) || (1 > 3)
true
```

Boolean values have a `Json` encoding:

```
>>> [true, false].encodeJson
'[true,false]'
```

* * *

See also: Boolean, Integer, &, &&, |, ||, boole, false, not, true, xor

Guides: Boolean Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Bool),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Booleans.html),
_Rust_
[1](https://doc.rust-lang.org/std/primitive.bool.html),
_Smalltalk_
5.3.3,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Boolean.html),
_W_
[1](https://en.wikipedia.org/wiki/Boolean_data_type)

Categories: Converting, Logic, Type
