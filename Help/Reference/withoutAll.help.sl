# withoutAll

- _withoutAll(p, q)_

Remove every element of the collection _p_ that compares equal to an element of the collection _q_.
Answer _p_.

```
>>> [1 2 2 3 3 3].withoutAll([1 3])
[2 2]

>>> let p = [1 2 2 3 3 4];
>>> let q = [2 3];
>>> p.withoutAll(q);
>>> p
[1 4]
```

Delete all instances of x and y from a list:

```
>>> [2 'x' 1 'x' 'a' 'y' 'x']
>>> .withoutAll(['x' 'y'])
[2 1 'a']
```

Find divisors of 20 that are not also divisors of 12:

```
>>> 20.divisors.withoutAll(12.divisors)
[5 10 20]
```

Find which triples of digits do not occur in the binary decomposition of 12345:

```
>>> [0 1].tuples(3).withoutAll(
>>> 	12345.integerDigits(2).partition(3, 1)
>>> )
[0 1 0; 1 0 1]
```

The result is not sorted and may contain repeated elements:

```
>>> ['b' 'e' 'd' 'a' 'b' 'c' 'd'].withoutAll(['b' 'c'])
['e' 'd' 'a' 'd']
```

* * *

See also: without

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteElements.html)

Categories: Removing
