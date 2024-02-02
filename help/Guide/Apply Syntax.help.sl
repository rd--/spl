# Apply Syntax -- syntax

Rewrite rule:

- _f()_ ⟹ _f:/0 . ()_
- _f(x, ...)_ ⟹ _f:/n . (x, ...)_

Ordinarily method application is written _f(x, ...)_,
where _f_ is the _unqualified name_ of a method,
and _x..._ are the arguments.

	plus:/2 . (3, 4) = 7
	plus(3, 4) = 7

No argument method application is written _f()_.

	let f = { 7 }; f:/0 . () = 7
	let f = { 7 }; f() = 7

* * *

See also: [Value Apply Syntax]
