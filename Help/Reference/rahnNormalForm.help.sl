# rahnNormalForm

- _rahnNormalForm(p)_

Answer the Rahn normal form of the pitch-class set _p_.

```
>>> [1 2 4].rahnNormalForm
[0 1 3]

>>> [2 7 11].rahnNormalForm
[0 4 7]

>>> [0 4 7 10].rahnNormalForm
[0 3 6 8]

>>> [11 7 2 3].rahnNormalForm
[0 3 4 8]

>>> [0 3 4 6 9].rahnNormalForm
[0 1 3 6 9]

>>> [0 2 4 5 7 9 11].rahnNormalForm
[0 1 3 5 6 8 10]
```

At the empty set:

```
>>> [].rahnNormalForm
[]
```

* * *

See also: forteName, rahnPrimeForm

Guides: Atonal Theory Functions

Further Reading: Rahn 1980
