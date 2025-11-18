+@Integer {

	barlowBasicIndispensability { :p :n |
		p.isPrime.if {
			(p = 2).if {
				p - n
			} {
				(p - 1 = n).if {
					(p / 4).integerPart
				} {
					let s = (p - 1).primeFactors.sort(>=);
					let m = n - (n / p).integerPart;
					let q = barlowIndispensability(s, m);
					(q + (2 * ((q + 1) / p).sqrt)).integerPart
				}
			}
		} {
			p.error('@Integer>>barlowBasicIndispensability')
		}
	}

}

+List {

	barlowIndispensabilities { :p |
		1.toCollect(p.product) { :each |
			p.barlowIndispensability(each)
		}
	}

	barlowIndispensability { :p :n |
		p.allSatisfy(isPrime:/1).if {
			let z = p.size;
			let m = p.product;
			let u = (n - 2) % m;
			let ix = { :k |
				((k = 0) || (k = (z + 1))).if {
					1
				} {
					p[k]
				}
			};
			0.toCollect(z - 1) { :r |
				let m2 = 0.toCollect(r) { :k |
					ix(z + 1 - k)
				}.product;
				let a = ix(z - r);
				let b = 1 + (u / m2).integerPart;
				let c = 1 + (b % a);
				let d = barlowBasicIndispensability(a, c);
				let e = 0.toCollect(z - r - 1, ix:/1).product;
				e * d
			}.sum
		} {
			p.error('List>>barlowIndispensability')
		}
	}

}
