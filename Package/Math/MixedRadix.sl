+@Integer {

	factorialExpansion { :self |
		let k = 1;
		{ self > k.! }.whileTrue {
			k := k + 1
		};
		self.numberDecompose(
			Range(k, 1, -1).!
		).withoutLeadingZeroes
	}

	factorialNumberSystemDecode { :self |
		let d = self.integerDigits.reverse;
		let n = d.size;
		(d * [1 .. n].!).sum
	}

	factorialNumberSystemEncode { :self |
		self.factorialExpansion.fromDigits
	}

	mixedRadixEncode { :self :factors |
		let answer = List(factors.size);
		factors.size.toByDo(1, -1) { :index |
			answer[index] := self % factors[index];
			self := self // factors[index]
		};
		(self > 0).ifTrue {
			answer.addFirst(self)
		};
		answer
	}

}

+@Number {

	numberDecompose { :self :u |
		(self < 0).if {
			self.-.numberDecompose(u).-
		} {
			let answer = [];
			let x = self;
			let k = u.size;
			u.withIndexDo { :each :index |
				(index = k).if {
					answer.add(x / each)
				} {
					let n = (x / each).floor;
					x := x - (n * each);
					answer.add(n)
				}
			};
			answer
		}
	}

}

+@Sequenceable {

	mixedRadixDecode { :self :factors |
		let answer = 0;
		let base = 1;
		let k = factors.size.min(self.size);
		let prefix = self.size - factors.size;
		(prefix > 1).ifTrue {
			self.error('mixedRadixDecode: sequence too long')
		};
		k.toByDo(1, -1) { :index |
			answer := answer + (self[index + prefix] * base);
			base := base * factors[index]
		};
		(prefix = 1).ifTrue {
			answer := answer + (self[1] * base)
		};
		answer
	}

	numberCompose { :c :u |
		(c * u.last(c.size)).sum
	}

}

+@Collection {

	factorialNumberSystemDecode { :self |
		self.collect(factorialNumberSystemDecode:/1)
	}

	factorialNumberSystemEncode { :self |
		self.collect(factorialNumberSystemEncode:/1)
	}

}
