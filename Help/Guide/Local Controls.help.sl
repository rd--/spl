# Local Controls

Local controls are control inputs that are local to the synthesiser definition.
They have a name, an index and a default value.
Messages can be sent to the synthesiser to set these controls.

The ordinary way to make local controls is from a _Record_ using _localControls_.

```
let ctl = (freq: 440, amp: 0.1).localControls;
(SinOsc(ctl::freq, 0) * ctl::amp)
```

If the default value for a control is a list then a list of control inputs are created, the names qualified by integer suffixes.
In the graph below there are three controls, _freq1_, _freq2_ and _amp_.

```
let ctl = (freq: [440, 440 + 3], amp: 0.1).localControls;
SinOsc(ctl::freq, 0) * ctl::amp
```

The controls are sequenced from left to right.
The list to reset all three controls above to their initial values is _[440, 440 + 3, 0.1]_.

* * *

See also: localControls, NamedControl, Named Controls
