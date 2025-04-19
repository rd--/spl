# bitLength

- _bitLength(anInteger)_

Answer the number of binary bits necessary to represent _anInteger_.

```
>>> 32.bitLength
6
```

Equivalent to `floor` of `log` plus `one`:

```
>>> 32.log(2).floor + 1
6
```

Plot is a kind of staircase:

~~~spl svg=A
(-25:25).functionPlot(bitLength:/1)
~~~

![](sw/spl/Help/Image/bitLength-A.svg)

* * *

See also: integerLength

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitLength.html)
