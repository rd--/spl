# delayC

- _delayC(in, maxDelayTime=0.2, delayTime=0.2)_

Simple delay line.
`delayN` uses no interpolation,
`delayL` uses linear interpolation,
`delayC` uses cubic interpolation.

- in: the input signal.
- maxDelayTime: the maximum delay time in seconds. used to initialize the delay buffer size.
- delayTime: delay time in seconds.

`dust` randomly triggers `decay` to create an exponential decay envelope for the `whiteNoise` input source,
input is mixed with delay:

~~~spl syn=A
let z = decay(
	dust(1) * 0.5,
	0.3
) * whiteNoise();
delayC(z, 0.2, 0.2) + z
~~~

* * *

See also: delayL, delayN

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/DelayC.html)
