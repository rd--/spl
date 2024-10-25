# Comment Syntax

There are ordinarily two kinds of comment syntax.
A prefix form that uses a single token to comment until the end of a line,
and a bracketed form that uses begin and end tokens, and which may span multiple lines.

Spl follows the PL/I (or C) bracketed comment notation.

The C-language family prefix token is `//` (from BCPL) and the bracket tokens are `/*` and `*/` (from PL/I).
The bracket tokens would be legal operators,
however they are not used and imply a kind of nonsense.
`//` means quotient in Smalltalk.

The Ml (and Pascal and Mathematica and AppleScript) bracket tokens are `(*` and `*)`.
`(*` dissallows `c.reduce(*)`.

The Haskell prefix token is `--` and the bracket tokens are `{-` and `-}`.
The Haskell comment token `{-` disallows `{-}`,
however the ordinary notation for blocks includes spaces,
and `{ - }` is allowed.
In Spl lines often begin with `{` to open a block, and end with `}` to close a block,
which makes Haskell comments confusing, especially where there is not colour distinction.

_Rationale_:
Comment syntax is selected to use token sequences that are otherwise invalid or that are valid but unconventional.

* * *

See also: //

Categories: Syntax
