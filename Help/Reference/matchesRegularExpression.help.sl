# matchesRegularExpression

- _matchesRegularExpression(s, r)_

Answers `true` if the string _s_ matches the regular expression _r_, else `false`.
The expression to match is read using `asRegularExpression`, so an uncompiled regular expression may be used.

Match Lisp:

```
>>> 'caddar'.matchesRegularExpression('c(a|d)+r')
true
```

Match Dna:

```
>>> 'acggtaagc'.matchesRegularExpression('[acgt]+')
true
```

Match _x_ prefix:

```
>>> 'xy.z'.matchesRegularExpression('x.*')
true
```

* * *

See also: matches, RegularExpression

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringMatchQ.html)

Categories: Testing
