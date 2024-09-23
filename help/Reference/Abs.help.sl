# Abs

- _Abs(aNumber)_

Answer the absolute value.

Contrary motion:

```
let a = Line(-1, 1, 2);
let b = a.Abs;
SinOsc([a, b] * 220 + [220, 440], 0) * [a, b] * 0.1
```

Compare:

```
let o = SyncSaw(100, 440);
[o, o.Abs] * 0.1
```

Full-wave rectification:

```
SinOsc(440, 0).Abs * 0.1
```

Wave folding:

```
let x = MouseX(0.25, 2, 0, 0.2);
let y = MouseY(1, 9, 0, 0.2);
let m = SinOsc([0.5 0.9] * x, 0).LinLin(-1, 1, 0.9, y);
let o = SinOsc([55 99], 0) * (m * (m > 0) + 1);
let z = o * 0.25 + 0.25;
(z - z.RoundTo(1)).Abs - 0.25
```

* * *

See also: abs, AbsDif

Categories: Ugen, Math
