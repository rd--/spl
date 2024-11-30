# substitutionSystem

- _substitutionSystem(rule, initialCondition, count)_

Answer a `List` representing the evolution of the substitution system with the specified rule,
given as a `Map`,
from _initialCondition_ for _count_ steps.

Five steps of a substitution system that generates the infinite Fibonacci word:

```
>>> let rule = [0 -> [0 1], 1 -> [0]].asMap;
>>> rule.substitutionSystem([0], 5)
[
	0;
	0 1;
	0 1 0;
	0 1 0 0 1;
	0 1 0 0 1 0 1 0;
	0 1 0 0 1 0 1 0 0 1 0 0 1
]
```

C.f. `fibonacciWord`:

```
>>> 1:13.fibonacciWord
[0 1 0 0 1 0 1 0 0 1 0 0 1]
```

Generate five steps in a Thue–Morse substitution system:

```
>>> let rule = [0 -> [0 1], 1 -> [1 0]].asMap;
>>> rule.substitutionSystem([0], 5)
[
	0;
	0 1;
	0 1 1 0;
	0 1 1 0 1 0 0 1;
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0;
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0
	1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
]
```

C.f. `thueMorse`:

```
>>> [0 .. 2 ^ 5 - 1].thueMorse
[
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0
	1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
]
```

The initial condition can be of any length:

```
>>> let rule = [0 -> [0 1], 1 -> [1 0]].asMap;
>>> rule.substitutionSystem([0 1 0], 3)
[
	0 1 0;
	0 1 1 0 0 1;
	0 1 1 0 1 0 0 1 0 1 1 0;
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
]
```

Rule with three tokens:

```
>>> let rule = [0 -> [1 2], 1 -> [1 2], 2 -> [0 1]].asMap;
>>> rule.substitutionSystem([0], 3)
[
	0;
	1 2;
	1 2 0 1;
	1 2 0 1 1 2 1 2
]
```

Derived rule:

```
>>> let rule = 1:3.collect { :n | n -> [1 .. n] }.asMap;
>>> rule.substitutionSystem([3], 3)
[
	3;
	1 2 3;
	1 1 2 1 2 3;
	1 1 1 2 1 1 2 1 2 3
]
```

Steps in constructing a Cantor set:

```
>>> let rule = [1 -> [1 0 1], 0 -> [0 0 0]].asMap;
>>> rule.substitutionSystem([1], 3)
[
	1;
	1 0 1;
	1 0 1 0 0 0 1 0 1;
	1 0 1 0 0 0 1 0 1
	0 0 0 0 0 0 0 0 0
	1 0 1 0 0 0 1 0 1
]
```

* * *

See also: Association, fibonacciWord, Map, thueMorse

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SubstitutionSystem.html)
