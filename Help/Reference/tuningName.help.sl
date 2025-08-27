# tuningName

- _tuningName([r₁ r₂ …])_

Answer a `String` naming the tuning specified by the list of ratios _r_ according to the Scala tuning database.

```
>>> [1/1 9/8 32/27 4/3 3/2 128/81 16/9]
>>> .tuningName
'aeolic'

>>> 1:17.octaveReduce
>>> .nub.sort
>>> .tuningName
'harm9'

>>> (1/1 / 1:15).octaveReduce
>>> .nub.sort
>>> .tuningName
'sub8'

>>> ([30 32 36 40 45 48 54] / 30/1)
>>> .tuningName
'ptolemy_idiat'

>>> [1 10/9 5/4 4/3 3/2 15/9 15/8]
>>> .tuningName
'redfield'

>>> [
>>> 	360 384 400 432 450
>>> 	480 540 576 600 648
>>> 	675
>>> ]
>>> .Fraction(360)
>>> .tuningName
'kornerup_11'

>>> 26.fibonacciSequence
>>> .octaveReduce
>>> .nub.sort.tuningName
'burt_fibo23'
```

To lookup a tuning by name see `namedTuning`:

```
>>> 'redfield'
>>> .namedTuning
>>> .description
>>> .splitBy(', ')
[
	'John Redfield'
	'New Diatonic Scale (1930)'
	'inverse of ptolemy_idiat.scl'
]
```

Tunings not in the database answer as un-named:

```
>>> [1 2 3 4 5 6 7].tuningName
'*unnamed tuning*'
```

_Note:_
The database is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, namedTuning, scalaTuningArchive

Guides: Tuning Functions, Xenharmonic Functions

Categories: Tuning
