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

Typed code fence predicates:

```
>>> '```'.isGraveAccentCodeFence
true

>>> '~~~'.isTildeCodeFence
true
```

* * *

See also: Fenced Code Blocks

Categories: Testing
