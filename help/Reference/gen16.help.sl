# gen16

- _gen16(anInteger, aSequence)_

Constructs functions from segments of parameterised curved lines.
The specification consists of triples of (level, duration, curve) items.

Straight line from one to zero:

~~~
let curve = 0;
512.gen16([1 512 curve 0]).plot
~~~

Slowly decaying (convex) curves when _curve_ `>` `zero`:

~~~
let curve = 4;
512.gen16([1 512 curve 0]).plot
~~~

Quickly decaying (convex) curves when _curve_ `<` `zero`:

~~~
let curve = -4;
512.gen16([1 512 curve 0]).plot
~~~

Equal curves for ascent and descent, percussive envelope:

~~~
let curve = -4;
1024.gen16([0 192 curve 1 932 curve 0]).plot
~~~

* * *

See also: gen05, gen09, gen10, gen11

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN16.html)
