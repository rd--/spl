# keyMap

- _keyMap(f:/1, d)_

Maps _f_ over the keys of the dictionary _d_.

At `Record`:

```
>>> capitalize:/1.keyMap(
>>> 	(x: 1, y: 2, z: 3)
>>> )
(X: 1, Y: 2, Z: 3)
```

If applying _f_ produces repeated keys, later instances replace earlier ones,
at `Map`:

```
>>> abs:/1.keyMap(
>>> 	Map[1 'a'; 2 'b'; -1 'c']
>>> )
Map[1 'c'; 2 'b']
```

* * *

See also: collect, keysAndValuesCollect, keysAndValuesDo, map

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KeyMap.html)
