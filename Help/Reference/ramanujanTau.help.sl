# ramanujanTau

- _ramanujanTau(n)_

Answer the Ramanujan τ function _τ(n)_.

First few terms:

```
>>> 1:33.collect(ramanujanTau:/1)
[
	1 -24
	252 -1472
	4830 -6048
	-16744 84480
	-113643 -115920
	534612 -370944
	-577738 401856
	1217160 987136
	-6905934 2727432
	10661420 -7109760
	-4219488 -12830688
	18643272 21288960
	-25499225 13865712
	-73279080 24647168
	128406630 -29211840
	-52843168 -196706304
	134722224
]
```

At zero:

```
>>> 0.ramanujanTau
0
```

Multiplicative for coprime integers:

```
>>> (7 * 5).ramanujanTau
7.ramanujanTau * 5.ramanujanTau
```

Logarithmic plot:

~~~spl svg=A
1:33
.collect(ramanujanTau:/1)
.abs
.log
.linePlot
~~~

![](sw/spl/Help/Image/ramanujanTau-A.svg)

* * *

See also: bernoulliNumber, divisorSigma

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TauFunction.html)
[2](https://reference.wolfram.com/language/ref/RamanujanTau.html),
_OEIS_
[1](https://oeis.org/A000594),
_W_
[1](https://en.wikipedia.org/wiki/Ramanujan_tau_function)

Unicode: U+03C4 τ Greek Small Letter Tau
