+@Integer {

	integerPartitionUnrank { :n :method |
		method.caseOf(
			[
				'HeinzAscending' -> {
					n.integerPartitionUnrankHeinzAscending
				},
				'Heinz' -> {
					n.integerPartitionUnrankHeinzAscending.reverse
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

	integerPartitionUnrankHeinzAscending { :n |
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
				p.add!(i)
			}
		};
		p
	}

	integerPartitions { :n |
		(n = 0L).if {
			[[]]
		} {
			let answer = [];
			n.integerPartitionsDescendingDo { :each |
				answer.add!(each)
			};
			answer
		}
	}

	integerPartitions { :n :k |
		k.collect { :each |
			n.integerPartitionsExactly(each)
		}.++
	}

	integerPartitionsAscending { :self |
		let answer = [];
		self.integerPartitionsAscendingDo { :each |
			answer.add!(each)
		};
		answer
	}

	integerPartitionsAscendingDo { :self :aBlock/1 |
		let n = self;
		let a = List(n, 0L);
		let k = 2L;
		let y = n - 1L;
		{
			k != 1L
		}.whileTrue {
			k := k - 1L;
			let x = a[k] + 1L;
			{
				(2L * x) <= y
			}.whileTrue {
				a[k] := x;
				y := y - x;
				k := k + 1L
			};
			let l = k + 1L;
			{
				x <= y
			}.whileTrue {
				a[k] := x;
				a[l] := y;
				aBlock(a.copyFromTo(1, l));
				x := x + 1L;
				y := y - 1L
			};
			y := y + x - 1L;
			a[k] := y + 1L;
			aBlock(a.copyFromTo(1, k))
		}
	}

	integerPartitionsDescendingDo { :self :aBlock/1 |
		let n = self;
		let d = List(n, 1L);
		let k = 1L;
		d[1] := n;
		aBlock(d.copyFromTo(1, 1));
		{
			k != n
		}.whileTrue {
			let l = k;
			let m = d[k];
			{
				m = 1L
			}.whileTrue {
				k := k - 1L;
				m := d[k]
			};
			let nPrime = m + l - k.L;
			m := m - 1L;
			{
				m < nPrime
			}.whileTrue {
				d[k] := m;
				nPrime := nPrime - m;
				k := k + 1L
			};
			d[k] := nPrime;
			aBlock(d.copyFromTo(1, k))
		}
	}

	integerPartitionsDimensions { :self |
		let h = { :l |
			let n = l.size;
			l.sum.factorial // Range(1, n, 1).product { :i |
				let m = l[i];
				Range(1, m, 1).product { :j |
					1 + m - j + Range(i + 1, n, 1).count { :k |
						l[k] >= j
					}
				}
			}
		};
		let g = { :n :i :l |
			(n = 0 | { i = 1 }).if {
				[h(l ++ List(n, 1))]
			} {
				(i < 1).if {
					[0]
				} {
					Range(0, n // i, 1).collect { :j |
						g(n - (i * j), i - 1, l ++ List(j, i))
					}.catenate
				}
			}
		};
		g(self, self, [])
	}

	integerPartitionsExactly { :j :i |
		let f = { :t :m :n |
			(
				m = 1L & {
					t = n
				}
			).if {
				[[t]]
			} {
				(
					n < m | {
						n < 1L | {
							m < 1L | {
								t < 1L
							}
						}
					}
				).if {
					[]
				} {
					f(t, m - 1L, n - t).collect { :r |
						([t] ++ r)
					} ++ f(t - 1L, m, n)
				}
			}
		};
		f(j - i + 1L, i, j)
	}

	integerPartitionsOdd { :self |
		self.integerPartitions.select { :each |
			each.allSatisfy(isOdd/1)
		}
	}

	integerPartitionsRecursive { :n |
		1L.to(n).collectCatenate { :k |
			n.integerPartitionsExactly(k)
		}
	}

	integerPartitionsStrict { :self |
		self.integerPartitions.select(isDuplicateFree/1)
	}

	partitionFunctionP { :self :anInteger |
		let p = { :n :k |
			(k > n).if {
				0L
			} {
				(k = n).if {
					1L
				} {
					(k = 0L).if {
						0L
					} {
						p(n - 1L, k - 1L) + p(n - k, k)
					}
				}
			}
		};
		p(self, anInteger)
	}

	[partitionFunctionP, partitionsP] { :n |
		let a = List(n + 1, nil);
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

	[partitionFunctionQ, partitionsQ] { :n |
		(n < 1).if {
			1L
		} {
			1L.to(n).sum { :k |
				partitionFunctionQ(n, k)
			}
		}
	}

	partitionFunctionQ { :n :k |
		partitionFunctionP(
			n - integerBinomial(k, 2L),
			k
		)
	}

}

+List {

	bulgarianSolitaire { :self |
		let a = [self.size];
		let b = (self - 1).without!(0);
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
				answer.add!(j);
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

	durfeeSquare { :p |
		let k = p.size;
		let i = 1;
		{
			i <= k & {
				p[i] >= i
			}
		}.whileTrue {
			i := i + 1
		};
		i - 1
	}

	dysonCrank { :p |
		let omega = p.occurrencesOf(1);
		(omega = 0).if {
			p.max
		} {
			let mu = p.count { :x |
				x > omega
			};
			mu - omega
		}
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

	hookLengthFormula { :p |
		let n = p.sum;
		let h = p.hookLengths.catenate;
		n.! // h.product
	}

	hookLengths { :p |
		let c = p.conjugatePartition;
		let m = p.size;
		1.toCollect(m) { :i |
			let n = p[i];
			1.toCollect(n) { :j |
				p[i] - i + c[j] - j + 1
			}
		}
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

}
