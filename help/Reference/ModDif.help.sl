# ModDif -- minimum difference of two values in modulo arithmetics

_ModDif(x, y, mod)_

Returns the minimum difference of two values in modulo arithmetics.
On a circle, there are two distances between two points.
This Ugen returns the smaller value of the two.

- x: First input value
- y: Second input value
- mod: Modulo (maximum value, double of the maximal difference)

Different moduli:

```
let sig = LfSaw(10, 0);
let dist = ModDif(sig, 0, 0:8 * MouseX(0, 1 / 5, 0, 0.2));
SinOsc(dist * 4000 + 400, 0).Splay * 0.1
```

Wrapping amplitude crossfade:

```
let nc = 12;
let x = SinOsc(RandN(nc, 300, 800), 0);
let d = ModDif (MouseX(0, nc * 2, 0, 0.2), [0 .. nc - 1], nc);
(x * (1 - d).Max(0)).Splay * 0.1
