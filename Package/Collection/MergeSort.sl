+@Sequence {

	mergeFirstMiddleLastIntoBy { :self :first :middle :last :destination :sortFunction/2 |
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
			sortFunction(val1, val2).if {
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
			destination.replaceFromToWithStartingAt!(out + 1, last, self, i1)
		} {
			destination.replaceFromToWithStartingAt!(out + 1, last, self, i2)
		}
	}

	mergeSort { :self |
		self.copy.mergeSort!
	}

	mergeSort! { :self :sortFunction/2 |
		self.mergeSortFromToBy(1, self.size, sortFunction/2)
	}

	mergeSort! { :self |
		self.mergeSort!(isLess/2)
	}

	mergeSortFromToBy { :self :startIndex :stopIndex :sortFunction/2 |
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
			self.copy.mergeSortFromToIntoBy(startIndex, stopIndex, self, sortFunction/2);
			self
		}
	}

	mergeSortFromToIntoBy { :self :firstIndex :lastIndex :destination :sortFunction/2 |
		let n = lastIndex - firstIndex;
		(n <= 1).if {
			(n = 0).if {
				self
			} {
				let firstObject = self[firstIndex];
				let lastObject = self[lastIndex];
				sortFunction(firstObject, lastObject).if {
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
			destination.mergeSortFromToIntoBy(firstIndex, n, self, sortFunction/2);
			destination.mergeSortFromToIntoBy(n + 1, lastIndex, self, sortFunction/2);
			self.mergeFirstMiddleLastIntoBy(firstIndex, n, lastIndex, destination, sortFunction/2)
		}
	}

	mergeSortWithIndices { :self :sortFunction/2 |
		self.ifEmpty {
			[]
		} {
			self.withIndexCollect { :each :index |
				each -> index
			}.mergeSort! { :p :q |
				sortFunction(p.key, q.key)
			}
		}
	}

	mergeSortWithIndices { :self |
		self.mergeSortWithIndices(isLess/2)
	}

}

+List {

	mergeSortMatrix { :self |
		self.sortTracingState(
			mergeSortWithMonitor/2
		)
	}

	mergeSortWithMonitor { :self :left :right :monitorFunction/1 |
		(left < right).ifTrue {
			let middle = (left + right) // 2;
			let i = left;
			let endI = middle;
			let j = middle + 1;
			mergeSortWithMonitor(self, left, middle, monitorFunction/1);
			mergeSortWithMonitor(self, middle + 1, right, monitorFunction/1);
			{ i <= endI & { j <= right } }.whileTrue {
				(self[i] < self[j]).if {
					i := i + 1
				} {
					let x = self[j];
					(j - 1).downToDo(i) { :k |
						self[k + 1] := self[k]
					};
					self[i] := x;
					monitorFunction(self);
					i := i + 1;
					endI := endI + 1;
					j := j + 1
				}
			}
		};
		self
	}

	mergeSortWithMonitor { :self :monitorFunction/1 |
		mergeSortWithMonitor(self, 1, self.size, monitorFunction/1)
	}

}
