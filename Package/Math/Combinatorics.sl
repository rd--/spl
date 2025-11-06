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

	bellStringsDo { :n :yield:/1 |
		let word = List(n, 0);
		let focus = [1 .. n + 1];
		let start = List(n, 0);
		let maxima = [];
		let first = List(n, true);
		yield(word);
		{ focus[1] < n }.whileTrue {
			let index = focus[1];
			focus[1] := 1;
			(word[index] = start[index]).if {
				let m = 0;
				first[index].if {
					first[index] := false
				} {
					maxima.isEmpty.if {
						m := 1
					} {
						m := word[maxima[1]]
					}
				};
				word[index] := m + 1;
				(m + 1 != 1).ifTrue {
					maxima.addFirst(index)
				}
			} {
				(word[index] = 2 & { start[index] = 1 }).if {
					word[index] := word[index] - 2;
					(maxima[1] = index).ifTrue {
						maxima.removeFirst
					}
				} {
					word[index] := word[index] - 1;
					(maxima[1] = index).ifTrue {
						maxima.removeFirst
					}
				}
			};
			yield(word);
			((word[index] + start[index]) = 1).ifTrue {
				focus[index] := focus[index + 1];
				focus[index + 1] := index + 1;
				start[index] := word[index]
			}
		};
		nil
	}

	bellStrings { :n |
		let answer = [];
		bellStringsDo(n) { :each |
			answer.add(each.copy)
		};
		answer
	}

	braceletCount { :n :k |
		let t1 = 0;
		1.toDo(n) { :d |
			((n % d) = 0).ifTrue {
				t1 := t1 + (d.eulerPhi * (k ^ (n / d)))
			}
		};
		n.isEven.if {
			(t1 + ((n / 2) * (1 + k) * (k ^ (n / 2)))) / (2 * n)
		} {
			(t1 + (n * (k ^ ((n + 1) / 2)))) / (2 * n)
		}
	}

	catalanStringsDo { :n :k :yield:/1 |
		let word = List(n, 0);
		let focus = [1 .. n + 1];
		let start = List(n, 0);
		yield(word);
		{ focus[1] < n }.whileTrue {
			let index = focus[1];
			focus[1] := 1;
			(word[index] = start[index]).if {
				(word[index] = 1 & { word[index + 1] = 0 & { k = 2 } }).if {
					word[index] := 0
				} {
					word[index] := word[index + 1] + k - 1
				}
			} {
				(word[index] = 2 & { start[index] = 1 }).if {
					word[index] := word[index] - 2
				} {
					word[index] := word[index] - 1
				}
			};
			yield(word);
			((word[index] + start[index]) = 1).ifTrue {
				focus[index] := focus[index + 1];
				focus[index + 1] := index + 1;
				start[index] := word[index]
			}
		};
		nil
	}

	catalanStrings { :n :k |
		let answer = [];
		catalanStringsDo(n, k) { :each |
			answer.add(each.copy)
		};
		answer
	}

	eulerianNumber { :n :m |
		0:m.sum { :i |
			(-1 ^ i)
			*
			binomial(n + 1, i)
			*
			((m + 1 - i) ^ n)
		}
	}

	eulerianNumberSecondOrder { :n :m |
		0.to(n - m).sum { :k |
			(-1 ^ (n + k))
			*
			binomial(2 * n + 1, k)
			*
			stirlingS1(2 * n - m - k + 1, n - m - k + 1)
		}
	}

	fibonacciFactorial { :self |
		self.fibonacciSequence.product
	}

	hyperfactorial { :self |
		let one = self.one;
		self.isInteger.if {
			one.to(self).collect { :k |
				k ^ k
			}.product
		} {
			self.unimplementedCase('hyperfactorial')
		}
	}

	integerDoubleFactorial { :self |
		let one = self.one;
		self.isNegative.if {
			self.isOdd.if {
				(self + 2).integerDoubleFactorial / (self + 2)
			} {
				self.error('@integerDoubleFactorial: negative even')
			}
		} {
			(self <= 3).if {
				self.max(one)
			} {
				self * (self - 2).integerDoubleFactorial
			}
		}
	}

	integerFactorial { :self |
		let one = self.one;
		self.isNegative.ifTrue {
			self.error('integerFactorial: not valid for negative integers')
		};
		(self <= one).if {
			one
		} {
			let answer = one;
			1.toDo(self) { :each |
				answer := answer * each
			};
			answer
		}
	}

	involutionNumber { :n |
		0.to(n // 2).sum { :k |
			((2 * k) - 1).doubleFactorial * binomial(n, 2 * k)
		}
	}

	necklaceCount { :n :k |
		k.isList.if {
			let [m] = k;
			n.divisors.sum { :d |
				d.eulerPhi * stirlingS2(n / d, m) * m.factorial
			} / n
		} {
			n.divisors.sum { :d |
				d.eulerPhi * (k ^ (n / d)) / n
			}
		}
	}

	necklaces { :n :k |
		/* https://www.jasondavies.com/necklaces/necklaces.js */
		<primitive:
		function fkm(n, k) {
			let necklaces = [];
			let a = [];
			let i = -1;
			let j = null;
			while (++i < n) {
				a[i] = 0;
			}
			necklaces.push(a.slice());
			while (1) {
				i = n;
				while (--i >= 0) {
					if (a[i] < k - 1) {
						break;
					}
				}
				if (i < 0) {
					break;
				}
				a[j = i++]++;
				while (++j < n) {
					a[j] = a[j % i];
				}
				if (n % i === 0) {
					necklaces.push(a.slice());
				}
			}
			return necklaces;
		};
		return fkm(_n, _k)
		>
	}

	polygonalNumber { :r :n |
		(1 / 2) * n * (n * (r - 2) - r + 4)
	}

	restrictedGrowthStringsDo { :n :f:/1 |
		/* https://github.com/gstamatelat/partitions-enumeration/blob/master/v.cpp */
		let a = List(n, 0);
		let b = List(n, 0);
		let r = true;
		f(a);
		{ r }.whileTrue {
			let c = n;
			{ a[c] = (n - 1) | { a[c] > b[c] } }.whileTrue {
				c := c - 1
			};
			(c = 1).if {
				r := false
			} {
				a[c] := a[c] + 1;
				(c + 1).to(n).do { :i |
					a[i] := 0;
					b[i] := max(a[i - 1], b[i - 1])
				};
				f(a)
			}
		};
		nil
	}

	restrictedGrowthStrings { :n |
		let answer = [];
		n.restrictedGrowthStringsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	restrictedGrowthStringsDo { :n :k :f:/1 |
		/* https://github.com/gstamatelat/partitions-enumeration/blob/master/x.cpp */
		let a = List(n, 0);
		let b = List(n, 0);
		let r = true;
		let m = -1;
		(n - 1).downToDo(n - k + 1) { :i |
			let x = k - n + i;
			a[i + 1] := x;
			b[i + 1] := x - 1
		};
		f(a);
		{ r }.whileTrue {
			let m = nil;
			{ r & { m != (k - 1) } }.whileTrue {
				let c = n;
				{ a[c] = (k - 1) | { a[c] > b[c] } }.whileTrue {
					c := c - 1
				};
				(c = 1).if {
					r := false
				} {
					a[c] := a[c] + 1;
					(c + 1).to(n).do { :i |
						a[i] := 0;
						b[i] := max(a[i - 1], b[i - 1])
					};
					m := max(a[n], b[n])
				}
			};
			m.ifNotNil {
				f(a)
			}
		};
		nil
	}

	restrictedGrowthStrings { :n :k |
		let answer = [];
		restrictedGrowthStringsDo(n, k) { :each |
			answer.add(each.copy)
		};
		answer
	}

	secondOrderEulerianTriangle { :self |
		1:self.triangularArray(
			eulerianNumberSecondOrder:/2
		)
	}

	setPartitionsDo { :n :k :f:/1 |
		restrictedGrowthStringsDo(n, k) { :x |
			f(x.setPartition)
		}
	}

	setPartitionsDo { :n :f:/1 |
		restrictedGrowthStringsDo(n) { :x |
			f(x.setPartition)
		}
	}

	setPartitions { :n :k |
		restrictedGrowthStrings(n, k).collect(setPartition:/1)
	}

	setPartitions { :n |
		restrictedGrowthStrings(n).collect(setPartition:/1)
	}

	stirlingS1 { :n :k |
		(k = 0).if {
			(n < 1).boole
		} {
			(k > n).if {
				0
			} {
				stirlingS1(n - 1, k - 1) - ((n - 1) * stirlingS1(n - 1, k))
			}
		}
	}

	stirlingS2 { :n :k |
		/*
		0:k.sum { :i |
			((-1 ^ (k - i)) * (i ^ n)) / ((k - i).factorial * i.factorial)
		}
		*/
		((1 / k.factorial) * 0:k.sum { :i |
			(-1 ^ (k - i)) * binomial(k, i) * (i ^ n)
		}).round
	}

	wedderburnEtheringtonNumbers { :self |
		let a:/1 = { :n |
			let f = { :k | a(k) * a(n - k) };
			[
				{ n < 2 } -> {
					n
				},
				{ n.isOdd } -> {
					1.to((n - 1) / 2).sum(f:/1)
				},
				{ n.isEven } -> {
					1.to((n / 2) - 1).sum(f:/1)
					+
					((1 / 2) * a(n / 2) * (1 + a(n / 2)))
				}
			].which
		}.memoize(true);
		0.to(self - 1).collect(a:/1)
	}

}

