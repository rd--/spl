# Piecewise

- _Piecewise(pieces, defaultValue)_
- _Piecewise(alpha)_ ⟹ _Piecewise(alpha, 0.constant)_

A type that represents a piecewise function with values given by a sequence of _(function, predicate)_ pairs.
The _predicate_ Blocks are typically inequalities such as _{ :x | x < 0 }_.
The _predicate_ Blocks are evaluated in turn, until one of them answers true.
The answer is the answer of the corresponding _function_ Block.
Answers _defaultValue_ of the input value if none of the conditions apply.
The default value for _defaultValue_ is _0.constant_.

Plot a piecewise function with different pieces below and above zero:

~~~
let pieces = [
	({ :x | x ^ 2 }, { :x | x < 0 }),
	({ :x | x }, { :x | x > 0 })
];
let pieceWise = Piecewise(pieces);
(-2 -- 2).functionPlot { :x | pieceWise.value(x) }
~~~

Plot another piecewise function with branches below and at zero, and with a _defaultValue_:

~~~
let pieces = [
	({ :x | x.sin / x }, { :x | x < 0}),
	({ :x | 1 }, { :x | x = 0 })
];
let defaultValue = { :x | (x ^ 2).- / 100 + 1 };
let pieceWise = Piecewise(pieces, defaultValue:/1) ;
(-10 -- 10).functionPlot { :x | pieceWise.value(x) }
~~~

If values are not specified in a region, they are assumed to be zero:

~~~
let pieceWise = Piecewise([({ :x | x.sqrt }, { :x | x > 0 })]);
(-2 -- 2).functionPlot { :x | pieceWise.value(x) }
~~~

Specify a default value of one:

~~~
let pieceWise = Piecewise([({ :x | x.sqrt }, { :x | x > 0 })]) { :x | 1 };
(-2 -- 2).functionPlot { :x | pieceWise.value(x) }
~~~

* * *

See also: Block

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Piecewise.html)
