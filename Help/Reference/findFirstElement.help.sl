# findFirstElement

- _findFirstElement([x₁ x₂ …], f/1)_

A type specialised form of `detect`.

Detect the first prime number in a `List`:

```
>>> [99 .. 111]
>>> .findFirstElement(isPrime/1)
101
```

Detect the first odd number:

```
>>> [2 4 8 7 5 3]
>>> .findFirstElement(isOdd/1)
7
```

* * *

See also: detect

Guides: List Functions
