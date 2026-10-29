# changed

- _changed(input, threshold=0)_

Triggers when a value changes.
A special case fixed filter.

- input: signal input
- threshold: threshold

Implements the formula:

> _out(i) = abs(input(i) - input(i-1)) > threshold_

Detect changes in a signal:

~~~spl syn=A
let s = lfNoise0(2);
let c = changed(s, 0);
let d = decay2(c, 0.01, 0.5);
sinOsc(440 + ([s, d] * 440), 0) * 0.1
~~~

* * *

See also: hpz1, hpz2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Changed.html)

Categories: Ugen, Filter
