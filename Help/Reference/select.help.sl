# select

- _select(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Collect into a new collection like the receiver only those elements for which _aBlock_ evaluates to _true_.
Answer the new collection.

Select elements that are even:

```
>>> [1 2 4 7 6 2].select(isEven:/1)
[2 4 6 2]
```

Select prime numbers:

```
>>> 99:111.select(isPrime:/1)
[101 103 107 109]
```

Use a literal block to test each element:

```
>>> [1 2 4 7 6 2].select { :each | each > 2 }
[4 7 6]
```

Only the first expression selected (c.f. `detect`):

```
>>> [1 2 4 7 6 2].select { :each | each > 2 }.first
4
```

Select operates on values in a dictionary:

```
>>> (a: 1, b: 2, c: 3, d: 4).select { :each | each > 2 }
(c: 3, d: 4)
```

Find pairs containing x:

```
>>> [1 'y'; 2 'x'; 3 'x'; 4 'z'; 5 'x'].select { :each |
>>> 	each.includes('x')
>>> }
[2 'x'; 3 'x'; 5 'x']
```

Select numbers up to 100 that equal 1 modulo both 3 and 5:

```
>>> 1:100.select { :each |
>>> 	each % 3 = 1 & { each % 5 = 1 }
>>> }
[1 16 31 46 61 76 91]
```

Select characters from a `String`:

```
>>> 'aAbBcC'.select(isLowerCase:/1)
'abc'
```

* * *

See also: collect, detect, reject

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Predicate.html)
[2](https://reference.wolfram.com/language/ref/Select.html),
_Smalltalk_
5.7.1.22

Categories: Enumerating
