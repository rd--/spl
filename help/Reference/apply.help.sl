# apply

- _apply(aBlock, aList)_

Apply _aBlock_ to the arguments at _aList_.
It is an error if _aList_ is not a `List` or has the wrong number of arguments.

```
>>> let f = { :x :y | x * y + y };
>>> f:/2.apply([3.141, 23])
95.243
```

C.f. `value`:

```
>>> let f = { :x :y | x * y + y };
>>> f:/2.value(3.141, 23)
95.243
```

* * *

See also: Block, cull, List, value

Categories: Evaluating
