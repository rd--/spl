# easingFunction

- _easingFunction(s)_

Select an easing function by name.
Answers a one argument `Block`,
the parameter of which is in _(0, 1)_.
Easing functions specify the rate of change of a parameter over time.
From equations by Robert Penner.

Quadratic:

~~~spl svg=A
(0 -- 1).functionPlot([
	'InQuadratic'.easingFunction,
	'OutQuadratic'.easingFunction,
	'InOutQuadratic'.easingFunction,
	'OutInQuadratic'.easingFunction
])
~~~

![](Help/Image/easingFunction-A.svg)

Cubic:

~~~spl svg=B
(0 -- 1).functionPlot([
	'InCubic'.easingFunction,
	'OutCubic'.easingFunction,
	'InOutCubic'.easingFunction,
	'OutInCubic'.easingFunction
])
~~~

![](Help/Image/easingFunction-B.svg)

Quartic:

~~~spl svg=C
(0 -- 1).functionPlot([
	'InQuartic'.easingFunction,
	'OutQuartic'.easingFunction,
	'InOutQuartic'.easingFunction,
	'OutInQuartic'.easingFunction
])
~~~

![](Help/Image/easingFunction-C.svg)

Quintic:

~~~spl svg=D
(0 -- 1).functionPlot([
	'InQuintic'.easingFunction,
	'OutQuintic'.easingFunction,
	'InOutQuintic'.easingFunction,
	'OutInQuintic'.easingFunction
])
~~~

![](Help/Image/easingFunction-D.svg)

Sine:

~~~spl svg=E
(0 -- 1).functionPlot([
	'InSine'.easingFunction,
	'OutSine'.easingFunction,
	'InOutSine'.easingFunction,
	'OutInSine'.easingFunction
])
~~~

![](Help/Image/easingFunction-E.svg)

Exponential:

~~~spl svg=F
(0 -- 1).functionPlot([
	'InExponential'.easingFunction,
	'OutExponential'.easingFunction,
	'InOutExponential'.easingFunction,
	'OutInExponential'.easingFunction
])
~~~

![](Help/Image/easingFunction-F.svg)

Circular:

~~~spl svg=G
(0 -- 1).functionPlot([
	'InCircular'.easingFunction,
	'OutCircular'.easingFunction,
	'InOutCircular'.easingFunction,
	'OutInCircular'.easingFunction
])
~~~

![](Help/Image/easingFunction-G.svg)

Bounce:

~~~spl svg=H
(0 -- 1).functionPlot([
	'InBounce'.easingFunction,
	'OutBounce'.easingFunction,
	'InOutBounce'.easingFunction,
	'OutInBounce'.easingFunction
])
~~~

![](Help/Image/easingFunction-H.svg)

Back:

~~~spl svg=I
(0 -- 1).functionPlot([
	'InBack'.easingFunction,
	'OutBack'.easingFunction,
	'InOutBack'.easingFunction,
	'OutInBack'.easingFunction
])
~~~

![](Help/Image/easingFunction-I.svg)

Elastic:

~~~spl svg=J
(0 -- 1).functionPlot([
	'InElastic'.easingFunction,
	'OutElastic'.easingFunction,
	'InOutElastic'.easingFunction,
	'OutInElastic'.easingFunction
])
~~~

![](Help/Image/easingFunction-J.svg)

ArcTan:

~~~spl svg=K
(0 -- 1).functionPlot([
	'InArcTan'.easingFunction,
	'OutArcTan'.easingFunction,
	'InOutArcTan'.easingFunction
])
~~~

![](Help/Image/easingFunction-K.svg)

* * *

See also: cubicBezierFunctionAt, hermiteInterpolation, smoothstep

Guides: Interpolation Functions
