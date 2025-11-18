@Tuning {

	asCents { :self |
		self.typeResponsibility('@Tuning>>asCents')
	}

	asIntegers { :self |
		self.typeResponsibility('@Tuning>>asIntegers')
	}

	asRatios { :self |
		self.typeResponsibility('@Tuning>>asRatios')
	}

	isRational { :self |
		self.typeResponsibility('@Tuning>>isRational')
	}

	isTuning { :self |
		true
	}

	octave { :self |
		self.typeResponsibility('@Tuning>>octave')
	}

	primeLimit { :self |
		self.asIntegers.collect { :each |
			(each = 1).if {
				each
			} {
				each.primeFactors.max
			}
		}.max
	}

	size { :self |
		self.typeResponsibility('@Tuning>>size')
	}

}

+@Object {

	isTuning { :self |
		false
	}

}

+@Number {

	centsToRatio { :self |
		2 ^ (self / 1200)
	}

	millioctavesToRatio { :n |
		2 ^ (n / 1000)
	}

	ratioToMillioctaves { :n |
		n.log(2) * 1000
	}

	ratioToCents { :self |
		(12 * self.log2) * 100
	}

	ratioToSavarts { :n |
		n.log(10) * 1000
	}

	savartsToCents { :n |
		n * (1.2 / 2.log(10))
	}

	savartsToRatio { :n |
		10 ^ (n / 1000)
	}

}

+@Collection {

	centsToRatio { :self |
		self.collect(centsToRatio:/1)
	}

	ratioToCents { :self |
		self.collect(ratioToCents:/1)
	}

}

+Fraction {

	integerLimit { :self |
		let n = self.numerator;
		let d = self.denominator;
		n.max(d)
	}

	oddLimit { :self |
		let n = self.numerator;
		let d = self.denominator;
		{ n.isEven }.whileTrue {
			n := n / 2
		};
		{ d.isEven }.whileTrue {
			d := d / 2
		};
		n.max(d)
	}

}

+SmallFloat {

	oddLimitSet { :self |
		let n = 1.toBy(self, 2);
		let l = [];
		let r = [n, n].tuplesDo { :each |
			l.add(Fraction(each[1], each[2]))
		};
		l.nub.octaveReduce.sort
	}

}

+List {

	combinationProductSet { :self :anInteger |
		self.eulerFokkerGenus { :each |
			each.size = anInteger
		}
	}

	eulerFokkerGenus { :self :aBlock:/1 |
		let combinations = self.subsets(aBlock:/1);
		let products = combinations.collect(product:/1);
		let normalized = Fraction(products, products.min);
		let reduced = normalized.octaveReduce;
		reduced.nub.sort
	}

	eulerFokkerGenus { :self |
		self.eulerFokkerGenus { :each |
			true
		}
	}

	kurenniemiNotation { :self |
		let chordDegrees = self.ratioToCents / 100;
		let upper = chordDegrees.max + 1;
		let lineDegrees = [2 5 9 12 16 19 23];
		let allLines = 0.to(3).collectCatenate { :each |
			each * 24 + lineDegrees
		}.takeWhile { :each |
			each <= upper
		};
		let staffLines = [
			19 23 26 29 33
			40 43 47 50 53
		];
		[
			allLines.collect { :y |
				let [x1, x2] = staffLines.includes(y).if {
					[0 15]
				} {
					[5 10]
				};
				Line([x1 y; x2 y])
			},
			chordDegrees.collect { :y |
				Ellipse([7.5, y], [4 / 5, 2 / 3])
			}
		].LineDrawing(height: 300)
	}

}

+System {

	masinaConsonanceData { :self |
		self.requireLibraryItem('MasinaConsonanceData')
	}

}

LibraryItem(
	name: 'MasinaConsonanceData',
	category: 'Music/Tuning',
	url: 'https://rohandrape.net/sw/hmt/data/json/masina-consonance-data.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.at('data').collect { :each |
			let [f2, f1, m, sd] = each;
			[Fraction(f2, f1), m, sd]
		}
	}
)

