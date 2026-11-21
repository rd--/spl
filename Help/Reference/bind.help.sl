# bind

- _bind(f/2, x)_

An alias for `bindLeft`.

```
>>> [1 .. 5].collect(+.bind(4))
[5 .. 9]

>>> [5 .. 9].collect(-.bind(4))
[-1, -2 .. -5]
```

* * *

See also: bindLeft, bindRight, constant

Guides: Function Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Bind)
