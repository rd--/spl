# nextRandomFloat

_randomFloat(aRandom | aSystem)_

Answer the next random number at a random number generator, or at the system random number generator.
The answer will be between zero (inclusive) and one (exclusive).

Uniform distribution:

~~~
({ system.nextRandomFloat } ! 99).plot
~~~

* * *

See also: randomFloat
