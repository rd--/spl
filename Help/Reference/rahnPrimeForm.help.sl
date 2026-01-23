# rahnPrimeForm

- _rahnPrimeForm(p)_

Answer the Rahn prime form of the pitch-class set _p_.
The prime form is the most compact form of _p_ or its inverse.

```
>>> [1 2 4].rahnPrimeForm
[0 1 3]

>>> [2 7 11].rahnPrimeForm
[0 3 7]

>>> [11 7 2 3].rahnPrimeForm
[0 1 4 8]

>>> [0 2 4 5 7 9 11].rahnPrimeForm
[0 1 3 5 6 8 10]
```

At the empty set:

```
>>> [].rahnPrimeForm
[]
```

* * *

See also: forteNumber, rahnNormalForm, rahnSetClassTable

Guides: Atonal Theory Functions

Further Reading: Rahn 1980
