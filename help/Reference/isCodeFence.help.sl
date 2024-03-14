# isCodeFence

- _isCodeFence(aString)_

Answer `true` if _aString_ is a _code fence_, else `false`.
A _code fence_ is a sequence of at least three consecutive grave accent characters ('```') or tilde characters ('~~~').

Plain code fences:

```
>>> '```'.isCodeFence
true

>>> '~~~'.isCodeFence
true
```

Code fences with attributes:

```
>>> '```spl'.isCodeFence
true

>>> '~~~spl'.isCodeFence
true
```

CommonMark allows for code blocks to have up to three spaces of indentation,
which this method does not allow:

```
>>> '   ```'.isCodeFence
false
```

Typed code fence predicates:

```
>>> '```'.isGraveAccentCodeFence
true

>>> '~~~'.isTildeCodeFence
true
```

* * *

See also: Fenced Code Blocks

References:
_CommonMark_
[1](https://spec.commonmark.org/0.31.2/#fenced-code-blocks)

Categories: Testing
