# At Syntax -- syntax

Rewrite rule:

- _c[i]_ ⟹ _at(c, i)_
- _c[i, j]_ ⟹ _at(c, i, j)_
- _c[i, j, k]_ ⟹ _at(c, i, j, k)_

Syntax for the _at_ protocol.

_Note:_
This syntax is for accessing containers that support multiple indices, such as a matrix.
It is not a syntax for the _atAll_ protocol.

	let a = [1 .. 9]; a.atAll([1, 3, 7]) = [1, 3, 7]

The @* express this method succinctly:

	let a = [1 .. 9]; a @* [1, 3, 7] = [1, 3, 7]

* * *

See also: [AtIfAbsent Syntax], [AtPut Syntax], [Quoted At Syntax]
