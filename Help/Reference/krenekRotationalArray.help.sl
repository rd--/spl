# krenekRotationalArray

- _krenekRotationalArray([x₁ x₂ …], m=12)_

Answer the Krenek-type rotational array of the sequence _x_ modulo _m_.

Stravinsky’s _A Sermon, a Narrative, and a Prayer_ (1961):

```
>>> [3 4 0 2 1 10]
>>> .krenekRotationalArray(12)
[
	3 4 0 2 1 10;
	3 11 1 0 9 2;
	3 5 4 1 6 7;
	3 2 11 4 5 1;
	3 0 5 6 2 4;
	3 8 9 5 7 6
]

>>> [11 6 7 9 8 5]
>>> .krenekRotationalArray(12)
[
	11 6 7 9 8 5;
	11 0 2 1 10 4;
	11 1 0 9 3 10;
	11 10 7 1 8 9;
	11 8 2 9 10 0;
	11 5 0 1 3 2
]
```

Stravinsky’s _Movements for Piano and Orchestra_ (1959):

```
>>> [3 4 10 8 9 2]
>>> .krenekRotationalArray(12)
[
	3 4 10 8 9 2;
	3 9 7 8 1 2;
	3 1 2 7 8 9;
	3 4 9 10 11 5;
	3 8 9 10 4 2;
	3 4 5 11 9 10
]

>>> [0 11 1 6 7 5]
>>> .krenekRotationalArray(12)
[
	0 11 1 6 7 5;
	0 2 7 8 6 1;
	0 5 6 4 11 10;
	0 1 11 6 5 7;
	0 10 5 4 6 11;
	0 7 6 8 1 2
]
```

* * *

See also: mod, plus, rotateLeft

Guides: Matrix Functions

Further Reading: Krenek 1940
