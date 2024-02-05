# Block Implementation

The Smalltalk _BlockClosure_ semantics can be implemented in Scheme (using _lambda_, _let_ and _set!_) and in Javascript (using _function_, _var_ and _=_).

The table below shows equivalent notations for a simple one argument block.

_Spl:_

```
{ :n |
	let i = random(0, n);
	let j = random(0, i);
	[i, j]
}
```

_Smalltalk:_

```
[ :n |
	| i j |
	i := 0 random: n.
	j := 0 random: i.
	{i. j}
]
```

_Scheme_:

```
(lambda (n)
	(let* ((i (random 0 n))
		(j (random 0 i)))
	(vector i j)))
```

_Js_:

```
function(n) {
	const i = random(0, n);
	const j = random(0, i);
	return [i, j];
}
```
