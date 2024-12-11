# paragraphAtIndex

- _paragraphAtIndex(aString, anInteger)_

Answer the paragraph in _aString_ at index _anInteger_.
Paragraphs are delimited by an empty line,
that is by two consecutive line feeds.

```
>>> [1 6 11].collect { :index |
>>> 	'a\n\nb\nc\nd\n\n\e\n'
>>> 	.paragraphAtIndex(index)
>>> }
['a\n' 'b\nc\nd\n' 'e\n']
```

If the index points to a line feed look backwards for a paragraph.

```
>>> 'a\n\nb\nc\nd\n\n\e\n'
>>> .paragraphAtIndex(3)
'a\n'
```

* * *

See also: wordAtIndex
