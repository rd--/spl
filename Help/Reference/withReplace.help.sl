# withReplace

- _withReplace(aSequence, anotherSequence, aBlock:/2)_

In place `withCollect`.

```
>>> let list = [9, 8 .. 1];
>>> list.withReplace(1:9) { :p :q |
>>> 	p * 2 + q
>>> };
>>> list
[19, 18 .. 11]

>>> [9, 8 .. 1].withCollect(1:9) { :p :q |
>>> 	p * 2 + q
>>> }
[19, 18 .. 11]
```

* * *

See also: collect, replace, withCollect
