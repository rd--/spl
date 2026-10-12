# Piecewise

- _Piecewise(p, f/1)_

A `Type` that represents a piecewise function with values given by pieces _p_,
a sequence of _(predicate -> function)_ associations.
The _predicate_ Blocks are typically inequalities such as _{ :x | x < 0 }_.
The _predicate_ Blocks are evaluated in turn, until one of them answers true.
The answer is the answer of the corresponding _function_ Block.
Answers _f_ of the input value if none of the conditions apply.
The default value for _f_ is _0.constant_.
The method `unaryBlock` answers a unary block that will evaluate the specified function.

Plot a piecewise function with different pieces below and above zero,
writing the `Associations` using `<-`,
placing the predicate on the right:

~~~spl svg=A
let p = [
	{ :x | x ^ 2 } <- { :x | x < 0 },
	{ :x | x } <- { :x | x > 0 }
];
(-2 -- 2).functionPlot(
	Piecewise(p).unaryBlock
)
~~~

![](Help/Image/Piecewise-A.svg)

Plot another piecewise function with branches below and at zero, and with a _defaultValue_:

~~~spl svg=B
let p = [
	{ :x | x.sin / x } <- { :x | x < 0},
	{ :x | 1 } <- { :x | x = 0 }
];
let f = { :x |
	(x ^ 2).- / 100 + 1
};
(-10 -- 10).functionPlot(
	Piecewise(p, f/1).unaryBlock
)
~~~

![](Help/Image/Piecewise-B.svg)

If values are not specified in a region, they are assumed to be zero:

~~~spl svg=C
let p = [
	{ :x | x.sqrt } <- { :x | x > 0 }
];
(-2 -- 2).functionPlot(
	Piecewise(p).unaryBlock
)
~~~

![](Help/Image/Piecewise-C.svg)

Specify a default value of one:

~~~spl svg=D
let p = [
	{ :x | x.sqrt } <- { :x | x > 0 }
];
let f = { :x | 1 };
(-2 -- 2).functionPlot(
	Piecewise(p, f/1).unaryBlock
)
~~~

![](Help/Image/Piecewise-D.svg)

* * *

See also: Block, unaryBlock

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Piecewise.html)
