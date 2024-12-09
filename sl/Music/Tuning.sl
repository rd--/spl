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

	limit { :self |
		self.primeLimit
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
		2 ^ ((self / 100) * (1 / 12))
	}

	ratioToCents { :self |
		(12 * self.log2) * 100
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
		let n = (1, 3 .. self);
		let l = [];
		let r = [n, n].tuplesDo { :each |
			l.add(Fraction(each[1], each[2]))
		};
		l.nub.octaveReduced.sort
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
		let reduced = normalized.octaveReduced;
		reduced.nub.sort
	}

	eulerFokkerGenus { :self |
		self.eulerFokkerGenus { :each |
			true
		}
	}

}
