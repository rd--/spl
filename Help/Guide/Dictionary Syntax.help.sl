# Dictionary Syntax

Rewrite rule:

- _[|k→v, …|]_ ⟹ _Dictionary([k→v, …])_

With `String` keys:

```
>>> [|'x' -> 1, 'y' -> 2, 'z' -> 3|]
Dictionary(['x' -> 1, 'y' -> 2, 'z' -> 3])
```

With `SmallFloat` keys:

```
>>> let d = [|1 -> 'x', 2 -> 'y', 3 -> 'z'|];
>>> (d.keys, d.values, d.associations)
(
	[1 2 3],
	['x' 'y' 'z'],
	[1 -> 'x', 2 -> 'y', 3 -> 'z']
)
```

Empty `Dictionary`,
note that the space character is required,
the expression `[||]` is parsed as a `List` of one place holding the binary operator `||`:

```
>>> let d = [| |];
>>> (d.isDictionary, d.isEmpty)
(true, true)
```

Where supported [| is displayed as ⟦ and |] as ⟧.

* * *

See also: Dictionary, Map, Record

Guides: Map Syntax, Record Syntax

Unicode: U+27E6 ⟦ Mathematical Left White Square Bracket, U+27E7 ⟧ Mathematical Right White Square Bracket
