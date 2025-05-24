# caseOf

- _caseOf(x, [y₁ → f₁, y₂ → f₂, …], f)_

Compare _x_ to each _y_ in turn,
evaluating the corresponding `Block` _f_ associated with the first item that matches.

that The elements of _aCollection_ are `Association`s.
Answer the evaluated `blockValue` of the first association whose unevaluated key equals _anObject_.

The keys of the associations are values that are to be compared with _anObject_ using `=`.
The values of the associations are `Block` values to be evaluated when a case matches.

Even if the answer values are constant they must be placed in blocks:

```
>>> let x = 'b';
>>> let c = [
>>> 	'a' -> { 1 },
>>> 	'b' -> { 2 },
>>> 	'c' -> { 3 }
>>> ];
>>> x.caseOf(c)
2
```

With both `key` and `value` of each association as `Block`s:

```
>>> let x = 'b';
>>> let c = [
>>> 	'a' -> { 1 * 1 },
>>> 	'b' -> { 2 * 2 },
>>> 	'c' -> { 3 * 3 }
>>> ];
>>> x.caseOf(c)
4
```

If no match is found, answer the result of evaluating the _otherwise_ clause:

```
>>> let c = ['a' -> { 1 }, 'b' -> { 2 }, 'c' -> { 3 }];
>>> 'd'.caseOf(c, identity:/1)
'd'
```

If no match is found, report an error:

```
>>> let c = ['a' -> { 1 }, 'b' -> { 2 }, 'c' -> { 3 }];
>>> {
>>> 	'd'.caseOf(c)
>>> }.ifError { true }
true
```

If _aCollection_ does not contain associations, report an `error`:

```
>>> {
>>> 	'x'.caseOf(['x' 'y' 'z'])
>>> }.ifError { true }
true
```

* * *

See also: =, if, value, which

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Switch.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Object.html#-switch)

Categories: Casing
