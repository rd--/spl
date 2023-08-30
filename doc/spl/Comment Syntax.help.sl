# Comment Syntax -- syntax

There are two comment forms.

1. The token `(*` comments until a closing `*)` token, as in Mls.
2. The token `;;` comments until the end of the line, as in Lisps.

_Rationale_: The usual C-language family comment tokens of `//`, `/*` and `*/` are all valid operators.
`//` means quotient, as in Smalltalk.
The comment tokens selected are all otherwise disallowed syntax.
Fortress uses `(*)` as the until-end-of-line comment token.