+@Number {

	doubleFactorial { :self |
		self.isInteger.if {
			self.asLargeInteger.integerDoubleFactorial.normal
		} {
			self.generalizedDoubleFactorial
		}
	}

	factorial { :self |
		self.isNonNegativeInteger.if {
			self.asLargeInteger.integerFactorial.normal
		} {
			(self + 1).gamma
		}
	}

	factorialPower { :self :anInteger |
		(self - 0.to(anInteger - 1)).product
	}

	lowerChristoffelWord { :self :m |
		let x = 1;
		let y = 0;
		let answer = [0];
		1.toDo(m - 1) { :n |
			((y + 1) <= (self * x)).if {
				answer.add(1);
				y := y + 1
			} {
				answer.add(0);
				x := x + 1
			}
		};
		answer
	}

	stirlingsApproximation { :n |
		(2.pi * n).sqrt * ((n / 1.e) ^ n)
	}

}

+[SmallFloat, Complex] {

	generalizedDoubleFactorial { :self |
		let n = self + 2;
		let a = n.pi.cos;
		let b = 2 ^ (0.25 * (-3 + (2 * n) - a));
		let c = 1.pi ^ (0.25 * (-1 + a));
		b * c * (n * 0.5).gamma
	}

}

+List {

	isIntegerPartition { :self :n |
		self.sum = n & {
			self.allSatisfy(isPositiveInteger:/1) & {
				self.isSortedBy(>=)
			}
		}
	}

	isRestrictedGrowthString { :a |
		let n = a.size;
		a[1] = 0 & {
			1.to(n - 1).allSatisfy { :i |
				a[i + 1] <= (1 + a.sliceFromTo(1, i).max)
			}
		}
	}

	isTableau { :self |
		self.collect(size:/1).isSortedBy(>=) & {
			self.catenate.isPermutationList & {
				self.allSatisfy(isSorted:/1) & {
					self.transposeTableau.allSatisfy(isSorted:/1)
				}
			}
		}
	}

	setPartition { :self |
		let answer = { [] } ! self.size;
		self.withIndexDo { :each :index |
			answer.at(each + 1).add(index)
		};
		answer.reject(isEmpty:/1)
	}

	transposeTableau { :self |
		let n = self.collect(size:/1).max;
		1.toAsCollect(n, self.first.species) { :index |
			self.collect { :row |
				row.atOrNil(index)
			}.deleteMissing
		}
	}

}

