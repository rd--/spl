# flattenTo

- _flatten(aSequence, anInteger)_

Flatten _aSequence_ to level _anInteger_.

No flattening:

```
>>> [0, [1], [[2, -2]], [[[3, -3]]], [[[[4]]]]].flattenTo(0)
[0, [1], [[2, -2]], [[[3, -3]]], [[[[4]]]]]
```

Flatten to level one:

```
>>> [0, [1], [[2, -2]], [[[3, -3]]], [[[[4]]]]].flattenTo(1)
[0, 1, [2, -2], [[3, -3]], [[[4]]]]
```

Flatten to level two:

```
>>> [0, [1], [[2, -2]], [[[3, -3]]], [[[[4]]]]].flattenTo(2)
[0, 1, 2, -2, [3, -3], [[4]]]
```


Flatten to level three:

```
>>> [0, [1], [[2, -2]], [[[3, -3]]], [[[[4]]]]].flattenTo(3)
[0, 1, 2, -2, 3, -3, [4]]
```

Flatten to level four:

```
>>> [0, [1], [[2, -2]], [[[3, -3]]], [[[[4]]]]].flattenTo(4)
[0 1 2 -2 3 -3 4]
```

This is the same as using level :

```
>>> [0, [1], [[2, -2]], [[[3, -3]]], [[[[4]]]]].flattenTo(inf)
[0 1 2 -2 3 -3 4]
```

* * *

See also: concatenation

References:
_Apl_
[1](https://aplwiki.com/wiki/Ravel),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Flatten.html)

Categories: Converting
