# Clip

- _Clip(in, lo=0, hi=1)_

Clip a signal outside given thresholds.
Differs from `Clip2` in that it allows one to set both low and high thresholds.

- in: Signal to be clipped
- lo: Low threshold of clipping, must be less then _hi_
- hi: High threshold of clipping, must be greater then _lo_

Clip sine:

```
Clip(SinOsc(440, 0) * 0.2, -0.07, 0.07)
```

* * *

See also: Clip2, Fold, Wrap

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Clip.html)

Categories: Ugen
