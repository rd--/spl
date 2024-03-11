# asDocumentTest

- _asDocumentTest(aList)_

Answer the `DocumentTest` given by the sequence of `String` items in _aList_.
The _program_ lines are prefixed by '>>> ' and the _expected answer_ lines follow without prefix.

```
>>> let string = '>>> a\n>>> b\nc\nd';
>>> let list = string.lines;
>>> list.asDocumentTest
DocumentTest(['a' 'b'], ['c' 'd'])
```

* * *

See also: Documentation Tests, DocumentTest, extractDocumentTests

Categories: Tests
