+@Sequenceable {

	quickSortFromToBy { :self :from :to :sortBlock:/2 |
		valueWithReturn { :return:/1 |
			var i, j, k, l, ij, di, dj, dij, n, tmp;
			i := from;
			j := to;
			{
				di := self[i];
				dj := self[j];
				sortBlock(di, dj).ifFalse {
					self[i] := dj;
					self[j] := di;
					tmp := dj;
					dj := di;
					di := tmp
				};
				n := j + 1 - i;
				(n <= 2).ifTrue {
					self.return
				};
				ij := i + j // 2;
				dij := self[ij];
				sortBlock(di, dij).if {
					sortBlock(dij, dj).ifFalse {
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
				k := i;
				l := j;
				{
					{
						l := l - 1;
						k <= l & {
							sortBlock(dij, self[l])
						}
					}.whileTrue;
					{
						k := k + 1;
						k <= l & {
							sortBlock(self[k], dij)
						}
					}.whileTrue;
					k <= l
				}.whileTrue {
					tmp := self[k];
					self[k] := self[l];
					self[l] := tmp
				};
				(i < l).if {
					(k < j).if {
						(l - i < (j - k)).if {
							self.quickSortFromToBy(i, l, sortBlock:/2);
							i := k
						} {
							self.quickSortFromToBy(k, j, sortBlock:/2);
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

	quickSortBy { :self :sortBlock:/2 |
		self.quickSortFromToBy(1, self.size, sortBlock:/2)
	}

	quickSort { :self :sortBlock:/2 |
		self.quickSortBy(sortBlock:/2)
	}

	quickSort { :self |
		self.quickSortBy(<=)
	}

}

+List {

	quickSortHoareWithMonitor { :self :l :r :monitorBlock:/1 |
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
					s.swapWith(i, j);
					monitorBlock(s)
				}
			};
			j
		};
		(l < r & { l >= 1 & { r >= 1 } }).ifTrue {
			let p = partition(self, l, r);
			quickSortHoareWithMonitor(self, l, p, monitorBlock:/1);
			quickSortHoareWithMonitor(self, p + 1, r, monitorBlock:/1)
		};
		self
	}

	quickSortHoareWithMonitor { :self :monitorBlock:/1 |
		self.quickSortHoareWithMonitor(1, self.size, monitorBlock:/1)
	}

	quickSortHoare { :self |
		self.quickSortHoareWithMonitor(nil.constant)
	}

	quickSortMatrix { :self |
		self.sortTracingState(
			quickSortHoareWithMonitor:/2
		)
	}

}
