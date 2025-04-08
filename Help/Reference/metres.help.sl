# metres

- _metres(x)_

At `SmallFloat`,
answer a `Quantity` representing _x_ metres,
not English spelling.

```
>>> 3.metres
Quantity(3, 'metres')
```

At `Quantity`,
answer value in metres:

```
>>> 300.centimetres.metres
3
```

* * *

See also: centimetres, Quantity
