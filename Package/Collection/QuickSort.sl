+@Sequence {

	quickSort { :self |
		self.copy.quickSort!
	}

	quickSort! { :self :sortFunction/2 |
		self.quickSortFromToBy(1, self.size, sortFunction/2)
	}

	quickSort! { :self |
		self.quickSort!(isLess/2)
	}

	quickSortFromToBy { :self :from :to :sortFunction/2 |
		withReturn { :return/1 |
			let i = from;
			let j = to;
			{
				let di = self[i];
				let dj = self[j];
				sortFunction(di, dj).ifFalse {
					self[i] := dj;
					self[j] := di;
					let tmp = dj;
					dj := di;
					di := tmp
				};
				let n = j + 1 - i;
				(n <= 2).ifTrue {
					self.return
				};
				let ij = i + j // 2;
				let dij = self[ij];
				sortFunction(di, dij).if {
					sortFunction(dij, dj).ifFalse {
						self[j] := dij;
						self[ij] := dj;
						dij := dj;
						dj := nil
					}
				} {
					self[i] := dij;
					self[ij] := di;
					dij := di;
					di := nil
				};
				(n = 3).ifTrue {
					self.return
				};
				let k = i;
				let l = j;
				{
					{
						l := l - 1;
						k <= l & {
							sortFunction(dij, self[l])
						}
					}.whileTrue;
					{
						k := k + 1;
						k <= l & {
							sortFunction(self[k], dij)
						}
					}.whileTrue;
					k <= l
				}.whileTrue {
					let tmp = self[k];
					self[k] := self[l];
					self[l] := tmp
				};
				(i < l).if {
					(k < j).if {
						(l - i < (j - k)).if {
							self.quickSortFromToBy(i, l, sortFunction/2);
							i := k
						} {
							self.quickSortFromToBy(k, j, sortFunction/2);
							j := l
						}
					} {
						j := l
					}
				} {
					(k < j).if {
						i := k
					} {
						self.return
					}
				}
			}.repeatForever
		}
	}

}

+List {

	quickSortHoare { :self |
		self.quickSortHoareWithMonitor(nil.constant)
	}

	quickSortHoareWithMonitor { :self :l :r :monitorFunction/1 |
		let partition = { :s :l :r |
			let pivot = s[l];
			let i = l - 1;
			let j = r + 1;
			let continue = true;
			{ continue }.whileTrue {
				{
					i := i + 1
				}.doWhileTrue {
					s[i] < pivot
				};
				{
					j := j - 1
				}.doWhileTrue {
					s[j] > pivot
				};
				(i >= j).if {
					continue := false
				} {
					s.swapWith!(i, j);
					monitorFunction(s)
				}
			};
			j
		};
		(l < r & { l >= 1 & { r >= 1 } }).ifTrue {
			let p = partition(self, l, r);
			quickSortHoareWithMonitor(self, l, p, monitorFunction/1);
			quickSortHoareWithMonitor(self, p + 1, r, monitorFunction/1)
		};
		self
	}

	quickSortHoareWithMonitor { :self :monitorFunction/1 |
		self.quickSortHoareWithMonitor(1, self.size, monitorFunction/1)
	}

	quickSortMatrix { :self |
		self.sortTracingState(
			quickSortHoareWithMonitor/2
		)
	}

}
