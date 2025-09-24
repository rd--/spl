# select

- _select(c, f:/1)_

Evaluate the block _f_ with each of the elements of the collection _c_ as the argument.
Collect into a new collection like the receiver only those elements for which _f_ evaluates to `true`.
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
>>> [1 2 4 7 6 2].select { :each |
>>> 	each > 2
>>> }
[4 7 6]
```

Only the first expression selected (c.f. `detect`):

```
>>> [1 2 4 7 6 2].select { :each |
>>> 	each > 2
>>> }.first
4
```

Select operates on values in a dictionary:

```
>>> (a: 1, b: 2, c: 3, d: 4).select { :each |
>>> 	each > 2
>>> }
(c: 3, d: 4)
```

Find pairs containing x:

```
>>> [1 'y'; 2 'x'; 3 'x'; 4 'z'; 5 'x']
>>> .select { :each |
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

Retain items that are integers:

```
>>> [1 'x' 2 3 'y' 9 'y'].select(isNumber:/1)
[1 2 3 9]
```

At a finite `Stream`:

```
>>> [1 .. 9].asStream
>>> .select(isEven:/1)
>>> .upToEnd
[2 4 6 8]
```

At an infinte `Stream`:

```
>>> (1 .. Infinity).asStream
>>> .select(isEven:/1)
>>> .next(4)
[2 4 6 8]
```

At `Sfc32`, which implements `Stream`:

```
>>> Sfc32(188311).collect { :x |
>>> 	(x * 23).round
>>> }.select(isOdd:/1).next(5)
[15 21 5 13 1]
```

* * *

See also: collect, detect, keySelect, reject

Guides: Collection Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Predicate.html)
[2](https://reference.wolfram.com/language/ref/Select.html)
[3](https://reference.wolfram.com/language/ref/Cases.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#filter),
_Smalltalk_
5.7.1.22

Categories: Enumerating
