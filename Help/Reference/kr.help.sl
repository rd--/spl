# kr

- _kr(u)_

Rewrite any audio rate elements of the Ugen graph above _u_ to control rate.

```
>>> let o = sinOsc(3.0, 0.0);
>>> (o.scUgen.rate, o.kr.scUgen.rate)
(2, 1)
```

* * *

See also: Ugen
