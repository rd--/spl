# Piecewise

- _Piecewise(pieces, defaultValue:/1)_
- _Piecewise(alpha)_ ⟹ _Piecewise(alpha, 0.constant)_

A `Type` that represents a piecewise function with values given by a sequence of _(predicate -> function)_ associations.
The _predicate_ Blocks are typically inequalities such as _{ :x | x < 0 }_.
The _predicate_ Blocks are evaluated in turn, until one of them answers true.
The answer is the answer of the corresponding _function_ Block.
Answers _defaultValue_ of the input value if none of the conditions apply.
The default value for _defaultValue_ is _0.constant_.

Plot a piecewise function with different pieces below and above zero,
writing the `Associations` using `<-`,
placing the predicate on the right:

~~~spl svg=A
let pieces = [
	{ :x | x ^ 2 } <- { :x | x < 0 },
	{ :x | x } <- { :x | x > 0 }
];
let pieceWise = Piecewise(pieces);
(-2 -- 2).functionPlot { :x |
	pieceWise.value(x)
}
~~~

![](sw/spl/Help/Image/Piecewise-A.svg)

Plot another piecewise function with branches below and at zero, and with a _defaultValue_:

~~~spl svg=B
let pieces = [
	{ :x | x.sin / x } <- { :x | x < 0},
	{ :x | 1 } <- { :x | x = 0 }
];
let defaultValue = { :x |
	(x ^ 2).- / 100 + 1
};
let pieceWise = Piecewise(
	pieces,
	defaultValue:/1
);
(-10 -- 10).functionPlot { :x |
	pieceWise.value(x)
}
~~~

![](sw/spl/Help/Image/Piecewise-B.svg)

If values are not specified in a region, they are assumed to be zero:

~~~spl svg=C
let piece = { :x | x.sqrt } <- { :x | x > 0 };
let pieceWise = Piecewise([piece]);
(-2 -- 2).functionPlot { :x |
	pieceWise.value(x)
}
~~~

![](sw/spl/Help/Image/Piecewise-C.svg)

Specify a default value of one:

~~~spl svg=D
let piece = { :x | x.sqrt } <- { :x | x > 0 };
let defaultValue = { :x | 1 };
let pieceWise = Piecewise(
	[piece],
	defaultValue:/1
);
(-2 -- 2).functionPlot { :x |
	pieceWise.value(x)
}
~~~

![](sw/spl/Help/Image/Piecewise-D.svg)

* * *

See also: Block

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Piecewise.html)
