# allTuples

- _allTuples(aSequence)_

Answer all of the possible n-tuples of each of the elements of _aSequence_, which is an n-element sequence of any sized sequences.

```
>>> [1 2; 3 4].allTuples
[1 3; 1 4; 2 3; 2 4]

>>> [3 4; 1 2].allTuples
[3 1; 3 2; 4 1; 4 2]

>>> [1 2; 7 8 9].allTuples
[1 7; 1 8; 1 9; 2 7; 2 8; 2 9]

>>> ['a' 'b'; 'x' 'y' 'z'; 'u' 'v'].allTuples.collect(join:/1)
['axu' 'axv' 'ayu' 'ayv' 'azu' 'azv' 'bxu' 'bxv' 'byu' 'byv' 'bzu' 'bzv']
```

The Cartesian product of an empty list with any other list is the empty list:

```
>>> [[1, 2], []].allTuples
[]

>>> [[], [1, 2]].allTuples
[]
```

The number of tuples is the product of the size of each sequence:

```
>>> [0 1 2 3; 4 5 6 7 8 9].allTuples.size
(4 * 6)

>>> [0 1; 2 3; 4 5; 6 7 8 9].allTuples.size
(2 * 2 * 2 * 4)
```

Word combinations:

```
>>> ['' 're' 'un'; 'wind'; '' 'ing' 's'].allTuples.collect(join:/1)
['wind' 'winding' 'winds' 'rewind' 'rewinding' 'rewinds' 'unwind' 'unwinding' 'unwinds']

>>> ['' '-'; '1'; 'j' ; '' '-' ; '1'].allTuples.collect(join:/1)
['1j1' '1j-1' '-1j1' '-1j-1']
```

* * *

See also: allTuplesDo

Categories: Combinatorics

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlylf)
