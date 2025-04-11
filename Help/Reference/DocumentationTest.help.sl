# DocumentationTest

- _DocumentationTest(prefix, program, expectedAnswer)_

`DocumentationTest` is a `Type` holding a test case given as two lists of strings,
one a _program_ to be evaluated,
the other the _expectedAnswer_.

There are two kinds of test, distinguished by their _prefix_.

A prefix of `>>>` indicates that the expected answer is also a program,
and that its answer should compare `~` to that answer of the test _program_.

A prefix of `>>` indicates that the expected answer is a string,
and that it should compare `=` to the `printString` of the answer of the test _program_.

The `format` method prints the equivalence predicate:

```
>>> DocumentationTest(
>>> 	'>>>',
>>> 	['3 + 4'],
>>> 	['7']
>>> ).format
'3 + 4 ~ (7)'

>>> DocumentationTest(
>>> 	'>>',
>>> 	['3 + 4'],
>>> 	['7']
>>> ).format
[
	'{ 3 + 4 }.value.asString.utf8ByteArray'
	' = '
	'ByteArray([55])'
].stringCatenate

>>> DocumentationTest(
>>> 	'>>>',
>>> 	[
>>> 		'let x = 3 + 4;'
>>> 		'x * x'
>>> 	],
>>> 	['49']
>>> ).format
'let x = 3 + 4; x * x ~ (49)'

>>> DocumentationTest(
>>> 	'>>',
>>> 	[
>>> 		'let x = 3 + 4;'
>>> 		'x * x'
>>> 	],
>>> 	['49']
>>> ).format
[
	'{ let x = 3 + 4; x * x }.value'
	'.asString.utf8ByteArray'
	' = '
	'ByteArray([52, 57])'
].stringCatenate
```

The `evaluate` method evaluates the test:

```
>>> DocumentationTest(
>>> 	'>>>',
>>> 	['3 + 4'],
>>> 	['7']
>>> ).evaluate
true

>>> DocumentationTest(
>>> 	'>>>',
>>> 	[
>>> 		'let x = 3 + 4;'
>>> 		'x * x'
>>> 	],
>>> 	['49']
>>> ).evaluate
true

>>> DocumentationTest(
>>> 	'>>',
>>> 	['3 + 4'],
>>> 	['7']
>>> ).evaluate
true
```

The parsers for `Documenatation Tests` are `asDocumentationTest` and `extractDocumentationTests`.

* * *

See also: asDocumentationTest, extractDocumentationTests

Guides: Documentation Tests

Categories: Tests, Type
