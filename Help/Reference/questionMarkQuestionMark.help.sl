# ?? (questionMarkQuestionMark)

- _a ?? b_

Answer _a_ if _a_ is not `nil`, else answer _b_.
This is the evaluating form of `?`,
which is the operator form of `ifNil`.

```
>>> 1 ?? 2
1

>>> nil ?? 2
2

>>> nil ? { 2 }
2
```

The name of this operator is `questionMarkQuestionMark`.

* * *

See also: ?, ifNil

Guides: Nil Functions

Categories: Conditional, Evaluation
