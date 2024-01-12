# AtAllArray Syntax -- syntax

Rewrite rule:

- _c[k1, k2...]_ ⟹ _atAll(c, [k1, k2...])_

Syntax for the _atAll_ protocol.

	let a = [1 .. 9]; a[1, 3, 7] = [1, 3, 7]

The @* operator can also express this idiom succinctly:

	let a = [1 .. 9]; a @* [1, 3, 7] = [1, 3, 7]

* * *

See also: [At Syntax], [Quoted At Syntax]
