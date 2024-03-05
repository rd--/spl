# Sum3Rand

- _Sum3Rand(input)_

Noise generator, quasi-Gaussian random numbers between _-input_ and _+input_.

```
Sum3Rand(SinOsc(0.1, 0)) * 0.1
```

The below is only zero only when _input_ is zero:

```
let n = Sum3Rand(SinOsc(1 / 2, 0)) * 0.1;
n.Abs - n
```

* * *

See also: BiLinRand, LinRand

Categories: Math, Operator
