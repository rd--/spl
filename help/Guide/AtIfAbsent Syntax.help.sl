# AtIfAbsent Syntax

Rewrite rule:

- _c[k] :? a_ ⟹ _atIfAbsent(c, k, a)_

Syntax for the _atIfAbsent_ protocol.
Read the value at the index _k_ of the collection _c_, if it is absent evaluate _a_.
_a_ must be a literal block.

	let c = ();
	c['x'] :? { 'y' }

Written out:

```
>>> let c = ();
>>> c.atIfAbsent('x') { 'y' }
'y'
```

This is a form of _ternary syntax_, the operator :? is also a part of `Quoted AtIfAbsent Syntax`.

Where supported `:?` is displayed as ⍰.

* * *

See also: ?

Guides: At Synax, AtAll Syntax, AtPut Syntax, Quoted AtIfAbsent Syntax, Quoted At Syntax

Unicode: U+2370 ⍰ Apl Functional Symbol Quad Question

Categories: Syntax
