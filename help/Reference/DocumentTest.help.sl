# DocumentTest

- _DocumentTest(prefix, program, expectedAnswer)_

`DocumentTest` is a `Type` holding a test case given as two lists of strings,
one a _program_ to be evaluated,
the other the _expectedAnswer_.

There are two kinds of test, distinguished by their _prefix_.

A prefix of `>>>` indicates that the expected answer is also a program,
and that its answer should compare `~` to that answer of the test _program_.

A prefix of `>>` indicates that the expected answer is a string,
and that it should compare `=` to the `printString` of the answer of the test _program_.

The `format` method prints the equivalence predicate:

```
>>> DocumentTest('>>>', ['3 + 4'], ['7']).format
'3 + 4 ~ (7)'

>>> DocumentTest('>>', ['3 + 4'], ['7']).format
'(3 + 4).printString.utf8ByteArray = [55].asByteArray'

>>> DocumentTest('>>>', ['let x = 3 + 4;' 'x * x'], ['49']).format
'let x = 3 + 4; x * x ~ (49)'

>>> DocumentTest('>>', ['let x = 3 + 4;' 'x * x'], ['49']).format
'(let x = 3 + 4; x * x).printString.utf8ByteArray = [52, 57].asByteArray'
```

The `evaluate` method evaluates the test:

```
>>> DocumentTest('>>>', ['3 + 4'], ['7']).evaluate
true

>>> DocumentTest('>>>', ['let x = 3 + 4;' 'x * x'], ['49']).evaluate
true

>>> DocumentTest('>>', ['3 + 4'], ['7']).evaluate
true
```

The parsers for `Documenatation Tests` are `asDocumentTest` and `extractDocumentTests`.

* * *

See also: asDocumentTest, extractDocumentTests

Guides: Documentation Tests

Categories: Tests, Type
