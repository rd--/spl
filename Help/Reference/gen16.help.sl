# gen16

- _gen16(n, [l₁ d₁ c₁ l₂ d₂ c₂ …])_

Constructs functions from segments of parameterised curved lines.
The specification consists of triples of (level, duration, curve) items.

Straight line from one to zero:

~~~spl svg=A
let c = 0;
128.gen16([1 128 c 0]).linePlot
~~~

![](Help/Image/gen16-A.svg)

Slowly decaying (convex) curves when _c_ `>` `zero`:

~~~spl svg=B
let c = 4;
128.gen16([1 128 c 0]).linePlot
~~~

![](Help/Image/gen16-B.svg)

Quickly decaying (convex) curves when _c_ `<` `zero`:

~~~spl svg=C
let c = -4;
128.gen16([1 128 c 0]).linePlot
~~~

![](Help/Image/gen16-C.svg)

Equal curves for ascent and descent, percussive envelope:

~~~spl svg=D
let c = -4;
256.gen16(
	[0 48 c 1 208 c 0]
).linePlot
~~~

![](Help/Image/gen16-D.svg)

* * *

See also: gen05, gen07

Guides: Csound Gen Routines

References:
_Csound_
[1](https://csound.com/docs/manual/GEN16.html)
