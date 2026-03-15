# parseFractionSeparatedBy

- _parseFractionSeparatedBy(s, d, f:/0)_

Answer the `Fraction` represented by the string _s_,
using separator _d_ to delimit the numerator and denominator.

Parse fraction written with a colon as separator:

```
>>> '3:4'.parseFractionSeparatedBy(':') { nil }
3/4

>>> '3/4'.parseFractionSeparatedBy(':') { nil }
nil
```

Sets the separator to '/':

```
>>> '9/8'.parseFractionSeparatedBy('/') { nil }
9/8
```

* * *

See also: parseFraction

Categories: Converting, Parsing
