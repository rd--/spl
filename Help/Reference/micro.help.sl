# micro

- _micro(x)_

Answer the number _x_ times 1E-6.
Micro is a unit prefix in the metric system denoting a factor of one millionth.
It comes from the Greek word μικρός (mikrós), meaning "small".
It is part of the International System of Units (SI).

```
>>> 23.micro
0.000023

>>> 23.micro * 1E6
23
```

Adjacent units are `nano` and `milli`:

```
>>> 23.micro * 1E-3
23.nano

>>> 23.micro * 1E3
23.milli
```

At `Quantity`:

```
>>> 23.metres.micro
Quantity(2.3E-05, 'metres')
```

Where supported `micro` is displayed as μ.

* * *

See also: centi, deci, deca, hecto, giga, kilo, mega, milli, nano, pico, terra

Guides: SI Units

Unicode: U+03BC μ Greek Small Letter Mu

References:
_W_
[1](https://en.wikipedia.org/wiki/Micro-)
