# arithmeticSeries -- arithmetic

- _arithmeticSeries(count, start, step)_

Arithmetic series:

	5.arithmeticSeries(1, 2) = [1 3 5 7 9]

The count and step values may be signals:

```
var tr = Impulse(1, 0);
var start = Rand(tr, 222, 333);
var step = Rand(tr, 111, 555);
var freq = 8.arithmeticSeries(start, step);
(SinOsc(freq, 0) / Rand(tr, 7, 13)).Splay
```

* * *

See also: geometricSeries, Interval
