# christoffelWord

- _christoffelWord(c, k)_

Answer the first _k_ terms of the Christoffel word with slope _c_.
If _c_ is irrational this is called a Sturmian word.

Christoffel word of slope _4/7_,
OEIS [A144595](https://oeis.org/A144595):

```
>>> 4/7.christoffelWord(22)
[0 0 1 0 0 1 0 0 1 0 1 0 0 1 0 0 1 0 0 1 0 1]
```

Christoffel word of slope _2/7_,
OEIS [A144596](https://oeis.org/A144596):

```
>>> 2/7.christoffelWord(22)
[0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 0]
```

Christoffel word of slope _10/11_,
OEIS [A144608](https://oeis.org/A144608):

```
>>> 10/11.christoffelWord(22)
[0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0]
```

Sturmian word of slope π,
OEIS [A144609](https://oeis.org/A144609):

```
>>> 1.pi.christoffelWord(22)
[0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1]
```

Sturmian word of slope _√2_,
OEIS [A144611](https://oeis.org/A144611):

```
>>> 2.sqrt.christoffelWord(22)
[0 1 0 1 0 1 1 0 1 0 1 1 0 1 0 1 0 1 1 0 1 0]
```

Sturmian word of slope _e_,
OEIS [A144610](https://oeis.org/A144610):

```
>>> 1.e.christoffelWord(22)
[0 1 1 0 1 1 1 0 1 1 1 0 1 1 0 1 1 1 0 1 1 1]
```

* * *

See also: sturmianWord

Guides: Integer Sequence Functions
