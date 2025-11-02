# atAllPutAll

- _atAllPutAll(aSequence, indexList, valueList)_

Store the elements of _valueList_ into the slots of _aSequence_ selected by _indexList_.
Answer _valueList_.

```
>>> let a = [1 .. 9];
>>> let b = [3 .. 7];
>>> let c = [7, 6 .. 3];
>>> let d = a.atAllPutAll(b, c);
>>> (a, d)
([1 2 7 6 5 4 3 8 9], c)
```

Using `Range` as indices and values:

```
>>> let l = [1 .. 9];
>>> l.atAllPutAll(3:7, 7:-1:3);
>>> l
[1 2 7 6 5 4 3 8 9]
```

* * *

See also: atAllPut

Categories: Accessing
