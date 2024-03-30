# occurrencesOf

- _occurrencesOf(aCollection, anObject)_

Answer how many elements of _aCollection_ are equal to _anObject_.

At `List`:

```
>>> [1 2 3 4 3 2 1].occurrencesOf(3)
2
```

At `Bag`:

```
>>> [2 3 3 4 4 4].asBag.occurrencesOf(4)
3
```

The number of occurrences of an element in set will be zero or one.
At `Set`:

```
>> [1 2 2 3 3 3].asSet.occurrencesOf(3)
1
```

At `String`:

```
>>> 'abracadabra'.occurrencesOf('a')
5

>>> 'a cat a mat'.occurrencesOf('a')
4

>>> 'a cat a mat'.occurrencesOf('cat')
1
```

* * *

See also: count, includes, indicesOf

References:
_Smalltalk_
5.7.1.19

Categories: Testing
