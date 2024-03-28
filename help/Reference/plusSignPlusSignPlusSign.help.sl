# +++

- _aSequence +++ _anotherSequence_

Append matrices:

```
>>> [1 2; 3 4] +++ [5 6; 7 8]
[1 2 5 6; 3 4 7 8]

>>> [1 2; 3 4] ++.each [5 6; 7 8]
[1 2 5 6; 3 4 7 8]

>>> [1 2 3; 4 5 6] +++ [4; 7]
[1 2 3 4; 4 5 6 7]
```

Wraps around at right hand side if required:

```
>>> [1 2; 3 4; 5 6] +++ [7 8; 9 10]
[1 2 7 8; 3 4 9 10; 5 6 7 8]
```

* * *

See also: ++
