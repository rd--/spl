# occurrencesOf

- _occurrencesOf(c, x)_

Answer how many elements of the collection _c_ are equal to the object _x_.

At `List`:

```
>>> [1 2 3 4 3 2 1]
>>> .occurrencesOf(3)
2
```

At `Record`:

```
>>> (a: 1, b: 2, c: 1)
>>> .occurrencesOf(1)
2
```

At `IdentityMultiset`:

```
>>> [2 3 3 4 4 4].IdentityMultiset
>>> .occurrencesOf(4)
3
```

The number of occurrences of an element in set will be zero or one.
At `IdentitySet`:

```
>>> [1 2 2 3 3 3].IdentitySet
>>> .occurrencesOf(3)
1
```

At `String`:

```
>>> 'abracadabra'
>>> .occurrencesOf('a')
5

>>> 'a cat a mat'
>>> .occurrencesOf('a')
4

>>> 'a cat a mat'
>>> .occurrencesOf('cat')
1
```

Scatter plot of the first _k_ terms of the inventory sequence,
OEIS [A342585](https://oeis.org/A342585):

~~~spl svg=D
let k = 200;
let a = [];
let c = 0;
let n = 0;
let f = 1.toDo(k) { :i |
	let n = a.occurrencesOf(c);
	a.add(n);
	(n = 0).if {
		c := 0
	} {
		c := c + 1
	}
};
a.collect { :n |
	n.isZero.if { 0 } { n.log }
}.scatterPlot
~~~

![](<sw/spl/Help/Image/occurrencesOf-A.svg>)

* * *

See also: count, includes, indicesOf

Guides: Dictionary Functions, List Functions, Set Functions

References:
_OEIS_
[1](https://oeis.org/A342585),
_Smalltalk_
5.7.1.19

Categories: Testing
