# extractDocumentTests

- _extractDocumentTests(aList)_

Answer the sequence of `DocumentTest` blocks in the sequence of `String` items at _aList_.

```
>>> let string = 'a\nb\n\n```\n>>> c\nd\n```\ne\n```\n>>> f\ng\n```\nh';
>>> let list = string.lines;
>>> list.extractDocumentTests
[DocumentTest('c', 'd'), DocumentTest('f', 'g')]
```

* * *

See also: asDocumentTest, Documentation Tests, DocumentTest

Categories: Tests
