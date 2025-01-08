# unicodeCharacterDatabase

- _unicodeCharacterDatabase(aSystem)_

Answer a _matrix_ holding the _Unicode Character Database_.

The `unicodeCharacterDatabase` method is `requireLibraryItem` of 'UnicodeCharacterDatabase'.

Acquire the table if it is not cached:

~~~
system.awaitLibraryItem(
	'UnicodeCharacterDatabase'
) {
	'Acquired'.postLine
}
~~~

Only if the library has been acquired may it be accessed directly.
Check if the library item is acquired (this will acquire it if it is locally stored):

~~~
>>> system.libraryItem(
>>> 	'UnicodeCharacterDatabase'
>>> ).isAcquired
true
~~~

Count the number of entries:

~~~
>>> system
>>> .unicodeCharacterDatabase
>>> .size
40116
~~~

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
	'0', 'L', '', '', '', '', 'N', '', '',
	'03A0', '', '03A0'
]
~~~

The most commonly used fields are:

- 1\. Code point
- 2\. Name
- 3\. General category
- 13\. Simple uppercase mapping
- 14\. Simple lowercase mapping

The code point is a four character hexadecimal string.

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: codePoint, libraryItem, LibraryItem, requestLibraryItem, requireLibraryItem

References:
_Unicode_
[1](https://unicode.org/ucd/)
[2](https://www.unicode.org/reports/tr44/tr44-32.html#UnicodeData.txt)
[3](https://www.unicode.org/reports/tr44/tr44-32.html#General_Category_Values)
