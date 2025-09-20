# fillFromWith

- _fillFromWith(c₁, c₂, f:/1)_

Evaluate the unary block _f_ with each element of the collection _c₂_ as the argument.
Collect the resulting values into the collection _c₁_.
Answers _c₁_.

```
>>> let p = [1 .. 9];
>>> let q = List(9);
>>> let r = q.fillFromWith(p, square:/1);
>>> (q, q == r)
(p ^ 2, true)
```

* * *

Categories: Private
