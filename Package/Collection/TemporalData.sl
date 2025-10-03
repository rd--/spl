TemporalData : [Object, Equatable] { | valueList timeList |

	asTimeSeries { :self |
		let v = self.valueList;
		let t = self.timeList;
		(t.size = 1).if {
			TimeSeries(v[1], t[1])
		} {
			t.allEqual.if {
				TimeSeries(
					self.valueList.transpose,
					self.timeList.anyOne
				)
			} {
				self.error('asTimeSeries: non-uniform timeList')
			}
		}
	}

	dataPointCount { :self |
		self.valueList.collect(size:/1).sum
	}

	discretePlot { :self |
		self.pathList.discretePlot
	}

	isRegularlySampled { :self |
		self.timeList.allSatisfy(isRegularlySpaced:/1)
	}

	linePlot { :self |
		self.pathList.linePlot
	}

	minimumTimeIncrement { :self |
		self.timeList.collect(minimumDifference:/1)
	}

	pathCount { :self |
		self.valueList.size
	}

	pathList { :self |
		self.timeList.withCollect(self.valueList) { :i :j |
			[i, j].transpose
		}
	}

	resample { :self :t |
		let k = self.pathCount;
		let x = self.timeList;
		let y = self.valueList;
		(t.size = k).if {
			TemporalData(
				(1 .. k).collect { :i |
					t[i].collect(
						linearInterpolator(x[i], y[i])
					)
				},
				t
			)
		} {
			self.error('resample: size mismatch')
		}
	}

	scatterPlot { :self |
		self.pathList.scatterPlot
	}

	stepPlot { :self |
		self.pathList.stepPlot
	}

	timelinePlot { :self |
		self.timeList.timelinePlot
	}

}

+List {

	TemporalData { :self |
		let t = [];
		let v = [];
		self.do { :each |
			let [i, j] = each.transpose;
			t.add(i);
			v.add(j)
		};
		TemporalData(v, t)
	}

	TemporalData { :v :t |
		(v.size = t.size).if {
			newTemporalData().initializeSlots(v, t)
		} {
			[v, t].error('TemporalData: size mismatch')
		}
	}

}

+Block {

	regularTemporalData { :aBlock:/1 :timeSpecificationList |
		TemporalData(
			timeSpecificationList.collect { :timeSpecification |
				let [tMin, tMax, tStep] = timeSpecification;
				let timeList = [tMin, tMin + tStep .. tMax];
				[
					timeList,
					aBlock(timeList)
				].transpose
			}
		)
	}

}
