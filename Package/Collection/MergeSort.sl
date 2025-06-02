+@Sequenceable {

	mergeFirstMiddleLastIntoBy { :self :first :middle :last :destination :aBlock:/2 |
		let i1 = first;
		let i2 = middle + 1;
		let val1 = self[i1];
		let val2 = self[i2];
		let out = first - 1;
		{
			i1 <= middle & {
				i2 <= last
			}
		}.whileTrue {
			aBlock(val1, val2).if {
				out := out + 1;
				i1 := i1 + 1;
				destination[out] := val1;
				val1 := self[i1]
			} {
				out := out + 1;
				i2 := i2 + 1;
				destination[out] := val2;
				val2 := self.atWrap(i2)
			}
		};
		(i1 <= middle).if {
			destination.replaceFromToWithStartingAt(out + 1, last, self, i1)
		} {
			destination.replaceFromToWithStartingAt(out + 1, last, self, i2)
		}
	}

	mergeSortFromToBy { :self :startIndex :stopIndex :aBlock:/2 |
		let size = self.size;
		(
			size <= 1 | {
				startIndex = stopIndex
			}
		).if {
			self
		} {
			(1 <= startIndex).ifFalse {
				self.errorSubscriptBounds(startIndex)
			};
			(stopIndex <= size).ifFalse {
				self.errorSubscriptBounds(stopIndex)
			};
			(startIndex < stopIndex).ifFalse {
				self.errorSubscriptBounds(startIndex)
			};
			self.shallowCopy.mergeSortFromToIntoBy(startIndex, stopIndex, self, aBlock:/2);
			self
		}
	}

	mergeSortFromToIntoBy { :self :firstIndex :lastIndex :destination :aBlock:/2 |
		let n = lastIndex - firstIndex;
		(n <= 1).if {
			(n = 0).if {
				self
			} {
				let firstObject = self[firstIndex];
				let lastObject = self[lastIndex];
				aBlock(firstObject, lastObject).if {
					destination[lastIndex] := lastObject;
					destination[firstIndex] := firstObject
				} {
					destination[lastIndex] := firstObject;
					destination[firstIndex] := lastObject
				};
				self
			}
		} {
			n := firstIndex + lastIndex // 2;
			destination.mergeSortFromToIntoBy(firstIndex, n, self, aBlock:/2);
			destination.mergeSortFromToIntoBy(n + 1, lastIndex, self, aBlock:/2);
			self.mergeFirstMiddleLastIntoBy(firstIndex, n, lastIndex, destination, aBlock:/2)
		}
	}

	mergeSortBy { :self :aSortBlock:/2 |
		self.mergeSortFromToBy(1, self.size, aSortBlock:/2)
	}

	mergeSort { :self |
		self.mergeSortBy(<)
	}

	mergeSortWithIndices { :self :sortBlock:/2 |
		self.ifEmpty {
			[]
		} {
			self.withIndexCollect { :each :index |
				each -> index
			}.mergeSortBy { :p :q |
				sortBlock(p.key, q.key)
			}
		}
	}

	mergeSortWithIndices { :self |
		self.mergeSortWithIndices(<)
	}

}
