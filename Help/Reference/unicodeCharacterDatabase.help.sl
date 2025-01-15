# unicodeCharacterDatabase

- _unicodeCharacterDatabase(aSystem)_

Answer a _matrix_ holding the _Unicode Character Database_.

Count the number of entries, or rows:

```
>>> system
>>> .unicodeCharacterDatabase
>>> .size
40116
```

Count the number of fields, or columns:

```
>>> system
>>> .unicodeCharacterDatabase
>>> .anyOne
>>> .size
5
```

The entry for code point 03C0:

~~~
>>> system
>>> .unicodeCharacterDatabase
>>> .detect { :each |
>>> 	each.first = '03C0'
>>> }
[
	'03C0',
	'GREEK SMALL LETTER PI',
	'Ll',
	'03A0',
	''
]
~~~

Parse code point and convert to a character:

```
>>> '03C0'.parseInteger(16).asCharacter
'π'
```

The tabl contains only the most commonly used fields of the database:

- 1\. Code point
- 2\. Name
- 3\. General category
- 13\. Simple uppercase mapping
- 14\. Simple lowercase mapping

The code point is a four character hexadecimal string.

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

`unicodeCharacterDatabase` is `requireLibraryItem` of 'UnicodeCharacterDatabase'.

* * *

See also: codePoint, LibraryItem

References:
_Unicode_
[1](https://unicode.org/ucd/)
[2](https://www.unicode.org/reports/tr44/tr44-32.html#UnicodeData.txt)
[3](https://www.unicode.org/reports/tr44/tr44-32.html#General_Category_Values)
