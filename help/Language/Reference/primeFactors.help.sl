# primeFactors -- arithmetic

- _primeFactors(anInteger)_

Answer the array of prime integers the product of which is _anInteger_.

	60.primeFactors = [2, 2, 3, 5]
	[2, 2, 3, 5].product = 60
	(2 .. 15).select { :each | each.primeFactors.max <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15]

* * *

See also: isPrime, product
