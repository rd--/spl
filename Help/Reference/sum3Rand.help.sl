# sum3Rand

- _sum3Rand(input)_

Noise generator, quasi-Gaussian random numbers between _-input_ and _+input_.

```
sum3Rand(sinOsc(0.1, 0)) * 0.1
```

The below is only zero only when _input_ is zero:

```
let n = sum3Rand(sinOsc(1 / 2, 0)) * 0.1;
n.abs - n
```

* * *

See also: BiLinRand, linRand

Guides: Unit Generators

Categories: Ugen, Math, Operator
