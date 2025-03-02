# Block

`Block` is the behaviour `Type`.
Blocks have fixed arity and must be applied to the correct number of arguments.

```
>>> { true } . ()
true

>>> { { true } . (true) }.ifError { true }
true

>>> { :x | x * x } . (9)
81
```

Implementations of the recursive `fibonacci` and `factorial` functions using Haskell Curry’s _Y_ combinator:

```
>>> let u = { :f:/1 |
>>> 	{ :x:/1 |
>>> 		f(x(x:/1))
>>> 	}
>>> };
>>> let delta:/1 = identity:/1.u;
>>> let y = { :f:/1 |
>>> 	{ :i:/1 |
>>> 		{ :x |
>>> 			let h:/1 = i(i:/1);
>>> 			h(x)
>>> 		}.f
>>> 	}.delta
>>> };
>>> let fib:/1 = { :f:/1 |
>>> 	{ :i |
>>> 		(i <= 1).if {
>>> 			i
>>> 		} {
>>> 			f(i - 1) + f(i - 2)
>>> 		}
>>> 	}
>>> }.y;
>>> let fact:/1 = { :f:/1 |
>>> 	{ :i |
>>> 		(i = 0).if {
>>> 			1
>>> 		} {
>>> 			f(i - 1) * i
>>> 		}
>>> 	}
>>> }.y;
>>> (fib(10), fact(10))
(55, 3628800)

>>> (10.fibonacci, 10.factorial)
(55, 3628800)
```

The predicate is `isBlock`:

```
>>> { }.isBlock
true
```

The arity is given by `numArgs`:

```
>>> { }.numArgs
0

>>> { :x | x * x }.numArgs
1
```

The names of the arguments can be retrieved using `argumentNames`:

```
>>> { :x :y | (x * x) + (y * y) }
>>> .argumentNames
['x' 'y']
```

_Rationale_:
The name _block_ is from Smalltalk.
It is used in Sᴘʟ in preference to _procedure_ or _function_.
No-argument blocks are used very extensively,
in particular to implement control structures.
Because conditional branches are implemented as blocks,
there is no _block return_ construct.
Because methods are simply blocks there is no _method return_ construct.
Instead there is the delimited control method `valueWithReturn`.

* * *

See also: apply, isBlock, numArgs, value, valueWithReturn

Guides: Apply Syntax, Block Syntax, Block Semantics, Value Apply Syntax

References:
_Smalltalk_
5.4.3

Unicode: U+03BB λ Greek Small Letter Lamda

Categories: Behaviour, Type
