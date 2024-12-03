# gen16

- _gen16(anInteger, aSequence)_

Constructs functions from segments of parameterised curved lines.
The specification consists of triples of (level, duration, curve) items.

Straight line from one to zero:

~~~
let curve = 0;
128.gen16([1 512 curve 0]).linePlot
~~~

![](sw/spl/Help/Image/gen16-A.svg)

Slowly decaying (convex) curves when _curve_ `>` `zero`:

~~~
let curve = 4;
128.gen16([1 512 curve 0]).linePlot
~~~

![](sw/spl/Help/Image/gen16-B.svg)

Quickly decaying (convex) curves when _curve_ `<` `zero`:

~~~
let curve = -4;
128.gen16([1 512 curve 0]).linePlot
~~~

![](sw/spl/Help/Image/gen16-C.svg)

Equal curves for ascent and descent, percussive envelope:

~~~
let curve = -4;
128.gen16(
	[0 192 curve 1 932 curve 0]
).linePlot
~~~

![](sw/spl/Help/Image/gen16-D.svg)

* * *

See also: gen05, gen07

Guides: Csound Gen Routines

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN16.html)
