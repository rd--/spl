# Comment Syntax

There are two comment forms.

1. The token `;;` comments until the end of the line, as in Lisps.
2. The token `(*` comments until a closing `*)` token, as in Mls.

_Rationale_: The usual C-language family comment tokens of `//`, `/*` and `*/` are all valid operators.
In `Spl` `//` means quotient, as in Smalltalk.
The comment tokens selected are all otherwise disallowed syntax.
