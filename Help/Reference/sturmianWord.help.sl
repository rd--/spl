# sturmianWord

- _sturmianWord(c, k)_

Answer the first _k_ terms of the Sturmian word with slope _c_.

Sturmian word with slope _√2/2_,
OEIS [A080764](https://oeis.org/A080764):

```
>>> (2.sqrt / 2).sturmianWord(22)
[1 1 0 1 1 0 1 1 1 0 1 1 0 1 1 1 0 1 1 0 1 1]
```

The infinite Fibonacci word,
OEIS [A003849](https://oeis.org/A003849):

```
>>> let phi = 1.goldenRatio;
>>> (phi / (1 + (2 * phi)))
>>> .sturmianWord(22)
[0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0]
```

The Pell word,
the fixed point of the morphism _0→001,1→0_,
a Sturmian word,
OEIS [A171588](https://oeis.org/A171588):

```
>>> (1 - (1 / 2.sqrt)).sturmianWord(22)
[0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0]
```

Sturmian word,
OEIS [A230901](https://oeis.org/A230901):

```
>>> (2 / (13.sqrt - 1)).sturmianWord(22)
[1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 1 0 1 1 1 0 1]
```

Sturmian word,
OEIS [A144612](https://oeis.org/A144612):

```
>>> ((3 - 3.sqrt) / 2).sturmianWord(22)
[1 0 1 1 0 1 1 0 1 0 1 1 0 1 1 0 1 1 0 1 0 1]
```

The Pell word,
OEIS [A171588](https://oeis.org/A171588):

~~~spl svg=A oeis=A171588
(1 - (1 / 2.sqrt))
.sturmianWord(115)
.discretePlot
~~~

![](Help/Image/sturmianWord-A.svg)

* * *

See also: christoffelWord

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SturmianSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Sturmian_word)
[2](https://en.wikipedia.org/wiki/Sturmian_sequence)
[3](https://en.wikipedia.org/wiki/Cutting_sequence)
