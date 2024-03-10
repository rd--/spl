# DocumentTest

- _DocumentTest(program, expectedAnswer)_

`DocumentTest` is a `Type` holding a test case given as two strings that should evaluate to equivalent objects.

The `format` method prints the equivalence predicate:

```
>>> DocumentTest('3 + 4', '7').format
'3 + 4 ~ (7)'
```

The `evaluate` method evaluates the test:

```
>>> DocumentTest('3 + 4', '7').evaluate
true
```

The parsers for `Documenatation Tests` are `asDocumentTest` and `extractDocumentTests`.

* * *

See also: asDocumentTest, Documentation Tests, extractDocumentTests

Categories: Tests, Type
