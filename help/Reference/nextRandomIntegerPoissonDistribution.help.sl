# nextRandomIntegerPoissonDistribution

- _nextRandomIntegerPoissonDistribution(anRng, aNumber)_

This function models the occurance rate of rare events.
This is a discrete distribution that answer positive integer values.
The distribution of values is unbounded at the upper end.
The mean and variance of the function are _aNumber_.

Small mean and variance:

~~~
({ system.nextRandomIntegerPoissonDistribution(1 / 9) } ! 99).plot
~~~

Less small mean and variance:

~~~
({ system.nextRandomIntegerPoissonDistribution(9) } ! 99).plot
~~~

* * *

See also: Random, randomInteger, randomReal
