# Schmidt

- _Schmidt(in, lo, hi)_

Schmidt trigger.
When _in_ crosses to greater than _hi_, output 1, then when signal crosses lower than _lo_ output 0.
Uses the formula:

> _if(out == 1, { if(in < lo, { out = 0.0 }) }, { if(in > hi, { out = 1.0 }) })_

Output is initially zero.

- in: signal to be tested
- lo: low threshold
- hi: high threshold

Threshold octave jumps:

```
let in = LfNoise1(3);
let octave = Schmidt(in, -0.15, 0.15) + 1;
SinOsc(in * 200 + 500 * octave, 0) * 0.1
```

