# BiLinRand

- _BiLinRand(input)_

Noise generator, uniform random numbers between _-input_ and _+input_.

```
BiLinRand(SinOsc(0.1, 0)) * 0.1
```

The below is only zero when _input_ is zero:

```
let n = BiLinRand(SinOsc(1 / 2, 0)) * 0.1;
n.Abs - n
```

Equivalent to:

```
WhiteNoise() * SinOsc(0.1, 0) * 0.1
```

* * *

See also: LinRand

Categories: Math, Operator
