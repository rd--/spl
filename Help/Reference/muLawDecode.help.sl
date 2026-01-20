# muLawDecode

- _muLawDecode(x)_

Implement the continuous μ-law decoding algorithm.

Specific values:

```
>>> [0 0.752101 0.875703 0.948355 1]
>>> .collect(muLawDecode:/1)
[0 0.25 0.5 0.75 1]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(muLawDecode:/1)
~~~

![](sw/spl/Help/Image/muLawDecode-A.svg)

* * *

See also: muLawEncode

Guides: Signal Processing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Mu-law_algorithm)
