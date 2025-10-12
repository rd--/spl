# asDocumentationTest

- _asDocumentationTest([s₁ s₂ …])_

Answer the `DocumentationTest` given by the sequence of `String` items in the list _s_.
The _program_ lines are prefixed by either '>>>' or '>>',
and the _expected answer_ lines follow without prefix.

```
>>> [
>>> 	'>>> a'
>>> 	'>>> b'
>>> 	'c'
>>> 	'd'
>>> ].asDocumentationTest
DocumentationTest(
	'>>>',
	['a' 'b'],
	['c' 'd']
)
```

* * *

See also: DocumentationTest, extractDocumentationTests

Guides: Documentation Tests

Categories: Tests
