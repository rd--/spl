# Changed -- triggers when a value changes

- _Changed(input, threshold=0)_

A special case fixed filter.

- input: signal input
- threshold: threshold

Implements the formula:

> out(i) = abs(input(i) - input(i-1)) > threshold

Detect changes in a signal:

```
var s = LfNoise0(2);
var c = Changed(s, 0);
var d = Decay2(c, 0.01, 0.5);
SinOsc(440 + ([s, d] * 440), 0) * 0.1
```
