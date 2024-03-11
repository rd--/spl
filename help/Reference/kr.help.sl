# kr

- _kr(aUgen)_

Rewrite any audio rate elements of the Ugen graph above _aUgen_ to control rate.

```
>>> let o = SinOsc(3, 0);
>>> (o.scUgen.rate, o.kr.scUgen.rate)
(2, 1)
```

* * *

See also: Ugen
