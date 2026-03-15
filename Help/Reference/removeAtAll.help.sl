# removeAtAll

- _removeAtAll(c, [i₁ i₂ …])_

Remove the element at each index in the index collection _i_ from the collection _c_.
Answers a `List` of the removed elements.

Remove first and third item of a `List`:

```
>>> let l = [1 2 3 4 5];
>>> (l.removeAtAll([1 3]), l)
([1 3], [2 4 5])
```

Remove even indices:

```
>>> let m = 12;
>>> let a = [1 .. m];
>>> let i = [2, 4 .. m];
>>> a.removeAtAll(i);
>>> a
[1 3 5 7 9 11]
```

If is an error if any index is not valid:

```
>>> let l = [1 2 3 4 5];
>>> {
>>> 	l.removeAtAll([1 7])
>>> }.hasError
true
```

At `Record`, alias for `removeAllKeys`:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> (r.removeAtAll(['x' 'z']), r)
(['x' 'z'], (y: 2))
```

Binary sieve,
OEIS [A007950](https://oeis.org/A007950):

~~~spl svg=A oeis=A007950
let a = [1 .. 200];
1:6.do { :n |
	let k = 2 ^ n;
	let i = Range(k, a.size, k);
	a.removeAtAll(i)
};
a.discretePlot
~~~

![](sw/spl/Help/Image/removeAtAll-A.svg)

Ternary sieve,
OEIS [A007951](https://oeis.org/A007951):

~~~spl svg=B oeis=A007951
let a = [1 .. 150];
1:6.do { :n |
	let k = 3 ^ n;
	let i = Range(k, a.size, k);
	a.removeAtAll(i)
};
a.discretePlot
~~~

![](sw/spl/Help/Image/removeAtAll-B.svg)

Quaternary sieve,
OEIS [A092418](https://oeis.org/A092418):

~~~spl svg=C oeis=A092418
let a = [1 .. 100];
1:6.do { :n |
	let k = 4 ^ n;
	let i = Range(k, a.size, k);
	a.removeAtAll(i)
};
a.discretePlot
~~~

![](sw/spl/Help/Image/removeAtAll-C.svg)

* * *

See also: at, insertAt, removeAt, removeFirst, removeKey, removeLast

Categories: Removing
