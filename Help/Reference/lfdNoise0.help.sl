# lfdNoise0

- _lfdNoise0(freq)_

Dynamic step noise.

- freq: rate at which to generate random values

Like lfNoise0, it generates random values at a rate given by the freq argument, with two differences:

- no time quantization
- fast recovery from low freq values

(The lfNoise Ugens quantize to the nearest integer division of the samplerate, and they poll the freq argument only when scheduled, and thus seem to hang when freqs get very low.)

If you do not need very high or very low freqs, or use fixed freqs, lfNoise0 is more efficient.

Try wiggling mouse quickly, lfNoise frequently seems stuck, lfdNoise changes smoothly.

~~~spl syn=A
let x = mouseX(0.1, 1000, 1, 0.2);
[lfNoise0(x), lfdNoise0(x)] * 0.1
~~~

silent for two seconds before going up in freq.

~~~spl syn=B
let f = xLine(0.5, 10000, 3);
[lfNoise0(f), lfdNoise0(f)] * 0.1
~~~

lfNoise quantizes time steps at high freqs, lfdNoise does not:

~~~spl syn=C
let f = xLine(1000, 20000, 10);
[lfNoise0(f), lfdNoise0(f)] * 0.1
~~~

* * *

See also: lfNoise1, lfdNoise0

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFDNoise0.html)

Categories: Ugen
