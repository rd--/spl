/* Musikinformatik/clothesline/examples ; requires prime ; packet size */
let n = 180;
{
	let primes = [2 .. n].collect { :index |
		[1 .. index].collect { :each |
			each.prime
		}.scramble.keepAtMost(8)
	}.++.IdentitySet.List;
	let freq = primes.linLin(primes.min, primes.max, 200, 10000) * (0.5 -- 1.5).atRandom;
	let amp = { 0.4.atRandom } ! freq.size;
	let decay = { 2.4.atRandom } ! freq.size;
	(dust([4 14 40]) * [1 0.4 0.1] * 0.02).collect { :tr |
		ringzBank(
			tr,
			freq,
			amp,
			decay
		)
	}.splay
} !> 2
