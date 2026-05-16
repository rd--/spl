# turingMachineFromNumber

- _turingMachineFromNumber(n, s=2, k=2)_

Answer the `List` of rules converts for the Turing machine specified with rule number _n_,
having _s_ states and _k_ colors.

Generate the list of rules corresponding to 2-state, 2-color machine 2506:

```
>>> 2506.turingMachineFromNumber(2, 2)
[
	[1 1] -> [2 0 -1],
	[1 0] -> [2 1 1],
	[2 1] -> [1 0 1],
	[2 0] -> [1 1 -1]
]
```

Generate the rule representation of a simple universal Turing machine:

```
>>> 596440.turingMachineFromNumber(2, 3)
[
	[1 2] -> [1 1 -1],
	[1 1] -> [1 2 -1],
	[1 0] -> [2 1 1],
	[2 2] -> [1 0 1],
	[2 1] -> [2 2 1],
	[2 0] -> [1 2 -1]
]
```

Generate the rule representation of a 3-state, 2-color machine:

```
>>> 2139050.turingMachineFromNumber(3, 2)
[
	[1 1] -> [3 0 -1],
	[1 0] -> [2 1 1],
	[2 1] -> [1 0 1],
	[2 0] -> [3 1 -1],
	[3 1] -> [2 1 -1],
	[3 0] -> [1 1 -1]
]
```

Generate the rule representation of a 2-state, 2-color machine:

```
>>> 3932.turingMachineFromNumber(2, 2)
[
	[1 1] -> [2 1 1],
	[1 0] -> [2 0 1],
	[2 1] -> [1 1 1],
	[2 0] -> [2 0 -1]
]
```

* * *

See also: integerDigits, mod, quotient

Guides: Automata Functions

References:
_Mathematica_
[1](https://resources.wolframcloud.com/FunctionRepository/resources/TuringMachineFromNumber)
