# recamanSequence

- _recamanSequence(anInteger)_

Recamáns sequence: _a[n] = a[n - 1] - n_ if non-negative and not already in the sequence,
otherwise _a[n] = a[n - 1] + n_.

```
>>> 71.recamanSequence
[
	 0   1   3   6   2   7  13  20  12  21
	11  22  10  23   9  24   8  25  43  62
	42  63  41  18  42  17  43  16  44  15
	45  14  46  79 113  78 114  77  39  78
	38  79  37  80  36  81  35  82  34  83
	33  84  32  85  31  86  30  87  29  88
	28  89  27  90  26  91 157 224 156 225
	155
]
```

Line plot of the first one-thousand terms:

~~~
1000.recamanSequence.linePlot
~~~

Scatter plot of the first two-thousand terms:

~~~
2000.recamanSequence.scatterPlot
~~~

* * *

See also: Set

Guides: Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RecamansSequence.html),
_OEIS_
[1](https://oeis.org/A005132),
_W_
[1](https://en.wikipedia.org/wiki/Recam%C3%A1n%27s_sequence)

Categories: Math, Sequence
