# asDocumentTest

- _asDocumentTest(aList)_

Answer the `DocumentTest` given by the sequence of `String` items in _aList_.

```
>>> let string = '>>> a\n>>> b\nc\nd';
>>> let list = string.lines;
>>> list.asDocumentTest
DocumentTest('a b', 'c d')
```

* * *

See also: Documentation Tests, DocumentTest, extractDocumentTests

Categories: Tests
