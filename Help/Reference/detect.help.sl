# detect

- _detect(c, f:/1)_

Evaluate the block _f_ with each of the elements of the collection _c_ as the argument.
Answer the first element for which _f_ evaluates to `true`.
If there is no such element, raise an error.

Find the first element matching a predicate:

```
>>> (5, 4 .. 1).detect { :each |
>>> 	each % 2 = 0
>>> }
4

>>> (5, 4 .. 1).detect { :each |
>>> 	each * 2 <= 4
>>> }
2

>>> [1 2 4 7 6 2].detect(isEven:/1)
2
```

It is an error if no element is detected:

```
>>> {
>>> 	(5, 4 .. 1).detect { :each |
>>> 		each % 7 = 0
>>> 	}
>>> }.hasError
true
```

Detect the first prime number in a `Range`:

```
>>> 99:111.detect(isPrime:/1)
101
```

At `Record`:

```
>>> (a: 1, b: 2, c: 3).detect(isEven:/1)
2
```

* * *

See also: detectIfFoundIfNone, detectIfNone, detectIndex, detectMin, findFirst, reject, select

Guides: Collection Functions, Dictionary Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SelectFirst.html),
_Smalltalk_
5.7.1.11

Categories: Enumerating
