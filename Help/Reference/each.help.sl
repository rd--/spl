# each

- _each(f/1 | f/2)_

Answer a `Block` that will either apply the unary block _f_ to one argument using `collect`,
or will apply the binary block _f_ to two arguments using `withCollect`.

```
>>> size/1 <$ [1 2 3; 4 5]
2

>>> size/1.each <$ [1 2 3; 4 5]
[3 2]

>>> reverse/1 <$ [1 2 3; 4 5]
[4 5; 1 2 3]

>>> reverse/1.each <$ [1 2 3; 4 5]
[3 2 1; 5 4]

>>> [1 2] + [3 4]
[4 6]

>>> [1 2] +.each [3 4]
[4 6]

>>> [1 2; 3 4] ++ [5 6; 7 8]
[1 2; 3 4; 5 6; 7 8]

>>> [1 2; 3 4] ++.each [5 6; 7 8]
[1 2 5 6; 3 4 7 8]
```

* * *

See also: $, collect, map, withCollect

References:
_Apl_
[1](https://aplwiki.com/wiki/Each)
