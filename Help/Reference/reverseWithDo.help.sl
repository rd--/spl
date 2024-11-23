# reverseWithDo

- _reverseWithDo(aSequence, anotherSequence, aBlock:/2)_

Evaluate _aBlock_ with each element of _aSequence_, in reverse order,
along with the corresponding element, also in reverse order, from _anotherSequence_.

```
>>> let d = [];
>>> 3:1.reverseWithDo(1:3) { :p :q |
>>> 	d.add(p -> q)
>>> };
>>> d
[1 -> 3, 2 -> 2, 3 -> 1]
```

* * *

See also: do, withDo, reverseDo

Categories: Enumerating
