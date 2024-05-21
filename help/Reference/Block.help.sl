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

The _Y_ (or _Z_) combinator:

```
>>> let r = { :x:/1 | x(x:/1) };
>>> let y = { :f:/1 | { :g:/1 | { :u | let h:/1 = g(g:/1); h(u) }.f }.r };
>>> let fib:/1 = { :f:/1 | { :i | (i <= 1).if { i } { f(i - 1) + f(i - 2) } } }.y;
>>> let fact:/1 = { :f:/1 | { :i | (i = 0).if { 1 } { f(i - 1) * i } } }.y;
>>> (fib(10), fact(10))
(55, 3628800)
```

* * *

See also: Apply Syntax, Block Syntax, Block Semantics, Value Apply Syntax

Unicode: U+03BB λ Greek Small Letter Lamda

References:
_Smalltalk_
5.4.3

Categories: Behaviour, Type
