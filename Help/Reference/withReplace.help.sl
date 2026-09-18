# withReplace

- _withReplace(c₁, c₂, f/2)_

In place `withCollect`.

```
>>> let c = [9, 8 .. 1];
>>> c.withReplace(1:9) { :p :q |
>>> 	p * 2 + q
>>> };
>>> c
[19, 18 .. 11]

>>> [9, 8 .. 1].withCollect(1:9) { :p :q |
>>> 	p * 2 + q
>>> }
[19, 18 .. 11]
```

* * *

See also: collect, replace, withCollect
