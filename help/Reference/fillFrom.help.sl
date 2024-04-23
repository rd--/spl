# fillFrom

- _fillFrom(alpha, beta)_ => _fillFromWith(alpha, beta, identity:/1)_

`fillFromWith` with `identity` `Block`.

```
>>> let p = [1 .. 9];
>>> let q = List(9).fillFrom(p);
>>> (p = q, p ~~ q)
(true, true)
```

* * *

See also: fillFromWith
