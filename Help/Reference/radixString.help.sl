# radixString

- _radixString(n, r)_

Answer the radix-_r_ string literal for the integer _n_.
The value _n_ must be an integer,
the answer is a valid Sᴘʟ expression.

At `Float`:

```
>>> 33.0.radixString(2)
'2b100001'

>>> 254.0.radixString(16)
'16bFE'

>>> -42.0.radixString(16)
'-16b2A'

>>> system.evaluate('-16b2A')
-42.0

>>> {
>>> 	1.pi.radixString(3)
>>> }.hasError
true
```

* * *

See also: floatString, integerString, printString
