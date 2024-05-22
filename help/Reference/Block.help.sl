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

>>> { { : x | x * x } . () }.ifError { true }
true
```

Implentations of the recursive `fibonacci` and `factorial` functions using Haskell Curry’s _Y_ combinator:

```
>>> let u = { :f:/1 | { :x:/1 | f(x(x:/1)) } };
>>> let delta:/1 = identity:/1.u;
>>> let y = { :f:/1 | { :i:/1 | { :x | let h:/1 = i(i:/1); h(x) }.f }.delta };
>>> let fib:/1 = { :f:/1 | { :i | (i <= 1).if { i } { f(i - 1) + f(i - 2) } } }.y;
>>> let fact:/1 = { :f:/1 | { :i | (i = 0).if { 1 } { f(i - 1) * i } } }.y;
>>> (fib(10), fact(10))
(55, 3628800)

>>> (10.fibonacci, 10.factorial)
(55, 3628800)
```

* * *

See also: apply, value

Guides: Apply Syntax, Block Syntax, Block Semantics, Value Apply Syntax

Unicode: U+03BB λ Greek Small Letter Lamda

References:
_Smalltalk_
5.4.3

Categories: Behaviour, Type
