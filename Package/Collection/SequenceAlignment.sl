+@Sequenceable {

	contiguousSubsequences { :self |
		let n = self.size;
		self.substrings.select { :each |
			let k = each.size;
			k > 1 & { k != n }
		}
	}

	includesScatteredSubsequence { :self :aList |
		valueWithReturn { :return:/1 |
			1.to(self.size).powerSetDo { :each |
				each.isArithmeticProgression(1, =).ifFalse {
					(self @* each = aList).ifTrue {
						true.return
					}
				}
			};
			false
		}
	}

	includesSubsequence { :self :aList |
		valueWithReturn { :return:/1 |
			let i = 1;
			aList.do { :each |
				i := self.indexOfStartingAtBy(each, i, =);
				(i = 0).ifTrue {
					false.return
				}
			};
			true
		}
	}

	includesSubstring { :self :aList |
		let n = self.size;
		let k = aList.size;
		let c = aList.first;
		self.indicesOf(c).anySatisfy { :i |
			(i + k - 1) <= n & {
				1.to(k).allSatisfy { :j |
					self[i + j - 1] = aList[j]
				}
			}
		}
	}

	indexOfSubstring { :self :aList |
		self.indexOfSubstringStartingAt(aList, 1)
	}

	indexOfSubstringStartingAt { :self :aList :start |
		let k = aList.size;
		(k = 0).if {
			0
		} {
			let first = aList[1];
			valueWithReturn { :return:/1 |
				start.max(1).toDo(self.size - k + 1) { :startIndex |
					(self[startIndex] = first).ifTrue {
						let index = 2;
						{
							index <= k & {
								self[startIndex + index - 1] = aList[index]
							}
						}.whileTrue {
							index := index + 1
						};
						(index <= k).ifFalse {
							startIndex.return
						}
					}
				};
				0
			}
		}
	}

	indicesOfSubsequence { :self :aList |
		let answer = [];
		1.to(self.size).powerSetDo { :each |
			(self @* each = aList).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	indicesOfSubstringStartingAt { :self :aList :initialIndex |
		let answer = [];
		let index = initialIndex - 1;
		{
			index := self.indexOfSubstringStartingAt(aList, index + 1);
			index = 0
		}.whileFalse {
			answer.add(index)
		};
		answer
	}

	indicesOfSubstring { :self :aList |
		self.indicesOfSubstringStartingAt(aList, 1)
	}

	increasingSubsequenceList { :self :aBlock:/2 |
		(self.size < 2).if {
			[self]
		} {
			let increasing = { :done :remaining |
				remaining.isEmpty.if {
					[done]
				} {
					aBlock(done.last, remaining.first).if {
						increasing(
							done ++ [remaining.first],
							remaining.allButFirst
						)
					} {
						[]
					} ++ increasing(done, remaining.allButFirst)
				}
			};
			1.to(self.size).collectCatenate { :i |
				increasing(self.first(i).last(1), self.drop(i))
			}
		}
	}

	increasingSubsequenceList { :self |
		self.increasingSubsequenceList(<|)
	}

	longestCommonPrefixSize { :u :v |
		let n = min(u.size, v.size);
		let k = 1;
		{ k - 1 < n & { u[k] = v[k] } }.whileTrue {
			k := k + 1
		};
		k - 1
	}

	longestCommonPrefix { :u :v |
		u.copyFromTo(1, longestCommonPrefixSize(u, v))
	}

	longestCommonSubsequence { :a :b |
		let m = a.size + 1;
		let n = b.size + 1;
		let lengths = [m, n].zeroMatrix;
		let answer = [];
		a.withIndexCollect { :x :i |
			b.withIndexCollect { :y :j |
				(x = y).if {
					lengths[i + 1, j + 1] := lengths[i, j] + 1
				} {
					lengths[i + 1, j + 1] := lengths[i + 1, j].max(lengths[i, j + 1])
				}
			}
		};
		{
			(m > 1) && (n > 1)
		}.whileTrue {
			(lengths[m, n] = lengths[m - 1, n]).if {
				m := m - 1
			} {
				(lengths[m, n] = lengths[m, n -  1]).if {
					n := n - 1
				} {
					(a[m - 1] = b[n - 1]).ifFalse {
						'@Sequenceable>>longestCommonSubsequence: error?'.error
					};
					answer.addFirst(a[m - 1]);
					m := m - 1;
					n := n - 1
				}
			}
		};
		answer
	}

	longestCommonSubstringList { :self :aList |
		let find = { :k |
			self.partition(k, 1).intersection(aList.partition(k, 1))
		};
		let n = self.size.min(aList.size);
		valueWithReturn { :return:/1 |
			n.toByDo(1, -1) { :k |
				let common = find(k);
				common.isEmpty.ifFalse {
					common.return
				}
			};
			[]
		}
	}

	longestCommonSubstring { :self :aList |
		let common = self.longestCommonSubstringList(aList);
		common.isEmpty.if {
			[]
		} {
			common.first
		}
	}

	longestCommonSuffixSize { :u :v |
		let a = u.size;
		let b = v.size;
		let n = min(a, b);
		let k = 0;
		{ k < n & { u[a - k] = v[b - k] } }.whileTrue {
			k := k + 1
		};
		k
	}

	longestCommonSuffix { :u :v |
		let n = u.size;
		u.copyFromTo(n - longestCommonSuffixSize(u, v) + 1, n)
	}

	longestIncreasingSubsequence { :self |
		let x = self;
		let n = x.size;
		(n < 2).if {
			x
		} {
			let p = List(n, 0);
			let m = List(n + 1, 0);
			let l = 0;
			let answer = [];
			let k = nil;
			0.toDo(n - 1) { :i |
				let lo = 1;
				let hi = l;
				let z = nil;
				{
					lo <= hi
				}.whileTrue {
					let mid = ((lo + hi) / 2).ceiling;
					(x[m[mid + 1] + 1] < x[i + 1]).if {
						lo := mid + 1
					} {
						hi := mid - 1
					}
				};
				z := lo;
				p[i + 1] := m[z];
				m[z + 1] := i;
				(z > l).ifTrue {
					l := z
				}
			};
			k := m[l + 1];
			l.timesRepeat {
				answer.addFirst(x[k + 1]);
				k := p[k + 1]
			};
			answer
		}
	}

	orderedSubstrings { :self :aBlock:/2 |
		self.isEmpty.if {
			[]
		} {
			let answer = [];
			let run = [self.first];
			2.toDo(self.size) { :i |
				let item = self[i];
				aBlock(self[i - 1], item).if {
					run.add(item)
				} {
					answer.add(run.copy);
					run.removeAll;
					run.add(item)
				}
			};
			answer.add(run);
			answer
		}
	}

	noncontiguousSubsequences { :self |
		let answer = [];
		[1 .. self.size].powerSetDo { :each |
			(
				each.size > 1 & {
					each.adjacentPairsAllSatisfy { :i :j |
						(j - i) = 1
					}.not
				}
			).ifTrue {
				answer.add(self.atAll(each))
			}
		};
		answer
	}

	orderedSubstrings { :self |
		self.orderedSubstrings(<|)
	}

	sequenceCount { :self :subsequence |
		self.sequencePosition(subsequence).size
	}

	sequencePosition { :self :subsequence |
		let k = subsequence.size - 1;
		self.indicesOfSubstring(subsequence).collect { :each |
			[each, each + k]
		}
	}

	subsequencesDo { :self :aBlock:/1 |
		self.isEmpty.if {
			[]
		} {
			let k = self.size;
			[1 .. k].powerSetDo { :each |
				aBlock(self @* each)
			}
		}
	}

	subsequences { :self :aPredicate:/1 |
		let answer = [];
		self.subsequencesDo { :each |
			aPredicate(each).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	subsequences { :self |
		self.subsequences(true.constant)
	}

	substringsDo { :self :aBlock:/1 |
		0.toDo(self.size) { :each |
			self.partitionDo(each, 1, aBlock:/1)
		}
	}

	substrings { :self :aPredicate:/1 |
		let answer = [];
		self.substringsDo { :each |
			aPredicate(each).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	substrings { :self |
		self.substrings(true.constant)
	}

	substringsInCommon { :self :aList :k |
		self.partition(k, 1).intersection(aList.partition(k, 1))
	}

}

+String {

	contiguousSubsequences { :self |
		self.onCharactersList(
			contiguousSubsequences:/1
		)
	}

	includesSubsequence { :self :aString |
		self
		.characters
		.includesSubsequence(
			aString.characters
		)
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	indexOfSubstringStartingAt { :self :aString :anInteger |
		<primitive: return _self.indexOf(_aString, _anInteger - 1) + 1;>
	}

	indexOfSubstring { :self :aString |
		<primitive: return _self.indexOf(_aString) + 1;>
	}

	longestCommonSubsequence { :self :aString |
		self.onCharacters { :c |
			c.longestCommonSubsequence(
				aString.characters
			)
		}
	}

	longestCommonSubstringList { :self :aString |
		self
		.characters
		.longestCommonSubstringList(aString.characters)
		.collect(stringCatenate:/1)
	}

	longestCommonSubstring { :self :aString |
		self.onCharacters { :c |
			c.longestCommonSubstring(
				aString.characters
			)
		}
	}

	longestIncreasingSubsequence { :self |
		self.onCharacters(
			longestIncreasingSubsequence:/1
		)
	}

	noncontiguousSubsequences { :self |
		self.onCharactersList(
			noncontiguousSubsequences:/1
		)
	}

	subsequences { :self |
		self.onCharactersList(
			subsequences:/1
		)
	}

	substrings { :self |
		self.onCharactersList(
			substrings:/1
		)
	}

}
