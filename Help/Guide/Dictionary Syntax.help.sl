# Dictionary Syntax

Rewrite rule:

- _[|k → v, …|]_ ⟹ _Dictionary([k → v, …])_

Dictionaries are written as association lists between special squared brackets:

```
>> '[|k -> v|]'.splSimplify
Dictionary([->(k, v)])

>> '[| |]'.splSimplify
Dictionary([])
```

With `String` keys:

```
>>> [|'x' -> 1, 'y' -> 2, 'z' -> 3|]
Dictionary(['x' -> 1, 'y' -> 2, 'z' -> 3])
```

With `SmallFloat` keys:

```
>>> let c = [|1 -> 'x', 2 -> 'y', 3 -> 'z'|];
>>> (c.keys, c.values, c.associations)
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
>>> let c = [| |];
>>> (c.isDictionary, c.isEmpty)
(true, true)
```

Where supported [| is displayed as ⟦ and |] is displayed as ⟧.

* * *

See also: Dictionary, Map, Record

Guides: Map Syntax, Record Syntax, Syntax Guides

Unicode: U+27E6 ⟦ Mathematical Left White Square Bracket, U+27E7 ⟧ Mathematical Right White Square Bracket
