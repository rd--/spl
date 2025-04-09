TimeSeries : [Object, Iterable, Indexable, Collection] { | values times |

	associations { :self |
		let answer = [];
		self.associationsDo { :each |
			answer.add(each)
		};
		answer
	}

	associationsDo { :self :aBlock:/1 |
		self.keysAndValuesDo { :t :v |
			aBlock(t -> v)
		}
	}

	akimaInterpolator { :self |
		self.times.akimaInterpolator(
			self.values
		)
	}

	at { :self :time |
		let i = self.times.indexOfIfAbsent(time) {
			self.error('at: invalid index')
		};
		self.values[i]
	}

	atPut { :self :time :item |
		let values = self.values;
		let times = self.times;
		let index = times.binarySearchRightmost(time);
		(index <= times.size & { times[index] = time }).if {
			values[index] := item
		} {
			values.addBeforeIndex(item, index);
			times.addBeforeIndex(time, index)
		};
		item
	}

	collect { :self :aBlock:/1 |
		TimeSeries(
			self.values.collect(aBlock:/1),
			self.times
		)
	}

	cubicSplineInterpolator { :self |
		self.times.cubicSplineInterpolator(
			self.values
		)
	}

	discretePlot { :self |
		self.path.discretePlot
	}

	do { :self :aBlock:/1 |
		self.values.do(aBlock:/1)
	}

	firstTime { :self |
		self.times.first
	}

	firstValue { :self |
		self.values.first
	}

	indices { :self |
		self.times
	}

	interpolation { :self :method |
		let f:/2 = method.namedInterpolatorFunction;
		let x = self.times;
		let y = self.values;
		f(x, y)
	}

	isMultivariate { :self |
		self.valueDimensions > 1
	}

	isRegularlySampled { :self |
		self.times.isRegularlySpaced
	}

	keys { :self |
		self.times
	}

	keysDo { :self :aBlock:/1 |
		self.times.do(aBlock:/1)
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.times.withDo(self.values, aBlock:/2)
	}

	lastTime { :self |
		self.times.last
	}

	lastValue { :self |
		self.values.last
	}

	linearInterpolator { :self |
		self.times.linearInterpolator(
			self.values
		)
	}

	linePlot { :self |
		self.path.linePlot
	}

	merge { :self :aTimeSeries :resolveConflict:/2 |
		let lhs = self.path;
		let rhs = aTimeSeries.path;
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
		self.times.minimumDifference
	}

	nearestNeighborInterpolator { :self |
		self.times.nearestNeighborInterpolator(
			self.values
		)
	}

	path { :self |
		[self.times, self.values].transposed
	}

	pathComponents { :self |
		let k = self.valueDimensions;
		(k = 1).if {
			self.error('pathComponents: not multivariate')
		} {
			let t = self.times;
			let v = self.values.transposed;
			(1 .. k).collect { :i |
				TimeSeries(v[i], t)
			}
		}
	}

	pathLength { :self |
		self.size
	}

	resample { :self :t |
		let x = self.times;
		let y = self.values;
		TimeSeries(
			t.collect(linearInterpolator(x, y)),
			t
		)
	}

	resample { :self |
		let t1 = self.firstTime;
		let t2 = self.lastTime;
		let dt = self.minimumTimeIncrement;
		self.resample([t1, t1 + dt .. t2])
	}

	rescale { :self :t1 :t2 |
		let t = self.times;
		TimeSeries(
			self.values,
			t.rescale(t.first, t.last, t1, t2)
		)
	}

	scatterPlot { :self |
		self.path.scatterPlot
	}

	shift { :self :x |
		TimeSeries(
			self.values,
			self.times + x
		)
	}

	size { :self |
		self.values.size
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	valueDimensions { :self |
		let v = self.values.anyOne;
		v.isList.if {
			v.size
		} {
			1
		}
	}

	valuesDo { :self :aBlock:/1 |
		self.values.do(aBlock:/1)
	}

	window { :self :startTime :endTime |
		let t = self.times;
		let i = t.detectIndex { :each | each >= startTime };
		let j = t.detectIndexStartingAt( { :each | each >= endTime }, i);
		TimeSeries(
			t.copyFromTo(i, j),
			self.values.copyFromTo(i, j)
		)
	}

}

+List {

	TimeSeries { :self |
		let [m, n] = self.shape;
		(n = 2).if {
			let [t, v] = self.transposed;
			TimeSeries(v, t)
		} {
			self.error('TimeSeries: not two-column matrix')
		}
	}

	TimeSeries { :values :times |
		newTimeSeries().initializeSlots(values, times)
	}

}

+List {

	isRegularlySampled { :self |
		self.isVector.if {
			true
		} {
			self.isMatrix.if {
				let [m, n] = self.shape;
				(n = 2).if {
					(m <= 2).if {
						true
					} {
						let z = self[2][1] - self[1][1];
						(3 .. m).allSatisfy { :i |
							self[i][1] - self[i - 1][1] = z
						}
					}
				} {
					self.error('isRegularlySampled: not two column matrix')
				}
			} {
				self.error('isRegularlySampled: not vector or two-column matrix')
			}
		}
	}

	minimumTimeIncrement { :self |
		self.isVector.if {
			1
		} {
			self.isMatrix.if {
				let [m, n] = self.shape;
				(n = 2).if {
					self.minimumDifferenceBy(first:/1)
				} {
					self.error('minimumTimeIncrement: not two-column matrix')
				}
			} {
				self.error('minimumTimeIncrement: not vector or two-column matrix')
			}
		}
	}

}
