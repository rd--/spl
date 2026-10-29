# limiter

- _limiter(input, level, lookAheadTime=0.01)_

peak limiter.
Limits the input amplitude to the given level.
limiter will not overshoot like `compander` will, but it needs to look ahead in the audio.
Thus there is a delay equal to twice the lookAheadTime.

limiter, unlike compander, is completely transparent for an in range signal.

- input: the signal to be processed.
- level: the peak output amplitude level to which to normalize the input.
- lookAheadTime: the buffer delay time. Shorter times will produce smaller delays and quicker transient response times, but may introduce amplitude modulation artifacts.

Limit signal to -8db:

~~~spl syn=A
let t = impulse(8, 0) * (lfSaw(0.25, 0) * -0.6 + 0.7);
let z = decay2(t, 0.001, 0.3) * fSinOsc(500, 0);
let l = -8.dbAmp;
[z * l, limiter(z, l, 0.01)]
~~~

Mouse control:

~~~spl syn=B
let t = impulse(8, 0) * (lfSaw(0.25, 0) * -0.6 + 0.7);
let z = decay2(t, 0.001, 0.3) * fSinOsc(500, 0);
limiter(z, mouseX(0, 1, 0, 0.2), 0.01) * 0.2
~~~

* * *

See also: compander

Guides: Unit Generators

Categories: Ugen, amplitude
