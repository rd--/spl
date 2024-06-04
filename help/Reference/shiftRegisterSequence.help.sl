# shiftRegisterSequence

- _shiftRegisterSequence(i, t, n)_

Answer _n_ places of the linear-feedback shift register (_Lfsr_) defined by initial state _i_ and taps _t_.

The maximal Lfsr of five places given by taps at one and three (i.e. _10100_):

```
>>> let i = [0 0 0 0 1];
>>> let t = [1 3];
>>> let n = 2 ^ 5 - 1;
>>> shiftRegisterSequence(i, t, n)
[
	0 1 0 0 1 0 1 1
	0 0 1 1 1 1 1 0
	0 0 1 1 0 1 1 1
	0 1 0 1 0 0 0
]
```

Use `partition` to recover register states,
which are interpreted as binary integers,
giving a permutation list:

```
>>> let i = [0 0 0 0 1];
>>> let t = [1 3];
>>> let n = 2 ^ 5 + 3;
>>> let s = shiftRegisterSequence(i, t, n);
>>> let r = s.partition(5, 1);
>>> let p = r.collect { :each | each.fromDigits(2) };
>>> (p, p.isPermutationList)
(
	[
		 9 18  5 11 22 12 25 19
		 7 15 31 30 28 24 17  3
		 6 13 27 23 14 29 26 21
		10 20  8 16  1  2  4
	],
	true
)
```

The maximal Lfsr of four places:

```
>>> shiftRegisterSequence([0 0 0 1], [1 2], 2 ^ 4 - 1)
[0 1 0 0 1 1 0 1 0 1 1 1 1 0 0]
```

* * *

See also: linearRecurrence

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ShiftRegisterSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Linear-feedback_shift_register)

Further Reading: Golomb 1967, Tausworthe 1965
