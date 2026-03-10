# bitAt

- _bitAt(x, k)_

Answer the bit corresponding to the coefficient of _2 ^ (k - 1)_ in the integer or bit set _x_.
`bitAt` gets the bit _k-1_ places from the right.
`bitAt` represents the bits it retrieves as 0 or 1.

Display coefficients at powers of 2 in the integer 42:

```
>>> 42.integerDigits(2)
[1 0 1 0 1 0]
```

Get the bit corresponding to the coefficient at 2 ^ 0:

```
>>> 42.bitAt(1)
0
```

Get the bit corresponding to the coefficient at 2 ^ 3:

```
>>> 42.bitAt(4)
1
```

A sequence by Rémy Sigrist,
_a(2n)=a(n)+k(n)_ and a(2n+1)=a(n)+3k(n)_,
where _k(n)_ is the least positive integer not leading to a duplicate term in the sequence,
OEIS [A304971](https://oeis.org/A304971):

~~~spl svg=A
let m = 300;
let a = [1];
let s = 2L ^ a[1];
1.toDo((m / 2).ceiling) { :n |
	let k = 1;
	let p = a[n];
	{ :break:/0 |
		let q = p + k;
		let r = p + (3 * k);
		(
			(s.bitAt(q + 1) = 0) & {
				s.bitAt(r + 1) = 0
			}
		).ifTrue {
			a := a ++ [q, r];
			s := s + (2 ^ q) + (2 ^ r);
			break()
		};
		k := k + 1
	}.repeatForeverWithBreak
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/bitAt-A.svg)

_Or-numbral_ multiplication table,
read by antidiagonals,
OEIS [A067138](https://oeis.org/A067138):

~~~spl svg=B
0:21.antidiagonalArray { :n :k |
	let r = 0;
	let m = n.bitLength - 1;
	0.toDo(m) { :i |
		(n.bitAt(i + 1) = 1).ifTrue {
			r := r.bitOr(
				k.bitShiftLeft(i)
			)
		}
	};
	r
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitAt-B.svg)

* * *

See also: Binary, bitAtPut, bitClear, BitSet, highBit, integerDigits

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitGet.html),
_Smalltalk_
5.6.5.5

Categories: Accessing, Bit Manipulation
