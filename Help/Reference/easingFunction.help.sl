# easingFunction

- _easingFunction(aString)_

Select an easing function by name.
Answers a one argument `Block`,
the parameter of which is in _(0, 1)_.
Easing functions specify the rate of change of a parameter over time.

Quadratic:

~~~spl svg=A
(0 -- 1).functionPlot([
	'InQuadratic'.easingFunction,
	'OutQuadratic'.easingFunction,
	'InOutQuadratic'.easingFunction,
	'OutInQuadratic'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-A.svg)

Cubic:

~~~spl svg=B
(0 -- 1).functionPlot([
	'InCubic'.easingFunction,
	'OutCubic'.easingFunction,
	'InOutCubic'.easingFunction,
	'OutInCubic'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-B.svg)

Quartic:

~~~spl svg=C
(0 -- 1).functionPlot([
	'InQuartic'.easingFunction,
	'OutQuartic'.easingFunction,
	'InOutQuartic'.easingFunction,
	'OutInQuartic'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-C.svg)

Quintic:

~~~spl svg=D
(0 -- 1).functionPlot([
	'InQuintic'.easingFunction,
	'OutQuintic'.easingFunction,
	'InOutQuintic'.easingFunction,
	'OutInQuintic'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-D.svg)

Sine:

~~~spl svg=E
(0 -- 1).functionPlot([
	'InSine'.easingFunction,
	'OutSine'.easingFunction,
	'InOutSine'.easingFunction,
	'OutInSine'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-E.svg)

Exponential:

~~~spl svg=F
(0 -- 1).functionPlot([
	'InExponential'.easingFunction,
	'OutExponential'.easingFunction,
	'InOutExponential'.easingFunction,
	'OutInExponential'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-F.svg)

Circular:

~~~spl svg=G
(0 -- 1).functionPlot([
	'InCircular'.easingFunction,
	'OutCircular'.easingFunction,
	'InOutCircular'.easingFunction,
	'OutInCircular'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-G.svg)

Bounce:

~~~spl svg=H
(0 -- 1).functionPlot([
	'InBounce'.easingFunction,
	'OutBounce'.easingFunction,
	'InOutBounce'.easingFunction,
	'OutInBounce'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-H.svg)

Back:

~~~spl svg=I
(0 -- 1).functionPlot([
	'InBack'.easingFunction,
	'OutBack'.easingFunction,
	'InOutBack'.easingFunction,
	'OutInBack'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-I.svg)

Elastic:

~~~spl svg=J
(0 -- 1).functionPlot([
	'InElastic'.easingFunction,
	'OutElastic'.easingFunction,
	'InOutElastic'.easingFunction,
	'OutInElastic'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-J.svg)

ArcTan:

~~~spl svg=K
(0 -- 1).functionPlot([
	'InArcTan'.easingFunction,
	'OutArcTan'.easingFunction,
	'InOutArcTan'.easingFunction
])
~~~

![](sw/spl/Help/Image/easingFunction-K.svg)

* * *

See also: cubicBezierFunctionAt, hermiteInterpolation, smoothstep

Guides: Interpolation Functions
