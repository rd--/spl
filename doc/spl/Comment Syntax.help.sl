# Comment Syntax -- syntax

The only allowed comment form is a bracketed comment syntax.

The token `(*` comments until a closing `*)` token, as in Mls.

_Rationale_:
The usual C-language family comment tokens of `//`, `/*` and `*/` are all valid operators.
`//` means quotient, as in Smalltalk.
The comment tokens selected are all otherwise disallowed syntax.
Fortress uses `(*)` as the until-end-of-line comment token.
