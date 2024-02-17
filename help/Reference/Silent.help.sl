# Silent

_Silent(numChannels)_

Output zero (silence).
Equivalent to _Dc(0) # numChannels_.

Offset eight random sine tones by eight silent channels,
requires sixteen channel system to hear:

```
Silent(8) ++ ({ SinOsc(Rand(200, 2000), 0) * 0.1 } ! 8)
```

* * *

See also: Dc
