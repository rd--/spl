# metres

- _metres(x)_

At `SmallFloat`,
answer a `Quantity` representing _x_ metres,
not English spelling.

```
>>> 3.metres
Quantity(3, 'metres')
```

At `Length`,
answer value in metres:

```
>>> 300.centimetres.asLength.metres
3
```

* * *

See also: centimetres, Length
