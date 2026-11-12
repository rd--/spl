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
		let answer = List(factors.size, nil);
		factors.size.toByDo(1L, -1L) { :index |
			answer[index] := self % factors[index];
			self := self // factors[index]
		};
		(self > 0L).ifTrue {
			answer.addFirst!(self)
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
					answer.add!(x / each)
				} {
					let n = (x / each).floor;
					x := x - (n * each);
					answer.add!(n)
				}
			};
			answer
		}
	}

}

+@Sequence {

	mixedRadixDecode { :self :factors |
		self.atVectorOrElementwise { :each |
			let answer = 0L;
			let base = 1L;
			let k = factors.size.min(each.size);
			let prefix = each.size - factors.size;
			(prefix > 1L).ifTrue {
				each.error('mixedRadixDecode: sequence too long')
			};
			k.toByDo(1L, -1L) { :index |
				answer := answer + (each[index + prefix] * base);
				base := base * factors[index]
			};
			(prefix = 1L).ifTrue {
				answer := answer + (each[1L] * base)
			};
			answer
		}
	}

	numberCompose { :c :u |
		(c * u.last(c.size)).sum
	}

}

+@Collection {

	factorialNumberSystemDecode { :self |
		self.collect(factorialNumberSystemDecode/1)
	}

	factorialNumberSystemEncode { :self |
		self.collect(factorialNumberSystemEncode/1)
	}

}
