# Comment Syntax

There are ordinarily two kinds of comment syntax.
A prefix form that uses a single token to comment until the end of a line,
and a bracketed form that uses begin and end tokens, and which may span multiple lines.

Spl follows the Haskell bracketed comment notation.

The Haskell prefix token is `--` and the bracket tokens are `{-` and `-}`.

The C-language family prefix token is `//` and the bracket tokens are `/*` and `*/`.
`//` means quotient in Smalltalk.

The Ml bracket tokens are `(*` and `*)`.
`(*` dissallows `c.reduce(*)`.

The Haskell comment token `{-` disallows `{-}`,
however the ordinary notation for blocks includes spaces,
and `{ - }` is allowed.

_Rationale_:
Comment syntax is selected use token sequences that are otherwise invalid or that are valid but unconventional.

* * *

See also: //

Categories: Syntax
