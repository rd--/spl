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

~~~
-25:25.collect { :n | n.bitLength }.plot
~~~

* * *

See also: integerLength

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitLength.html)
