+@Integer {

	bellNumber { :self |
		(self < 0).if {
			self.error('@Integer>>bellNumber: n < 0')
		} {
			(self < 2).if {
				1
			} {
				let list = List(self);
				list[1] := 1;
				2.toDo(self) { :i |
					1.toDo(i - 2) { :j |
						let k = i - j - 1;
						list[k] := list[k] + list[i - j]
					};
					list[i] := list[1] + list[i - 1]
				};
				list[self]
			}
		}
	}

	polygonalNumber { :r :n |
		(1 / 2) * n * (n * (r - 2) - r + 4)
	}

	doubleFactorial { :self |
		self.isNegative.if {
			self.error('@Integer>>doubleFactorial: not valid for negative integers')
		} {
			(self <= 3).if {
				self.max(1)
			} {
				self * (self - 2).doubleFactorial
			}
		}
	}

	factorial { :self |
		self.isNegative.ifTrue {
			'@Integer>>factorial: not valid for negative integers'.error
		};
		(self <= 1).if {
			1
		} {
			let next = self;
			let answer = self;
			{
				next > 1
			}.whileTrue {
				next := next - 1;
				answer := answer * next
			};
			answer
		}
	}

	hyperfactorial { :self |
		self.isInteger.if {
			(self.one .. self).collect { :k | k ^ k }.product
		} {
			'@Integer>>hyperfactorial: not implemented for non-integer'.error
		}
	}

}

+@Number {

	factorialPower { :self :anInteger |
		(self - 0.to(anInteger - 1)).product
	}

}

+@Sequenceable {

	deBruijnSequence { :self :anInteger |
		self.lyndonWords(anInteger).select { :each |
			anInteger.divisible(each.size)
		}.catenate
	}

}

+List {

	bockerLiptakAlgorithm { :a |
		let k = a.size;
		let n = List(a[1], Infinity);
		let t = [];
		n[1] := 0;
		t.add(n.copy);
		2.toDo(k) { :i |
			let d = gcd(a[1], a[i]);
			1.toDo(d) { :r |
				let q = [r, r + d .. r + (a[1] - d)];
				let m = min(n.atAll(q));
				(m < Infinity).ifTrue {
					(a[1] // d).timesRepeat {
						var p, rp;
						m := m + a[i];
						p := m % a[1];
						m := min(m, n[p + 1]);
						n[p + 1] := m
					}
				}
			};
			t.add(n.copy)
		};
		t
	}

	frobeniusNumber { :self |
		self.includes(1).if {
			-1
		} {
			(self.gcd ~= 1).if {
				Infinity
			} {
				let r = self.sorted.bockerLiptakAlgorithm.last;
				r.max - self.min
			}
		}
	}

	frobeniusSolve { :a :b |
		let ert = a.bockerLiptakAlgorithm;
		let c = List(a.size, 0);
		let answer = [];
		let f = { :m :i |
			(i = 1).if {
				c[1] := m // a[1];
				answer.add(c.copy)
			} {
				let lc = lcm(a[1], a[i]);
				let l = lc // a[i];
				0.toDo(l - 1) { :j |
					let mm = m - (j * a[i]);
					let r = mm % a[1];
					let lb = ert[i - 1][r + 1];
					c[i] := j;
					(lb ~= Infinity).ifTrue {
						{
							mm >= lb
						}.whileTrue {
							f(mm, i - 1);
							mm := mm - lc;
							c[i] := c[i] + l
						}
					}
				}
			}
		};
		f(b, a.size);
		answer.sortBy(precedes:/2)
	}

}

+String {

	deBruijnSequence { :self :anInteger |
		self.characters.deBruijnSequence(anInteger).stringCatenate
	}

}
