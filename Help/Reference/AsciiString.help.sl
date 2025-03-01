# AsciiString

A `Type` holding an Ascii encoded text string.

`AsciiString` implements `Iterable`, `Collection`, `Indexable` and `Sequence`.

```
>>> let s = 'text'.asAsciiString;
>>> (
>>> 	s.isAsciiString,
>>> 	s.size,
>>> 	s.first,
>>> 	s.last(3)
>>> )
(
	true,
	4,
	't'.asCharacter,
	'ext'.asAsciiString
)
```

Select characters by index:

```
>>> let s = 'text'.asAsciiString;
>>> s @* [2 4]
'et'.asAsciiString
```

Transform to upper case using `collect` and `asUpperCase`:

```
>>> 'text'.asAsciiString
>>> .collect(asUpperCase:/1)
'TEXT'.asAsciiString
```

Filter out vowels using `reject` and `isVowel`:

```
>>> 'text'.asAsciiString.reject(isVowel:/1)
'txt'.asAsciiString
```

Catenate using `++`:

```
>>> 'te'.asAsciiString ++ 'xt'.asAsciiString
'text'.asAsciiString
```

Split on sub-string using `splitBy`:

```
>>> 'two words'.asAsciiString
>>> .splitBy(' '.asAsciiString)
[
	'two'.asAsciiString,
	'words'.asAsciiString
]
```

* * *

See also: ByteArray, Character, String

Categories: Type, Text
