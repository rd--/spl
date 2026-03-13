# extractDocumentationTests

- _extractDocumentationTests(x)_

Answer the sequence of `DocumentationTest` blocks at _x_,
which may be either a `List` of `String` items,
or a `HelpFile` object.

At `List` of `String`:

```
>>> [
>>> 	'a'
>>> 	'b'
>>> 	''
>>> 	'```'
>>> 	'>>> c'
>>> 	'd'
>>> 	'```'
>>> 	'e'
>>> 	'```'
>>> 	'>> f'
>>> 	'g'
>>> 	'```'
>>> 	'h'
>>> ].extractDocumentationTests
[
	DocumentationTest(
		'>>>',
		['c'],
		['d']
	),
	DocumentationTest(
		'>>',
		['f'],
		['g']
	)
]
```

_Rationale_:
Sᴘʟ writes document tests inside code blocks inside help files.
This method is, however, agnostic to the container structure,
and can extract documentation tests from any text.

* * *

See also: parseDocumentationTest, DocumentationTest

Guides: Documentation Tests

Categories: Tests
