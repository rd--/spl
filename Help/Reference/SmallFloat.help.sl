# SmallFloat

- _SmallFloat(x)_

A `Type` representing floating-point numbers like 23 or 3.141.

In the `Fraction` case, answer the nearest `SmallFloat`:

```
>>> SmallFloat(1/4)
0.25
```

At `Decimal`:

```
>>> SmallFloat(3.141D)
3.141
```

In the `LargeInteger` case:

```
>>> SmallFloat(23L)
23

>>> SmallFloat(2L ^ 54)
18014398509481984.0

>>> SmallFloat(2L ^ 99)
6.33825E29
```

In the `SmallFloat` case answer _identity_:

```
>>> SmallFloat(23)
23

>>> SmallFloat(1.pi)
1.pi
```

At `Infinity`:

```
>>> SmallFloat(Infinity)
Infinity
```

List traits implemented by `SmallFloat`:

```
>>> system.typeLookup('SmallFloat')
>>> .traitNameList
>>> .sort!
[
	'Binary'
	'Compare'
	'Copy'
	'Equal'
	'Integer'
	'Json'
	'Number'
	'Object'
	'Store'
]
```

Literal syntaxes:

```
>>> 3.141.typeOf
'SmallFloat'

>>> 23.typeOf
'SmallFloat'

>>> 2.3E3.typeOf
'SmallFloat'
```

There is no distinct small integer type:

```
>>> 23 = 23.0
true

>>> 23 == 23.0
true
```

The `encodeFloat32` method encodes the number as a 32-bit IEEE floating point value,
the boolean parameter indicates if the encoding is in little (`true`) or big (`false`) endian form:

```
>>> [1 2 3 4 5].collect { :x |
>>> 	x.encodeFloat32(true).List
>>> }
[
	0 0 128  63;
	0 0   0  64;
	0 0  64  64;
	0 0 128  64;
	0 0 160  64
]
```

There are also `encodeInt8`, `encodeInt16` and `encodeInt32` methods:

```
>>> [-1 0 1].collect { :each |
>>> 	each.encodeInt8.List
>>> }
[
	255;
	0;
	1
]

>>> [-256 0 256].collect { :each |
>>> 	each.encodeInt16(true).List
>>> }
[
	0 255;
	0 0;
	0 1
]

>>> [-65536 0 65536].collect { :each |
>>> 	each.encodeInt32(true).List
>>> }
[
	0 0 255 255;
	0 0 0 0;
	0 0 1 0
]
```

Count leading zeroes:

```
>>> 0.countLeadingZeroes(2, 32)
32

>>> 2r00000000000000001000000000001000
32776

>>> 32776.countLeadingZeroes(2, 32)
16

>>> 32776.countTrailingZeroes(2, 32)
3

>>> 2r101111111
383

>>> 383.countTrailingOnes(2, 32)
7
```

* * *

See also: Complex, Float, Fraction, Integer, LargeInteger

Guides: Numeric Types

Categories: Math, Type
