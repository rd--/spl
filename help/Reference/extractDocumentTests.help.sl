# extractDocumentTests

- _extractDocumentTests(aHelpFile | aList)_

Answer the sequence of `DocumentTest` blocks in the sequence of `String` items at _aList_.

```
>>> let string = 'a\nb\n\n```\n>>> c\nd\n```\ne\n```\n>>> f\ng\n```\nh';
>>> let list = string.lines;
>>> list.extractDocumentTests
[DocumentTest(['c'], ['d']), DocumentTest(['f'], ['g'])]
```

_Rationale_:
Spl writes document tests inside code blocks inside help files.
This method is, however, agnostic to the container structure,
and can extract documentation tests from any text.

* * *

See also: asDocumentTest, Documentation Tests, DocumentTest

Categories: Tests
