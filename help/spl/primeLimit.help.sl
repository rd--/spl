# primeLimit -- arithmetic

- _primeLimit(anInteger)_

Answer the largest prime number that is a factor of _anInteger_.

	(2 .. 15).select { :each | each.primeLimit <= 5 } = [2,  3,  4,  5,  6,  8,  9, 10, 12, 15]

* * *

See also: _primeFactors_
