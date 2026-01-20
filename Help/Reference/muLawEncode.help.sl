# muLawEncode

- _muLawEncode(x)_

Implement the continuous μ-law encoding algorithm.

Specific values:

```
>>> [0, 0.25 .. 1].collect(
>>> 	muLawEncode:/1
>>> )
[0 0.7521 0.8757 0.9484 1]
```

Threads over lists,
encoding followed by decoding:

```
>>> let a = (-1 -- 1).discretize(100);
>>> let b = a.muLawEncode;
>>> let c = b.muLawDecode;
>>> (c - a).abs.max
0
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(muLawEncode:/1)
~~~

![](sw/spl/Help/Image/muLawEncode-A.svg)

* * *

See also: muLawDecode

Guides: Sigmoid Functions, Signal Processing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Mu-law_algorithm)
