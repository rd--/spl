# anyOne

- _anyOne(aCollection)_

Answer any element of _aCollection_.
It is an error if there are not any elements in the collection.
Ordinarily answers the first element obtained from _aCollection_.

At `List`:

```
>>> [1 .. 9].anyOne
1
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).anyOne
1
```

* * *

See also: any, atRandom

Categories: Accessing
