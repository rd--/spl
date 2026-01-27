+LargeInteger{
	brentPollardAlgorithm { :self |
		self.uncheckedBrentPollardAlgorithm(2 ^ 20)
	}
	uncheckedBrentPollardAlgorithm { :self :limit |
		<primitive:
		/* https://github.com/Yaffle/PollardsRho/blob/main/PollardsRho.js */
		const n = _self;
		const maxSteps = _limit;
		function gcd(a, b) {
			while (b !== 0n) {
				const r = a % b;
				a = b;
				b = r;
			}
			return a;
		}
		function f(x, c, n) {
			let y = (x * x) % n + c;
			y = y >= n ? y - n : y;
			return y;
		}
		function absDiff(a, b) {
			return a < b ? b - a : a - b;
		}
		function internal(n, x0, c, maxSteps) {
			let hare = x0;
			let i = 0;
			let power = 1;
			let product = 1n;
			let productStartHare = hare;
			let productStartStep = i;
			let cycleFound = false;
			while (i <= maxSteps) {
				const tortoise = hare;
				do {
					hare = f(hare, c, n);
					i += 1;
					if (i <= ((power * 3) >> 2)) {
						product = 1n;
						productStartHare = hare;
						productStartStep = i;
					} else {
						const d = absDiff(hare, tortoise);
						if (product === 1n) {
							product = d;
						} else {
							product = (product * d) % n;
						}
						if (i === power || i % 128 === 0 || cycleFound) {
							const factor = gcd(product, n);
							if (factor !== 1n) {
								if (factor !== n) {
									return factor;
								}
								if (cycleFound) {
									return n;
								}
								cycleFound = true;
								hare = productStartHare;
								i = productStartStep;
							}
							product = 1n;
							productStartHare = hare;
							productStartStep = i;
						}
					}
				} while (i !== power);
				power <<= 1;
			}
			return 0n;
		}
		const x0 = 2n;
		let c = 0n;
		let g = n;
		do {
			c += 1n;
			if (c > n) {
				return 0n;
			}
			g = internal(n, x0, c, maxSteps);
		} while (g === n);
		return g;
		>
	}
}

```
>>> (2L ^ 64 - 585).brentPollardAlgorithm
9094863431L
```

```
>>> 10403L.brentPollardAlgorithm
101L
```

```
>>> 10403L.factorInteger
[101 1; 103 1]
```

* * *

See also: factorInteger

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PollardRhoFactorizationMethod.html)
[2](https://mathworld.wolfram.com/BrentsFactorizationMethod.html),
_W_
[1](https://en.wikipedia.org/wiki/Pollard%27s_rho_algorithm)
