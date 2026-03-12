# fibonacciSequenceUpTo

- _fibonacciSequenceUpTo(n)_

Answer a `List` of the Fibonacci numbers less than or equal to _n_.

There are eight Fibonacci numbers less than or equal to twenty:

```
>>> 20.fibonacciSequenceUpTo
[0 1 1 2 3 5 8 13]

>>> 8.fibonacciSequence
[0 1 1 2 3 5 8 13]
```

The sum of the even Fibonacci numbers less than four million:

```
>>> 4E6
>>> .fibonacciSequenceUpTo
>>> .select(isEven:/1)
>>> .sum
4613732
```

The first Fibonacci

14472334024676221L.fibonacciSequenceUpTo

Count Fibonacci numbers less than _9×10^23_:

```
>>> (9 * (10L ^ 23))
>>> .fibonacciSequenceUpTo
>>> .size
117
```

9E23.fibonacciSequenceUpTo.collect { :n | n -> n.isSmallInteger }

* * *

See also: fibonacci, fibonacciSequence

Guides: Integer Functions
