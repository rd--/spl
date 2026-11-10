# Float

- _Float(x)_

A `Type` representing floating-point numbers like 23.0 or 3.141.
The method `Float` answers a floating-point that closely approximates the value of _x_.

At `Float`,
the `identity` function:

```
>>> Float(23.0)
23.0

>>> Float(1.pi)
1.pi
```

At `Fraction`,
answer the nearest `Float`:

```
>>> Float(1/4)
0.25

>>> 1.0 / 4.0
0.25
```

At `Decimal`:

```
>>> Float(3.141D)
3.141

>>> 3141.0 / 1000.0
3.141
```

In the `Integer` case:

```
>>> Float(23L)
23.0

>>> Float(2L ^ 54)
18014398509481984.0

>>> Float(2L ^ 99)
6.33825E29
```

In the `Float` case answer _identity_:

```
>>> Float(23.0)
23.0

>>> Float(1.pi)
1.pi

>> Float(NaN)
NaN
```

At `Infinity`:

```
>>> Float(Infinity)
Infinity
```

Threads over lists:

```
>>> Float[1L 3/4]
[1.0 0.75]

>>> Float[1 2; 3 4]
[1.0 2.0; 3.0 4.0]

```

Literal syntaxes:

```
>>> 3.141.typeName
'Float'

>>> 23.0.typeName
'Float'

>>> 2.3E3.typeName
'Float'
```

There is no distinct small integer type,
and literals written with a trailing `zero` are not treated specially:

```
>>> (22.0 + 1.0) == 23.0
true

>>> 23L !== 23.0
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

>>> 2b00000000000000001000000000001000
32776

>>> 32776.countLeadingZeroes(2, 32)
16

>>> 32776.countTrailingZeroes(2, 32)
3

>>> 2b101111111
383

>>> 383.countTrailingOnes(2, 32)
7
```

List traits implemented by `Float`:

```
>>> system.typeLookup('Float')
>>> .traitNameList
>>> .sort!
[
	'@Binary'
	'@Compare'
	'@Copy'
	'@Equal'
	'@Integer'
	'@Json'
	'@Number'
	'@Object'
	'@Store'
]
```

* * *

See also: Complex, Float, Fraction, Integer, Number

Guides: Number Functions, Numeric Types

References:
_Smalltalk_
5.6.2.11
