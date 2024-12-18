TimeSeries : [Object, Iterable, Indexable, Collection] { | contents |

	associations { :self |
		self.contents.collect { :each |
			each[1] -> each[2]
		}
	}

	associationsDo { :self :aBlock:/1 |
		self.contents.do { :each |
			aBlock(each[1] -> each[2])
		}
	}

	at { :self :time |
		self.contents.detectIfFoundIfNone { :each |
			each[1] = time
		} { :entry |
			entry[2]
		} {
			self.error('at: invalid index')
		}
	}

	atPut { :self :time :item |
		valueWithReturn { :return:/1 |
			let data = self.contents;
			1.toDo(data.size) { :i |
				(time < data[i][1]).ifTrue {
					data.insertAt(i, [time, item]);
					item.return
				};
				(time = data[i][1]).ifTrue {
					data[i][2] := item;
					item.return
				}
			};
			data.addLast([time, item]);
			item
		}
	}

	discretePlot { :self |
		self.contents.discretePlot
	}

	do { :self :aBlock:/1 |
		self.contents.do { :each |
			aBlock(each[2])
		}
	}

	endTime { :self |
		self.contents.last[1]
	}

	indices { :self |
		self.contents.collect(first:/1)
	}

	isRegularlySampled { :self |
		let data = self.contents;
		(data.size <= 2).if {
			true
		} {
			let z = data[2][1] - data[1][1];
			(3 .. data.size).allSatisfy { :i |
				data[i][1] - data[i - 1][1] = z
			}
		}
	}

	keys { :self |
		self.indices
	}

	keysDo { :self :aBlock:/1 |
		self.contents.do { :each |
			aBlock(each[1])
		}
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.contents.do { :each |
			aBlock(each[1], each[2])
		}
	}

	linePlot { :self |
		self.contents.linePlot
	}

	merge { :self :aTimeSeries :resolveConflict:/2 |
		let lhs = self.contents;
		let rhs = aTimeSeries.contents;
		let i2 = 1;
		let t2 = rhs[1][1];
		let k2 = rhs.size;
		let nextRhs = {
			let x = rhs[i2][2];
			i2 := i2 + 1;
			(i2 <= k2).ifTrue {
				t2 := rhs[i2][1]
			};
			x
		};
		let answer = [];
		lhs.do { :each |
			let [t1, v1] = each;
			{
				t2 < t1 & {
					i2 <= k2
				}
			}.whileTrue {
				answer.add([t2, nextRhs()])
			};
			(t1 = t2).if {
				let r = resolveConflict(v1, nextRhs());
				answer.add([t1, r])
			} {
				answer.add([t1, v1])
			}
		};
		i2.toDo(rhs.size) { :i |
			answer.add(rhs[i])
		};
		TimeSeries(answer)
	}

	merge { :self :aTimeSeries |
		self.merge(aTimeSeries) { :lhs :rhs |
			self.error('merge: conflict')
		}
	}

	minimumTimeIncrement { :self |
		self.keys.differences.min
	}

	size { :self |
		self.contents.size
	}

	startTime { :self |
		self.contents.first[1]
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	values { :self |
		self.contents.collect(second:/1)
	}

	valuesDo { :self :aBlock:/1 |
		self.do(aBlock:/1)
	}

	window { :self :startTime :endTime |
		self.contents.select { :each |
			each[1] >= startTime & {
				each[1] <= endTime
			}
		}.TimeSeries
	}

}

+List {

	TimeSeries { :self |
		newTimeSeries().initializeSlots(self)
	}

}

+[List, Range] {

	asTimeSeries { :values :times |
		TimeSeries([times, values].transposed)
	}

}
