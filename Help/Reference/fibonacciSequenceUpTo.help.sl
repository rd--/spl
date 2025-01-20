# fibonacciSequenceUpTo

- _fibonacciSequenceUpTo(anInteger)_

Answer a `List` of the Fibonacci numbers less than or equal to _anInteger_.

There are seven Fibonacci numbers less than or equal to twenty:

```
>>> 20.fibonacciSequenceUpTo
[1 1 2 3 5 8 13]

>>> 7.fibonacciSequence
[1 1 2 3 5 8 13]
```

The sum of the even Fibonacci numbers less than four million:

```
>>> 4E6
>>> .fibonacciSequenceUpTo
>>> .select(isEven:/1)
>>> .sum
4613732
```

* * *

See also: fibonacci, fibonacciSequence
