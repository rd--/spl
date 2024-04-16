# count

- _count(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Answer the number of elements that answered `true`.

```
>>> 1:9.count(isEven:/1)
4

>>> [1 .. 9].count(isEven:/1)
4

>>> (x: 1, y: 2, z: 3).count(isEven:/1)
1
```

Count the number of items in a random list of 100 numbers that are greater than 0.5:

```
>>> let l = Sfc32(98765).next(100);
>>> l.count { :each | each > 0.5 }
48
```

Count the number of rows whose first element is 1:

```
>>> [1 2; 2 3; 1 5].count { :each | each.first = 1 }
2
```

* * *

See also: counts, select

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Count.html)

Categories: Enumerating
