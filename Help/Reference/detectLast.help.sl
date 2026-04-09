# detectLast

- _detectLast([x₁ x₂ …], f:/1)_

Starting at the end,
evaluate the block _f_ with each of the elements of the sequence _x_ as the argument,
answering the first element for which _f_ evaluates to `true`.
If there is no such element, raise an error.

Find the last element matching a predicate:

```
>>> 1:5.detectLast { :each |
>>> 	each % 2 = 0
>>> }
4

>>> 1:5.detectLast { :each |
>>> 	each * 2 <= 4
>>> }
2

>>> [1 2 4 7 6 3].detectLast(isEven:/1)
6
```

It is an error if no element is detected:

```
>>> {
>>> 	1:5.detectLast { :each |
>>> 		each % 7 = 0
>>> 	}
>>> }.hasError
true
```

Detect the last prime number in a `Range`:

```
>>> 99:111.detectLast(isPrime:/1)
109
```

* * *

See also: detect, detectLastIfFoundIfNone

Guides: Collection Functions, Dictionary Functions, List Functions

Categories: Enumerating
