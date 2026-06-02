# String Constructor Syntax

Rewrite rule:

- _T'…'_ ⟹ _T('…')_

Uppercase unary functions may elide application parenthesis when applied to single quoted strings.

```
>>> Url'a://b'
Url('a://b')
```

_Rationale_:
This syntax supports the idiom of constructor functions taking a singular `String` argument.
It prevents typing _'…'.T_ simply to avoid typing _T('…')_.

* * *

Guides: List Constructor Syntax, Syntax Guides
