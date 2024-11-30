# asDocumentationTest

- _asDocumentationTest(aList)_

Answer the `DocumentationTest` given by the sequence of `String` items in _aList_.
The _program_ lines are prefixed by '>>> ' and the _expected answer_ lines follow without prefix.

```
>>> let string = '>>> a\n>>> b\nc\nd';
>>> let list = string.lines;
>>> list.asDocumentationTest
DocumentationTest('>>>', ['a' 'b'], ['c' 'd'])
```

* * *

See also: DocumentationTest, extractDocumentationTests

Guides: Documentation Tests

Categories: Tests
