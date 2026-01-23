+List {

	forteNumber { :self |
		system.rahnSetClassTable.keyAtValue(
			self.rahnPrimeForm
		)
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
