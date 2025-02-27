# countDistinct

- _countDistinct(aList, aBlock:/2)_

Answer the number of distinct elements that appear in _aList_,
according to _aBlock_.

Count distinct elements in a `List`:

```
>>> [1 2 2 3 1].countDistinct(==)
3
```

Count distinct values in a `Record`:

```
>>> (a: 1, b: 2, c: 2).countDistinct(==)
2
```

Treat numbers as equal if they differ by 0.01 or less:

```
>>> [3.0 3.1 3.11 3.5 3.51]
>>> .countDistinct { :i :j |
>>> 	(i - j).abs <= 0.01
>>> }
3
```

Count the number of distinct characters that occur in a string:

```
>>> [
>>> 	'It was the best of times,'
>>> 	'it was the worst of times'
>>> ].join('')
>>> .contents
>>> .countDistinct(=)
15
```

* * *

See also: count, counts, deleteDuplicates, isDuplicateFree, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CountDistinct.html)
