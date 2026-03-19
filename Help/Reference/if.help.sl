# if

- _if(condition, whenTrue:/0, whenFalse:/0)_

Conditional evaluation.
If _aBoolean_ is `true` answer the result of  _whenTrue()_, else answer _whenFalse()_.

Note that the branches are not evaluated using `value`, and therefore _must_ be no-argument blocks.

Ordinarily _whenTrue_ and _whenFalse_ are literal no-argument blocks.
`Trailing Block Syntax` provides an idiomatic notation for writing such conditionals.
The standard libraries write if conditions as:

```
>>> (3 > 2).if { true } { false }
true
```

where there are two branches and as either:

```
>>> (3 > 2).ifTrue { true }
true
```

or:

```
>>> (3 < 2).ifFalse { true }
true
```

where there is one.

Implement the Ackerman function:

```
>>> let a = { :m :n |
>>> 	(m = 0).if {
>>> 		n + 1
>>> 	} {
>>> 		(n = 0).if {
>>> 			a(m - 1, 1)
>>> 		} {
>>> 			a(m - 1, a(m, n - 1))
>>> 		}
>>> 	}
>>> };
>>> 0:3.collect { :m |
>>> 	0:7.collect { :n |
>>> 		a(m, n)
>>> 	}
>>> }
[
	1 2 3 4 5 6 7 8;
	2 3 4 5 6 7 8 9;
	3 5 7 9 11 13 15 17;
	5 13 29 61 125 253 509 1021
]
```

At `Symbol`:

```
>> (`x` < `y`).if { `a` } { `b` }
(if (< x y) a b)
```

Number of partitions of _n_ into powers of ten,
OEIS [A179051](https://oeis.org/A179051):

~~~spl svg=A oeis=A179051
let f = { :m :k |
	(m = 0).if {
		1
	} {
		(m < k).if {
			0
		} {
			f(m - k, k) + f(m, k * 10)
		}
	}
};
0:149.collect { :n |
	f(n, 1)
}.discretePlot
~~~

![](Help/Image/if-A.svg)

Triangle whose rows show the result of flipping the first,
first two,
and finally first _n_ coins when starting with the stack _1:n_,
OEIS [A056951](https://oeis.org/A056951):

~~~spl svg=B oeis=A056951
1:13.triangularArray { :n :k |
	(k = 1).if {
		-n
	} {
		(n = k).if {
			n - 1
		} {
			let m = (
				(2 * k) <= (n + 1)
			).boole + 1;
			2 * k - n - m
		}
	}
}.catenate.discretePlot
~~~

![](Help/Image/if-B.svg)

_Rationale:_
Spl follows Smalltalk in having no special purpose conditional evaluation mechanisms.
Conditional expressions are implemented as ordinary blocks.
To delay evaluation of alternatives each must be written as a no argument block.

* * *

See also: boole, ifEmpty, ifFalse, ifNil, ifNotNil, ifTrue, which

Guides: Boolean Functions, Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/If.html),
_Smalltalk_
5.3.3.8

Categories: Evaluating
