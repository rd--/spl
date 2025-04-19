# fibonacciWord

- _fibonacciWord(anInteger)_

Answer the _anInteger_-th letter in the infinite Fibonacci word.

Calculate the first one hundred elements:

```
>>> 1:100.collect(fibonacciWord:/1)
[
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 1
	0 0 1 0 0 1 0 1 0 0
	1 0 0 1 0 1 0 0 1 0
	1 0 0 1 0 0 1 0 1 0
	0 1 0 1 0 0 1 0 0 1
	0 1 0 0 1 0 0 1 0 1
	0 0 1 0 1 0 0 1 0 0
	1 0 1 0 0 1 0 0 1 0
	1 0 0 1 0 1 0 0 1 0
]
```

The Fibonacci word can be generated using a substitution system,
at the seventh step thirty-four terms have been generated:

```
>>> let rule = [0 -> [0 1], 1 -> [0]].asMap;
>>> rule.substitutionSystem([0], 7).last
[
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 1
	0 0 1 0 0 1 0 1 0 0
	1 0 0 1
]
```

* * *

See also: fibonacci, substitutionSystem

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RabbitSequence.html),
_OEIS_
[1](https://oeis.org/A003849),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_word)
