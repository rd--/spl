# middle

- _middle([x₁ x₂ …], n)_

Answer the middle element of the sequence _x_.
If the length is even answer the second of the two middle items.
Signal an error if the sequence is empty.

```
>>> 1:7.middle
4

>>> 1:8.middle
5

>>> {
>>> 	[].middle
>>> }.ifError { true }
true
```

In the binary case answer the _n_ middle items.
For odd sizes and odd counts is truly the middle:

```
>>> 1:9.middle
5

>>> 1:9.middle(1)
5:5

>>> 1:9.middle(3)
4:6
```

With even counts biases left:

```
>>> 1:9.middle(4)
3:6
```

For even sizes and even counts is truly the middle:

```
>>> 0:9.middle
5

>>> 0:9.middle(4)
3:6
```

For odd counts biases right:

```
>>> 0:9.middle(3)
4:6
```

* * *

See also: first, last, median, second, third

Categories: Accessing
