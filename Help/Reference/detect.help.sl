# detect

- _detect(c, f:/1)_
- _detect(c, n, f:/1)_

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

The ternary form detects the first _n_ items:

```
>>> 99:Infinity.detect(7, isPrime:/1)
[101 103 107 109 113 127 131]
```

At `Record`:

```
>>> (a: 1, b: 2, c: 3).detect(isEven:/1)
2
```

Pit harvesting sequence for winning solitaire Tchoukaillon,
OEIS [A028920](https://oeis.org/A028920):

~~~spl svg=A
0:150.collect { :n |
	1:Infinity.detect { :m |
		let p = (n % (m + 1)) = 0;
		n := n * m // (m + 1);
		p
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/detect-A.svg)

* * *

See also: detectIfFoundIfNone, detectIfNone, detectIndex, detectMin, findFirst, reject, select

Guides: Collection Functions, Dictionary Functions, List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base-4.21.0.0/docs/Data-List.html#v:find),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SelectFirst.html),
_Smalltalk_
5.7.1.11

Categories: Enumerating
