# reshapeList

- _reshapeList([x₁ x₂ …], ⍴)_

Answer a `List` with shape _⍴_ and with elements drawn from the list _x_ which must have size _Π⍴_.

Create a 2×2 matrix from a 2×2 matrix:

```
>>> let x = [1 2; 1 2];
>>> List(4, x).reshapeList([2 2])
[
	[
		[[1, 2], [1, 2]],
		[[1, 2], [1, 2]]
	],
	[
		[[1, 2], [1, 2]],
		[[1, 2], [1, 2]]
	]
]
```

* * *

See also: reshape

Guides: Array Functions, List Functions, Matrix Functions
