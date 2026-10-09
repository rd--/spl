# Activation Functions

Binary step:

~~~svg=A
(-4 -- 4).functionPlot { :x |
	(x >= 0).boole
}
~~~

![](Help/Image/Activation%20Functions-A.svg)

Logistic sigmoid equation:

```
>> `x`.logisticSigmoid
(/ 1 (+ 1 (exp (* x -1))))
```

Logistic sigmoid:

~~~svg=B
(-6 -- 6).functionPlot(logisticSigmoid/1)
~~~

![](Help/Image/Activation%20Functions-B.svg)

Hyperbolic tangent:

~~~svg=C
(-6 -- 6).functionPlot(tanh/1)
~~~

![](Help/Image/Activation%20Functions-C.svg)

Rectified linear unit
([ReLU](https://en.wikipedia.org/wiki/Rectified_linear_unit)):

~~~svg=D
(-6 -- 6).functionPlot { :x |
	max(x, 0)
}
~~~

![](Help/Image/Activation%20Functions-D.svg)

Gaussian error linear unit
([GELU](https://en.wikipedia.org/wiki/Rectified_linear_unit#Gaussian-error_linear_unit_(GELU))):

~~~svg=E
(-3 -- 3).functionPlot { :x |
	let a = (2 / 1.pi).sqrt;
	let b = 0.044715;
	let c = a * (x + (b * x.cube));
	0.5 * x * (1 + c.tanh)
}
~~~

![](Help/Image/Activation%20Functions-E.svg)

Softplus equation:

```
>> `x`.softPlus
(log (+ 1 (exp x)))
```

Softplus:

~~~svg=F
(-6 -- 6).functionPlot(softPlus/1)
~~~

![](Help/Image/Activation%20Functions-F.svg)

Exponential linear unit (ELU):

~~~svg=G
let alpha = 1;
(-6 -- 6).functionPlot { :x |
	(x <= 0).if {
		alpha * (x.exp - 1)
	} {
		x
	}
}
~~~

![](Help/Image/Activation%20Functions-G.svg)

Swish function equation:

```
>> let f/1 = `β`.swishFunction;
>> f(`x`)
(/ x (+ 1 (exp (* (* β -1) x))))
```

Swish function:

~~~svg=H
(-5 -- 5).functionPlot(1.swishFunction)
~~~

![](Help/Image/Activation%20Functions-H.svg)

Gaussian:

~~~svg=I
(-2.5 -- 2.5).functionPlot { :x |
	x.square.negate.exp
}
~~~

![](Help/Image/Activation%20Functions-I.svg)

* * *

See also: logisticSigmoid, softMax, softPlus

Guides: Sigmoid Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Activation_function)
