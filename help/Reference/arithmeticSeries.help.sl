# arithmeticSeries

- _arithmeticSeries(count, start, step)_

Arithmetic series:

	5.arithmeticSeries(1, 2) = [1 3 5 7 9]

The count and step values may be signals:

```
let tr = Impulse(1, 0);
let start = TRand(222, 333, tr);
let step = TRand(111, 555, tr);
let freq = 8.arithmeticSeries(start, step);
(SinOsc(freq, 0) / TRand(7, 13, tr)).Splay
```

* * *

See also: geometricSeries, Interval

Categories: Arithmetic
