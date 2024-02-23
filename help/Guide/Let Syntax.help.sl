# Let Syntax

Rewrite rules:

- _let t = i; let u = j; ..._ ⟹ _var t, u ...; t := i; u := j; ..._

These rules implement a `let` keyword syntax for declaring and initialising temporary variables.

```
>>> let n = 1;
>>> n + n
2
```

This rule allows temporaries to be initialised when declared.
Note that only one binding is allowed per `let` statement.

The sequence of initiliasers is retained, subsequent initialisations may refer to the value of previous initialisations.

```
>>> let i = 3;
>>> let j = i + 4;
>>> j
7
```

The syntax requires that all temporaries have initialisers, there is no implicit `nil` initialiser.

Note that the initialiser syntax, _p = x_, is distinct from the assignment syntax, _p := x_.

```
>>> let n = 3 + 4;
>>> n
7

>>> var n;
>>> n := 3 + 4;
>>> n
7
```

- _let [e, ...] = c; ..._ ⟹ _let e = at(c, 1); let ...; ..._
- _let (k, ...) = d; ..._ ⟹ _let k = at(d, 'k'); let ...; ..._

These rules allow destructuring `Sequence` and `Dictionary` values respectively.

At `List`:

```
>>> let [i, j, k] = [1, 2, 3];
>>> i + j * k
9
```

At `Tuple`:

```
>>> let [i, j, k] = (1, 2, 3);
>>> i + j * k
9
```

At Record:

```
>>> let (i, j, k) = (i: 1, j: 2, k: 3);
>>> i + j * k
9
```

The notation _let (x, y) = p;_ initialises the variables _x_ and _y_ to the values _p::x_ and _p::y_.

This rule can make writing temporaries with long initializers spanning multiple lines clearer.

_Rationale_: Initialising temporary variables as they are declared makes it clear in which cases they are used simply as names (assigned to using the `=` notation) and in which cases they are used as mutable state (assigned to using `:=`).

_Subtleties_:
The list and dictionary initialisers must only evaluate the right hand side once.
A gensym-ed private name is used to store the initial value, and that name is used for the destructuring.

This syntax can make programs that declare many variables, or that comment on variables between each declaration, clearer to read.
The program below is by James McCartney and is taken from the SuperCollider2 documentation.

~~~
{- ten voices of a random sine percussion sound -}
let s = { Resonz(Dust(0.2) * 50, Rand(200, 3200), 0.003) } !+ 10;
{- reverb predelay time -}
let z = DelayC(s, 0.048, 0.048);
{- seven length modulated comb delays in parallel -}
let y = { CombL(z, 0.1, LfNoise1(Rand(0, 0.1)) * 0.04 + 0.05, 15) } !+ 7;
{- two parallel chains of four allpass delays -}
4.timesRepeat { y := AllpassC(y, 0.050, [Rand(0, 0.050), Rand(0, 0.050)], 1) };
{- add original sound to reverb -}
s + (0.2 * y)
~~~

* * *

See also: Initialised Temporaries Syntax

Categories: Syntax
