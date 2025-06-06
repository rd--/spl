# Fold

- _Fold(x, ⌊=0, ⌈=1)_

Fold a signal outside given thresholds.
This differs from `Fold2` in that it allows one to set both low and high thresholds.

- in: signal to be folded
- lo: low threshold of folding, values < lo will be folded.
- hi: high threshold of folding, values > hi will be folded.

```
Fold(SinOsc(440, 0) * 0.2, -0.1, 0.1)
```

Modulate both fold points, at different ratios:

```
let x = MouseX(0.1, 0.2, 0, 0.2);
Fold(SinOsc(440, 0) * 0.2, x.- / 2, x)
```

Modulate one fold point:

```
let x = MouseX(0.1, 0.2, 0, 0.2);
Fold(SinOsc(440, 0) * 0.2, -0.2, x)
```

* * *

See also: Clip, Clip2, fold, Fold2, Wrap, Wrap2

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_common_fold/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Fold.html)

Categories: Ugen
