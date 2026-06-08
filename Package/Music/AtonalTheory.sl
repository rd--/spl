+List {

	forteIntervalVector { :self |
		let t = self.tuples(2).select { :x |
			x[1] < x[2]
		};
		let m = t.collect { :x |
			let i = x[2] - x[1];
			(i > 6).if { 12 - i } { i }
		}.Multiset;
		[1 .. 6].collect { :x |
			m.occurrencesOf(x)
		}
	}

	forteNumber { :self |
		system.rahnSetClassTable.keyAtValue(
			self.rahnPrimeForm
		)
	}

	mandereauIntervalVector { :self :modulus |
		let m = self.tuples(2).collect { :x |
			(x[2] - x[1]) % modulus
		}.Multiset;
		[0 .. modulus - 1].collect { :x |
			m.occurrencesOf(x)
		}
	}

	mandereauIntervalVector { :self |
		self.mandereauIntervalVector(12)
	}

	normalForm { :self :f:/2 |
		self.isEmpty.if {
			[]
		} {
			let p = self.sorted;
			let k = p.size;
			let a = [];
			let rotateAndZero = { :x :n |
				let y = x.rotate(n);
				let z = y - y[1];
				z % 12
			};
			1:k.collect { :n |
				p.rotateAndZero(n)
			}.minBy(f:/2)
		}
	}

	primeForm { :self :f:/2 |
		[
			self.normalForm(f:/2),
			(12 - self).normalForm(f:/2)
		].minBy(f:/2)
	}

	rahnNormalForm { :self |
		self.normalForm { :a :b |
			a.reverse <| b.reverse
		}
	}

	rahnPrimeForm { :self |
		self.primeForm { :a :b |
			a.reverse <| b.reverse
		}
	}

}

+System {

	forteSetClassTable { :self |
		self.requireLibraryItem(
			'ForteSetClassTable'
		)
	}

	rahnSetClassTable { :self |
		self.requireLibraryItem(
			'RahnSetClassTable'
		)
	}

}

LibraryItem(
	name: 'ForteSetClassTable',
	category: 'Music/AtonalTheory',
	url: 'https://rohandrape.net/sw/hmt/data/json/forte-table.json',
	mimeType: 'application/json',
	parser: identity:/1
)

LibraryItem(
	name: 'RahnSetClassTable',
	category: 'Music/AtonalTheory',
	url: 'https://rohandrape.net/sw/hmt/data/json/rahn-table.json',
	mimeType: 'application/json',
	parser: identity:/1
)
