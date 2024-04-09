# SetResetFF

- _SetResetFf(trig=0, reset=0)_

Set-reset flip flop.
Output is set to one upon receiving a trigger in the trig input, and to zero upon receiving a trigger in the reset input.
Once the flip flop is set to zero or one further triggers in the same input have no effect.
One use of this is to have some precipitating event cause something to happen until you reset it.

If both inputs receive a trigger at the same time, the reset input takes precedence.
The output will be zero.

- trig: the trigger that sets output to one.
- reset: the trigger that sets output to zero.

```
SetResetFf(Dust(5), Dust(5)) * BrownNoise() * 0.1
```

* * *

See also: ToggleFf
