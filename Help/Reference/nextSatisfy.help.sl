# nextSatisfy

- _nextSatisfy(s, f:/1)_

Answer the next element of the stream _s_ that satisfies the predicate block _f_.

Read stream until element satisfies predicate:

```
>>> let s = [1 3 5 7 9].asIterator;
>>> let e = s.nextSatisfy { :each |
>>> 	each >= 5
>>> };
>>> (e, s.position)
(5, 3)
```

* * *

See also: Iterator, next, Stream

Guides: Stream Functions
