# unique

- _unique([x₁ x₂ …])_
- _unique(s)_

At `List`,
answer the same values as in _x_, but with no repetitions, and in sorted order.

```
>>> [1 1 2 1 2 3 1 2 3 4].unique
[1 2 3 4]

>>> [9 2 9 5].unique
[2 5 9]

>>> ['3' '2' '1' '2' '3'].unique
['1' '2' '3']
```

At `String`,
answers a copy of the string _s_ with a unique identifier appended.
The appended identifier is given by `uniqueId`.

```
>>> 'x'.unique
'x' ++ (system.uniqueId - 1).asString
```

Plot unique digits used in _n_ in numerical order,
OEIS [A180410](https://oeis.org/A180410):

~~~spl svg=A oeis=A180410
1:150.collect { :n |
	n.integerDigits
	.unique
	.sort
	.fromDigits
}.scatterPlot
~~~

![](sw/spl/Help/Image/unique-A.svg)

Fermi-Dirac primes,
numbers of the form _p^(2^k)_ where _p_ is prime and _k≥0_,
OEIS [A050376](https://oeis.org/A050376):

~~~spl svg=B oeis=A050376
let m = 300;
let t = [];
let k = 1;
let n = nil;
{
	n := m ^ (1 / k);
	n > 2
}.whileTrue {
	t.addAll(2:n.primePi.prime ^ k);
	k := 2 * k
};
t.unique.scatterPlot
~~~

![](sw/spl/Help/Image/unique-B.svg)

* * *

See also: ++, nub, sort, String, uniqueElements, uniqueId

Guides: Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Unique.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.unique.html)
