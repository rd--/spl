# notAnd

- _notAnd(b, f:/0)_

Not and,
often abbreviated _nand_,
also known as the Sheffer stroke,
answer `false` if _b_ and _f()_ are both `true`,
else `false`.

Truth table:

```
>>> { :a :b |
>>> 	a.notAnd { b }
>>> }.table([true false], [true false])
[
	false true;
	true true
]
```

Lexicographically earliest sequence of distinct terms such that every pair of consecutive terms contains a term that is a unitary divisor of the other term,
OEIS [A282291](https://oeis.org/A282291):

~~~spl svg=A oeis=A282291
let a = [1];
58.timesRepeat {
	let k = 1;
	let e = a.last;
	{
		let [p, q] = [k, e].sort;
		a.includes(k) | {
			q.divisible(p).notAnd {
				p.isCoprime(q / p)
			}
		}
	}.whileTrue {
		k := k + 1
	};
	a.add(k)
};
a.discretePlot.log
~~~

![](Help/Image/notAnd-A.svg)

* * *

See also: and, nor, not, or

Unicode: U+22BC ⊼ Nand Unicode Character
