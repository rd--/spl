# isCodeFence

- _isCodeFence(s)_

Answer `true` if the string _s_ is a _code fence_, else `false`.
A _code fence_ is a line that begins with three consecutive _fence characters_.
Opening code fences may contain _attributes_.

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

The binary form allows for typed code fence predicates:

```
>>> '```'.isCodeFence('`')
true

>>> '~~~'.isCodeFence('~')
true
```

* * *

See also: beginsWith, or, repeat

Guides: Fenced Code Blocks

References:
_CommonMark_
[1](https://spec.commonmark.org/0.31.2/#fenced-code-blocks)

Categories: Testing, Help
