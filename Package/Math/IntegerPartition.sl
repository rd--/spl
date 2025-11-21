/*
IntegerPartitions : [Object, Equatable, Storeable] { | contents:<List> |

}

+List {

	IntegerPartitions { :self |
		newIntegerPartitions().initializeSlots(self)
	}

}
*/

+@Integer {

	integerPartitions { :n |
		let answer = [];
		n.integerPartitionsDescendingDo { :each |
			answer.add(each)
		};
		answer
	}

	integerPartitions { :n :k |
		k.collect { :each |
			n.integerPartitionsExactly(each)
		}.++
	}

	integerPartitionsDescendingDo { :self :aBlock:/1 |
		let n = self;
		let d = List(n, 1);
		let k = 1;
		d[1] := n;
		aBlock(d.copyFromTo(1, 1));
		{
			k != n
		}.whileTrue {
			let l = k;
			let m = d[k];
			let nPrime = nil;
			{
				m = 1
			}.whileTrue {
				k := k - 1;
				m := d[k]
			};
			nPrime := m + l - k;
			m := m - 1;
			{
				m < nPrime
			}.whileTrue {
				d[k] := m;
				nPrime := nPrime - m;
				k := k + 1
			};
			d[k] := nPrime;
			aBlock(d.copyFromTo(1, k))
		}
	}

	integerPartitionsAscendingDo { :self :aBlock:/1 |
		let n = self;
		let a = List(n, 0);
		let k = 2;
		let y = n - 1;
		{
			k != 1
		}.whileTrue {
			var x, l;
			k := k - 1;
			x := a[k] + 1;
			{
				(2 * x) <= y
			}.whileTrue {
				a[k] := x;
				y := y - x;
				k := k + 1
			};
			l := k + 1;
			{
				x <= y
			}.whileTrue {
				a[k] := x;
				a[l] := y;
				aBlock(a.copyFromTo(1, l));
				x := x + 1;
				y := y - 1
			};
			y := y + x - 1;
			a[k] := y + 1;
			aBlock(a.copyFromTo(1, k))
		}
	}

	integerPartitionsAscending { :self |
		let answer = [];
		self.integerPartitionsAscendingDo { :each |
			answer.add(each)
		};
		answer
	}

	integerPartitionsExactly { :j :i |
		let f = { :t :m :n |
			(m = 1 & { t = n }).if {
				[[t]]
			} {
				(n < m | { n < 1 | { m < 1 | { t < 1 } } }).if {
					[]
				} {
					f(t, m - 1, n - t).collect { :r |
						([t] ++ r)
					} ++ f(t - 1, m, n)
				}
			}
		};
		f(j - i + 1, i, j)
	}

	integerPartitionsOdd { :self |
		self.integerPartitions.select { :each |
			each.allSatisfy(isOdd:/1)
		}
	}

	integerPartitionsRecursive { :n |
		1.to(n).collectCatenate { :k |
			n.integerPartitionsExactly(k)
		}
	}

	integerPartitionsStrict { :self |
		self.integerPartitions.select(isDuplicateFree:/1)
	}

	integerPartitionUnrankHeinz { :n |
		n.primeFactors.primePi
	}

	integerPartitionUnrankKarttunenAscending { :n |
		let p = [];
		let b = n % 2;
		let i = 1;
		{ n != 0 }.whileTrue {
			n := n >> 1;
			((n % 2) = b).if {
				i := i + 1
			} {
				b := n % 2;
				p.add(i)
			}
		};
		p
	}

	integerPartitionUnrank { :n :method |
		method.caseOf(
			[
				'Heinz' -> {
					n.integerPartitionUnrankHeinz
				},
				'KarttunenAscending' -> {
					n.integerPartitionUnrankKarttunenAscending
				},
				'Karttunen' -> {
					n.integerPartitionUnrankKarttunenAscending.reverse
				}
			]
		)
	}

	partitionFunctionP { :self :anInteger |
		let p = { :n :k |
			(k > n).if {
				0
			} {
				(k = n).if {
					1
				} {
					(k = 0).if {
						0
					} {
						p(n - 1, k - 1) + p(n - k, k)
					}
				}
			}
		};
		p(self, anInteger)
	}

	partitionFunctionP { :n |
		let a = List(n + 1);
		a[1] := 1L;
		1.toDo(n) { :i |
			let k = 1;
			let s = 1;
			a[i + 1] := 0L;
			{
				s <= i
			}.whileTrue {
				k.isOdd.if {
					a[i + 1] := a[i + 1] + a[i - s + 1]
				} {
					a[i + 1] := a[i + 1] - a[i - s + 1]
				};
				(k > 0).if {
					s := s + k;
					k := k.-
				} {
					k := 1 - k;
					s := k * (3 * k - 1) / 2
				}
			}
		};
		a[n + 1]
	}

	partitionFunctionQ { :n |
		(n < 1).if {
			1
		} {
			1.to(n).sum { :k |
				partitionFunctionQ(n, k)
			}
		}
	}

	partitionFunctionQ { :n :k |
		partitionFunctionP(n - k.binomial(2), k)
	}

	partitionsP { :n |
		n.partitionFunctionP
	}

	partitionsQ { :n |
		n.partitionFunctionQ
	}

}

+List {

	bulgarianSolitaire { :self |
		let a = [self.size];
		let b = (self - 1).without(0);
		(a ++ b).reverseSort
	}

	conjugatePartition { :self |
		let answer = [];
		let j = self.size;
		let done = false;
		(j <= 0).if {
			answer
		} {
			{
				done
			}.whileFalse {
				answer.add(j);
				{
					done.not & {
						answer.size >= self[j]
					}
				}.whileTrue {
					j := j - 1;
					(j = 0).ifTrue {
						done := true
					}
				}
			}
		};
		answer
	}

	ferrersDiagram { :self |
		let m = self.size;
		0.toCollect(m - 1) { :i |
			1.toCollect(self[m - i]) { :j |
				Disk([j, i], 0.25)
			}
		}.LineDrawing
	}

	heinzNumber { :p |
		p.prime.product
	}

	integerPartitionRankKarttunenAscending { :p |
		let n = 0;
		let parity = p.size % 2;
		let q = 1;
		let j = 1;
		p.do { :i |
			let runLength = (i - j) + 1;
			(0 != parity).ifTrue {
				n := n + (((2 ^ runLength) - 1) * q)
			};
			q := q << runLength;
			j := i;
			parity := 1 - parity
		};
		n
	}

	integerPartitionRank { :p :method |
		method.caseOf(
			[
				'Heinz' -> {
					p.heinzNumber
				},
				'KarttunenAscending' -> {
					p.integerPartitionRankKarttunenAscending
				},
				'Karttunen' -> {
					p.reverse.integerPartitionRankKarttunenAscending
				}
			]
		)
	}

}
