# Wrap2

- _Wrap2(input, aNumber)_

Bilateral wrapping.
Wraps _input_ signal to +/- _aNumber_.

```
SinOsc(1000, 0).Wrap2(
	Line(0, 1.01, 8)
) * 0.1
```

* * *

See also: Clip2, Wrap

Categories: Ugen
