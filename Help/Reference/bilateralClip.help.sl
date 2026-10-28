# bilateralClip

- _bilateralClip(a, b)_

Waveshaping.
Bilateral clipping.
Clips _a_ to +/- _b_.

At `SmallFloat`:

```
>>> (-2 .. 2).collect { :each |
>>> 	bilateralClip(each, 1)
>>> }
[-1 -1 0 1 1]
```

Fixed clipping:

```
sinOsc(400, 0)
.bilateralClip(0.2)
```

Time varying clipping:

```
sinOsc(1000, 0)
.bilateralClip(
	line(0, 1, 23)
) / 2
```

* * *

See also: bilateralFold, bilateralWrap, clip, excess

Guides: Unit Generators

Categories: Math, Ugen
