# unicodeData

- _unicodeData(aCache)_

Answer a `Promise` that will answer a _matrix_ holding the _Unicode Character Database_.

The `unicodeData` method is `requestLibraryItem` of 'Text/Unicode/CharacterDatabase'.

Acquire the table,
if it is not cached,
and when it arrives print its size and the entry for code point 03C0:

~~~
system.unicodeData.then { :table |
	let index = table.findFirst { :each |
		each.first = '03C0'
	};
	(
		table.size,
		table[index]
	).postLine
}
~~~

The most commonly used fields are:

- 1\. Code point
- 2\. Name
- 3\. General category
- 13\. Simple uppercase mapping
- 14\. Simple lowercase mapping

The code point is a four character hexadecimal string.

If the library has been acquired it may be accessed directly.
Check if the library item is acquired:

~~~
system.libraryItem(
	'Text/Unicode/CharacterDatabase'
).isAcquired
~~~

Get the library item:

~~~
system
.libraryItem(
	'Text/Unicode/CharacterDatabase'
)
.require
.size
~~~

* * *

See also: codePoint, libraryItem, LibraryItem, requestLibraryItem

References:
_Unicode_
[1](https://unicode.org/ucd/)
[2](https://www.unicode.org/reports/tr44/tr44-32.html#UnicodeData.txt)
[3](https://www.unicode.org/reports/tr44/tr44-32.html#General_Category_Values)
