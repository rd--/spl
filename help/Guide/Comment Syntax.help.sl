# Comment Syntax

Spl follows the Haskell comment notation.

There two forms,
a bracketed syntax that may span multiple lines,
and a prefix syntax that comments until the end of a line.

The bracket tokens are `{-` and `-}`.

The prefix token is `--`.

_Rationale_:
The C-language family prefix comment token `//` means quotient in Smalltalk.

The Ml comment token `(*` dissallow `c.reduce(*)`.

The Haskell comment token `{-` disallows `{-}`,
however the ordinary notation for blocks includes spaces,
and `{ - }` is allowed.

* * *

Categories: Syntax
