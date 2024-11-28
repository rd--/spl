# unicodeData

- _unicodeData(aCache)_

Answer a `Promise` that will answer a _matrix_ holding the _Unicode Character Database_.
Implemented as a `LibraryItem`.

Acquire the table, if it is not cached, and when it arrives print its size and the entry for code point 03C0:

~~~
system.unicodeData.then { :unicodeTable |
	(
		unicodeTable.size,
		unicodeTable[
			unicodeTable.findFirst { :each |
				each.first = '03C0'
			}
		]
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

If the library has been acquired it may be accessed directly:

~~~
system.library.includesKey('unicodeData')

system.library::unicodeData.value.size
~~~

* * *

See also: codePoint, LibraryItem

References:
_Unicode_
[1](https://unicode.org/ucd/)
[2](https://www.unicode.org/reports/tr44/tr44-32.html#UnicodeData.txt)
[3](https://www.unicode.org/reports/tr44/tr44-32.html#General_Category_Values)
