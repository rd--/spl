+List{
	splitBy { :self :f/1 |
		self.split { :x :y |
			f(x) = f(y)
		}
	}
}

# splitBy

- _splitBy([x₁ x₂ …], f/1)_

Split the sequence _x_ into runs of successive items that give the same value when _f_ is applied.

Split into runs of numbers with identical integer part:

```
>>> [1, 3/2 .. 5].splitBy(integerPart/1)
[1 3/2; 2/1 5/2; 3/1 7/2; 4/1 9/2; 5/1]
```

Split by sign:

```
>>> [3 0 -4 3 3 -2 0 -3 -4 5].splitBy(sign/1)
[3; 0; -4; 3 3; -2; 0; -3 -4; 5]
```

Split by quotient:

```
>>> [1 .. 10].splitBy { :x | x // 3 }
[1 2; 3 4 5; 6 7 8; 9 10]
```

Split into runs of triples with identical first component:

```
>>> [1 2].tuples(3).splitBy(first/1)
[
	1 1 1; 1 1 2; 1 2 1; 1 2 2
	:;
	2 1 1; 2 1 2; 2 2 1; 2 2 2
]
```

* * *

See also: split, splitOn

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SplitBy.html)
