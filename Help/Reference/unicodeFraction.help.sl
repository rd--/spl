# unicodeFraction

- _unicodeFraction(n/d)_

If the fraction _n/d_ has a unicode code-point answer it.

```
>>> 3/4.unicodeFraction
'¾'

>>> 2/3.unicodeFraction
'⅔'

>>> {
>>> 	11/13.unicodeFraction
>>> }.hasError
true
```

* * *

See also: Fraction

Guides: String Functions

Categories: Printing