+@Sequenceable {

	deBruijnSequence { :self :anInteger |
		self.lyndonWords(anInteger).select { :each |
			anInteger.divisible(each.size)
		}.catenate
	}

	isDeBruijnSequence { :x :k :n |
		let a = x.nub.sort;
		(a.size = k) & {
			x.size = (k ^ n) & {
				let b = a.tuples(n);
				let c = x ++ x.first(n - 1);
				b.allSatisfy { :d |
					c.includesSubstring(d)
				}
			}
		}
	}

}

+@Integer {

	deBruijnSequenceCount { :k :n |
		(k.factorial ^ (k ^ (n - 1))) / (k ^ n)
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
			(self.gcd != 1).if {
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
					(lb != Infinity).ifTrue {
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

	isLatticeWord { :self :alphabet |
		let letters = alphabet.allButLast;
		self.prefixes.allSatisfy { :word |
			let a = word.asIdentityMultiset;
			letters.allSatisfy { :i |
				let b = a.occurrencesOf(i);
				let c = a.occurrencesOf(i + 1);
				b >= c
			}
		}
	}

	isLatticeWord { :self |
		let alphabet = self.nub.sort;
		self.isLatticeWord(alphabet)
	}

	isYamanouchiWord { :self |
		self.reverse.isLatticeWord
	}

}

+String {

	deBruijnSequence { :self :anInteger |
		self.characters.deBruijnSequence(anInteger).stringCatenate
	}

}

+Fraction {

	lowerChristoffelWord { :self |
		let [n, d] = self.numeratorDenominator;
		self.lowerChristoffelWord(n + d)
	}

	upperChristoffelWord { :self |
		let [n, d] = self.numeratorDenominator;
		self.lowerChristoffelWord(n + d)
	}

}

+List {

	duvalsAlgorithm { :self |
		let n = self.size;
		let factorisation = [];
		let i = 1;
		{ i <= n }.whileTrue {
			let j = i + 1;
			let k = i;
			{ j <= n & { self[k] <=| self[j] } }.whileTrue {
				(self[k] <| self[j]).if {
					k := i
				} {
					k := k + 1
				};
				j := j + 1
			};
			{ i <= k }.whileTrue {
				factorisation.add(
					self.copyFromTo(i, i + j - k - 1)
				);
				i := i + j - k
			}
		};
		factorisation
	}

}

+String {

	duvalsAlgorithm { :self |
		self.characters.duvalsAlgorithm.collect(stringJoin:/1)
	}

}
