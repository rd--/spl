# each

- _each(f/n)_

Answer a `Block` that will either apply the unary block _f_ to one argument using `collect`,
or will apply the binary block _f_ to two arguments using `withCollect`.

At unary _f_:

```
>>> let a = [1 2 3; 4 5];
>>> let f/1 = size/1.each;
>>> (a.size, f(a))
(2, [3, 2])

>>> let a = [1 2 3; 4 5];
>>> let f/1 = reverse/1.each;
>>> (a.reverse, f(a))
([4 5; 1 2 3], [3 2 1; 5 4])
```

At binary _f_:

```
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

See also: collect, map, withCollect

Guides: List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Each)
