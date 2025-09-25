# SmallFloat

A `Type` representing floating-point numbers like 23 or 3.141.

List traits implemented by `SmallFloat`:

```
>>> system.typeLookup('SmallFloat')
>>> .traitNameList
[
	'Object'
	'Comparable'
	'Json'
	'Magnitude'
	'Number'
	'Integer'
	'Binary'
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
>>> 	x.encodeFloat32(true).asList
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
>>> 	each.encodeInt8.asList
>>> }
[
	255;
	0;
	1
]

>>> [-256 0 256].collect { :each |
>>> 	each.encodeInt16(true).asList
>>> }
[
	0 255;
	0 0;
	0 1
]

>>> [-65536 0 65536].collect { :each |
>>> 	each.encodeInt32(true).asList
>>> }
[
	0 0 255 255;
	0 0 0 0;
	0 0 1 0
]
```

* * *

See also: asSmallFloat, Complex, Fraction, Integer, LargeInteger

Guides: Numeric Types

Categories: Math, Type
