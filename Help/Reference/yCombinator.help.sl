# yCombinator

- _yCombinator(f:/1)_

Implements Haskell Curry’s _Y_ combinator.

An implementation of the recursive `fibonacci` function:

```
>>> let fib:/1 = { :f:/1 |
>>> 	{ :i |
>>> 		(i <= 1).if {
>>> 			i
>>> 		} {
>>> 			f(i - 1) + f(i - 2)
>>> 		}
>>> 	}
>>> }.yCombinator;
>>> fib(10)
55

>>> 10.fibonacci
55
```

An implementation of the recursive `factorial` function:

```
>>> let fac:/1 = { :f:/1 |
>>> 	{ :i |
>>> 		(i = 0).if {
>>> 			1
>>> 		} {
>>> 			f(i - 1) * i
>>> 		}
>>> 	}
>>> }.yCombinator;
>>> fac(10)
3628800

>>> 10.factorial
3628800
```

* * *

See also: Block

References:
_W_
[1](https://en.wikipedia.org/wiki/Y_combinator_(mathematics))
