# keyState

- _keyState(keyCode=0, minVal=0, maxVal=1, lag=0.2)_

Respond to the state of a key.

Note that this Ugen does not prevent normal typing.

- keyCode: The keycode value of the key to check.
- minVal: The value to output when the key is not pressed.
- maxVal: The value to output when the key is pressed.
- lag: A lag factor.

Key code 38 is the A key on some keyboards:

```
sinOsc(800, 0) * keyState(38, 0, 0.1, 0.2)
```

* * *

See also: mouseButton

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/KeyState.html)

Categories: Ugen
