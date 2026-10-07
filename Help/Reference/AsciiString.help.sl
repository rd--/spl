# AsciiString

- _AsciiString(x)_

A `Type` holding an Ascii encoded text string.

At `Integer` answers a null string of the inidicated size:

```
>>> AsciiString(5)
>>> .codePoints
[0 0 0 0 0]
```

At `List`,
answer an `AsciiString` value holding a byte-string encoding of the string _s_:

```
>>> AsciiString'String'
>>> .codePoints
[83 116 114 105 110 103]

>>> 'text'
>>> .AsciiString
>>> .ByteArray
ByteArray[116 101 120 116]
```

At `AsciiString` answers `identity`:

```
>>> let s = AsciiString'text';
>>> s.AsciiString == s
true
```

`AsciiString` implements `Iterable`, `Collection`, `Indexable` and `Sequence`.

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

* * *

See also: ByteArray, Character, String

Categories: Type, Text
