# Clip

- _Clip(x, ⌊=0, ⌈=1)_

Clip a signal outside given thresholds.
Differs from `Clip2` in that it allows one to set both low and high thresholds.

- x: signal to be clipped
- ⌊: low threshold of clipping
- ⌈: high threshold of clipping

Clip sine:

```
Clip(SinOsc(440, 0) * 0.2, -0.07, 0.07)
```

* * *

See also: clip, Clip2, Fold, Wrap

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_common_clamp/)
[2](https://docs.cycling74.com/reference/gen_common_clip/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Clip.html)

Categories: Math, Ugen
