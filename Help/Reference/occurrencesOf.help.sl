# occurrencesOf

- _occurrencesOf(c, x)_

Answer how many elements of the collection _c_ are equal to the object _x_.

At `List`:

```
>>> [1 2 3 4 3 2 1]
>>> .occurrencesOf(3)
2
```

At `Record`:

```
>>> (a: 1, b: 2, c: 1)
>>> .occurrencesOf(1)
2
```

At `IdentityMultiset`:

```
>>> [2 3 3 4 4 4].IdentityMultiset
>>> .occurrencesOf(4)
3
```

The number of occurrences of an element in set will be zero or one.
At `IdentitySet`:

```
>>> [1 2 2 3 3 3].IdentitySet
>>> .occurrencesOf(3)
1
```

At `String`:

```
>>> 'abracadabra'
>>> .occurrencesOf('a')
5

>>> 'a cat a mat'
>>> .occurrencesOf('a')
4

>>> 'a cat a mat'
>>> .occurrencesOf('cat')
1
```

* * *

See also: count, includes, indicesOf

Guides: Dictionary Functions, List Functions, Set Functions

References:
_Smalltalk_
5.7.1.19

Categories: Testing
