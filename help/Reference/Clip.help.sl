# Clip

- _Clip(in, lo=0, hi=1)_

Clip a signal outside given thresholds.
Differs from `Clip2` in that it allows one to set both low and high thresholds.

- in: Signal to be clipped.
- lo: Low threshold of clipping. Must be less then hi.
- hi: High threshold of clipping. Must be greater then lo.

Clip sine:

```
Clip(SinOsc(440, 0) * 0.2, -0.07, 0.07)
```

* * *

See also: Clip2, Fold, Wrap
