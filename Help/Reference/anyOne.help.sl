# anyOne

- _anyOne(c)_

Answer any element of collection _c_.
It is an error if there are not any elements in the collection.
Ordinarily answers the first element obtained from _c_.

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

At `String`:

```
>>> 'string'.anyOne
's'
```

* * *

See also: any, atRandom

Guides: Collection Functions

Categories: Accessing
