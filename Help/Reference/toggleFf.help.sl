# toggleFf

- _toggleFf(trig)_

Toggle flip flop.
Toggles between zero and one upon receiving a trigger.

- trig: trigger input

Increasing density triggers frequency switcher:

~~~spl syn=A
let ff = toggleFf(dust(xLine(1, 1000, 60)));
sinOsc(ff * 400 + 800, 0) * 0.1
~~~

* * *

See also: setResetFf

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ToggleFF.html)

Categories: Ugen
