# reverseWithDo

- _reverseWithDo(p, q, f/2)_

Evaluate the block _f_ with each element of the sequence _p_, in reverse order,
along with the corresponding element, also in reverse order, from another sequence _q_.
Answers `nil`.

```
>>> let d = [];
>>> 3:1:-1.reverseWithDo(1:3) { :p :q |
>>> 	d.add!(p -> q)
>>> };
>>> d
[1 -> 3, 2 -> 2, 3 -> 1]
```

* * *

See also: do, withDo, reverseDo

Categories: Enumerating
