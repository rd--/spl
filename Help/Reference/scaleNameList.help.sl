# scaleNameList

- _scaleNameList([i₁ i₂ …], k=∞)_

Answer the at most _k_ items of the list of scale names associated with the interval sequence _i_,
according to the Scala scale archive.

The major scale:

```
>>> [2 2 1 2 2 2 1]
>>> .scaleNameList(4)
[
	'G.Lydian'
	'M.Ionian'
	'M.Hypolydian'
	'Major'
]

>>> [0 2 2 1 2 2 2]
>>> .prefixSum
>>> .forteNumber
'7-35'

>>> 'Major'.namedScale.intervals
[2 2 1 2 2 2 1]
```

The whole-tone scale:

```
>>> [2 2 2 2 2 2]
>>> .scaleNameList(2)
['Whole-tone' 'Messiaen mode 1']

>>> [0 2 2 2 2 2]
>>> .prefixSum
>>> .forteNumber
'6-35'
```

The octatonic scale:

```
>>> [1 2 1 2 1 2 1 2]
>>> .scaleNameList(2)
['Octatonic' 'Messiaen mode 2']

>>> [0 1 2 1 2 1 2 1]
>>> .prefixSum
>>> .forteNumber
'8-28'
```

The acoustic, or overtone, scale:

```
>>> [2 2 2 1 2 1 2]
>>> .scaleNameList(1)
['Lydian Dominant']

>>> [0 2 2 2 1 2 1]
>>> .prefixSum
>>> .forteNumber
'7-34'

>>> 'Overtone'.namedScale
>>> .intervals
[2 2 2 1 2 1 2]
```

The harmonic minor scale:

```
>>> [2 1 2 2 1 3 1]
>>> .scaleNameList(1)
['Harmonic Minor']

>>> [0 2 1 2 2 1 3]
>>> .prefixSum
>>> .forteNumber
'7-32'
```

The harmonic major scale:

```
>>> [2 2 1 2 1 3 1]
>>> .scaleNameList(1)
['Harmonic Major']

>>> [0 2 2 1 2 1 3]
>>> .prefixSum
>>> .forteNumber
'7-32'
```

The hexatonic collection:

```
>>> [1 3 1 3 1 3]
>>> .scaleNameList(2)
[
	'Messiaen truncated mode 3'
	'Hexatonic Set'
]

>>> [0 1 3 1 3 1]
>>> .prefixSum
>>> .forteNumber
'6-20'
```

The _Prometheus scale_:

```
>>> [2 2 2 3 1 2]
>>> .scaleNameList(2)
['Prometheus (Scriabin)' 'Mystic']
```

Hungarian, Romanian and Neapolitan scales:

```
>>> [3 1 2 1 2 1 2]
>>> .scaleNameList(1)
['Hungarian Major']

>>> [1 3 2 1 2 1 2]
>>> .scaleNameList(1)
['Romanian Major']

>>> [2 1 3 1 1 3 1]
>>> .scaleNameList(2)
[
	'Double Harmonic Minor'
	'Hungarian Minor'
]

>>> [1 2 2 2 1 3 1]
>>> .scaleNameList(1)
['Neapolitan Minor']
```

Some scales have many names:

```
>>> [2 1 3 1 2 1 2]
>>> .scaleNameList
>>> .size
13

>>> [2 1 3 1 2 1 2]
>>> .scaleNameList
>>> .includes('Ukrainian Dorian')
true
```

* * *

See also: namedScale, scalaScaleArchive, Scale

Guides: Scale Functions
