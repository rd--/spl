# Clip2

- _Clip2(a, b)_

Waveshaping.
Bilateral clipping.
Clips _a_ to +/- _b_.

Fixed clipping:

```
SinOsc(400, 0).Clip2(0.2)
```

Time varying clipping:

```
SinOsc(1000, 0).Clip2(Line(0, 1, 23)) / 2
```

* * *

See also: Clip, Excess, Fold2, Wrap2

Categories: Ugen
