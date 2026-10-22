# DocumentationTest

- _DocumentationTest(k, p, a)_

`DocumentationTest` is a `Type` holding a test case given as two lists of strings,
one a program _p_ to be evaluated,
the other the expected answer _a_.

There are two kinds of test, distinguished by their prefix _k_.

A prefix of `>>>` indicates that the expected answer is also a program,
and that its answer should compare `~` to that answer of the test program.

A prefix of `>>` indicates that the expected answer is a string,
and that it should compare `equalIgnoringExtraWhitespace` to the `printString` of the answer of the test program.

The `format` method prints the equivalence predicate:

```
>>> DocumentationTest(
>>> 	'>>>',
>>> 	['3 + 4'],
>>> 	['7']
>>> ).format
'3 + 4 ~ (7)'

>> DocumentationTest(
>> 	'>>',
>> 	['3 + 4'],
>> 	['7']
>> ).format
{ 3 + 4 }
.nullaryApply
.displayString
.equalIgnoringExtraWhitespace(
	ByteArray([55]).utf8String
)

>>> DocumentationTest(
>>> 	'>>>',
>>> 	[
>>> 		'let x = 3 + 4;'
>>> 		'x * x'
>>> 	],
>>> 	['49']
>>> ).format
'let x = 3 + 4; x * x ~ (49)'

>> DocumentationTest(
>> 	'>>',
>> 	[
>> 		'let x = 3 + 4;'
>> 		'x * x'
>> 	],
>> 	['49']
>> ).format
{ let x = 3 + 4; x * x }
.nullaryApply
.displayString
.equalIgnoringExtraWhitespace(
	ByteArray([52, 57]).utf8String
)
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

The parsers for `Documenatation Tests` are `parseDocumentationTest` and `extractDocumentationTests`.

* * *

See also: parseDocumentationTest, extractDocumentationTests

Guides: Documentation Tests

References:
_Python_
[1](https://docs.python.org/3/library/doctest.html),
_W_
[1](https://en.wikipedia.org/wiki/Doctest)

Categories: Tests, Type
