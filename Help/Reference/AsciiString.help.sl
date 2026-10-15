# AsciiString

- _AsciiString(x)_

A `Type` holding an Ascii encoded text string.

At `List`,
answer an `AsciiString` value holding a byte-string encoding of the string _s_:

```
>>> AsciiString'String'
>>> .codePoints
[83 116 114 105 110 103]

>>> AsciiString'text'
>>> .byteArray
ByteArray[116 101 120 116]
```

At `AsciiString` answers `copy`:

```
>>> let a = AsciiString'text';
>>> let b = AsciiString(a);
>>> (a = b, a !== b)
(true, true)
```

`AsciiString` implements `Do`, `At`, `Put`, `Collect` and `Sequence`:

```
>>> let s = AsciiString'text';
>>> (
>>> 	s.isAsciiString,
>>> 	s.size,
>>> 	s.first,
>>> 	s.last(3)
>>> )
(
	true,
	4,
	Character't',
	AsciiString'ext'
)
```

Select characters by index:

```
>>> let s = AsciiString'text';
>>> s.atAll([2 4])
AsciiString'et'
```

Transform to upper case using `collect` and `toUpperCase`:

```
>>> AsciiString'text'
>>> .collect(toUpperCase/1)
AsciiString'TEXT'
```

Filter out vowels using `reject` and `isVowel`:

```
>>> AsciiString'text'.reject(isVowel/1)
AsciiString'txt'
```

Catenate using `++`:

```
>>> AsciiString'te' ++ AsciiString'xt'
AsciiString'text'
```

Split on sub-string using `splitBy`:

```
>>> AsciiString'two words'
>>> .splitBy(AsciiString' ')
[
	AsciiString'two',
	AsciiString'words'
]
```

Store string:

```
>> AsciiString'String'.storeString
AsciiString('String')
```

Zero string:

```
>>> 5.zeroAsciiString
>>> .codePoints
[0 0 0 0 0]
```

* * *

See also: ByteArray, Character, String

Guides: String Functions

Categories: Type, Text
