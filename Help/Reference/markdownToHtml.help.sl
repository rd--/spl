# markdownToHtml

- _markdownToHtml(s)_

Convert a string holding _CommonMark_ to a string holding _Html_.

```
>>> '# A Heading'
>>> .markdownToHtml
>>> .lines
[
	'<h1>A Heading</h1>'
]

>>> '# H 1\n\nP 1\n\nP 2'
>>> .markdownToHtml
>>> .lines
[
	'<h1>H 1</h1>'
	'<p>P 1</p>'
	'<p>P 2</p>'
]
```

* * *

See also: Markdown, String

Guides: Text Functions

References:
_CommonMark_
[1](https://spec.commonmark.org/)
