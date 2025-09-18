+@Collection {

	arithmeticMean { :self |
		self.sum / self.size
	}

	average { :self |
		self.mean
	}

	centralFeature { :self :aBlock:/2 |
		let n = self.size;
		let m = Infinity;
		let k = 0;
		1.toDo(n) { :i |
			let d = (1 .. n).collect { :j |
				aBlock(self[i], self[j])
			}.sum;
			(d < m).ifTrue {
				m := d;
				k := i
			}
		};
		self[k]
	}

	centralMoment { :self :r |
		let mean = self.mean;
		(1 / self.size) * ((self - mean) ^ r).sum
	}

	contraharmonicMean { :self |
		self.square.sum / self.sum
	}

	geometricMean { :self |
		self.product ^ (1 / self.size)
	}

	harmonicMean { :self |
		self.size / self.reciprocal.sum
	}

	interquartileRange { :self :o |
		let [q1, q2, q3] = self.quartiles(o);
		q3 - q1
	}

	interquartileRange { :self |
		let [q1, q2, q3] = self.quartiles;
		q3 - q1
	}

	kurtosis { :self |
		self.isVector.if {
			self.centralMoment(4) / (self.centralMoment(2) ^ 2)
		} {
			self.isMatrix.if {
				self.transpose.collect(kurtosis:/1)
			} {
				'@Collection>>kurtosis: not vector or matrix'.error
			}
		}
	}

	mean { :self |
		self.sum / self.size
	}

	meanDeviation { :self :aBlock:/1 |
		(self - aBlock(self)).abs.sum / self.size
	}

	meanDeviation { :self |
		self.meanDeviation(mean:/1)
	}

	meanShift { :x :d |
		x.collect { :a |
			x.select { :b |
				a.euclideanDistance(b) <= d
			}.mean
		}
	}

	meanShift { :x :d :m |
		let y = x.meanShift(d);
		(m <= 1 | { y = x }).if {
			y
		} {
			y.meanShift(d, m - 1)
		}
	}

	meanSquare { :self |
		self.square.mean
	}

	moment { :self :r |
		(1 / self.size) * (self ^ r).sum
	}

	percentile { :self :p :o |
		self.quantile(p / 100, o)
	}

	percentile { :self :p |
		self.percentile(p, [0 1; 0 1])
	}

	quantile { :self :p :o |
		self.isVector.if {
			self.asSortedList(<=).quantile(p, o)
		} {
			self.isMatrix.if {
				self.transpose.collect { :each |
					each.asSortedList(<=).quantile(p, o)
				}
			} {
				'Collection>>quantile: not vector or matrix'
			}
		}
	}

	quantile { :self :p |
		self.quantile(p, [0 0; 1 0])
	}

	quartiles { :self :o |
		self.quantile([1 2 3] / 4, o)
	}

	quartiles { :self |
		self.quartiles([0.5 0; 0 1])
	}

	rootMeanSquare { :self |
		self.square.mean.sqrt
	}

	sampleStandardDeviation { :self |
		(self - self.mean).square.mean.sqrt
	}

	sampleVariance { :self |
		((self - self.mean) ^ 2).sum / self.size
	}

	skewness { :self |
		self.isVector.if {
			self.centralMoment(3) / (self.centralMoment(2) ^ (3 / 2))
		} {
			self.isMatrix.if {
				self.transpose.collect(skewness:/1)
			} {
				'@Collection>>skewness: not vector or matrix'.error
			}
		}
	}

	standardDeviation { :self |
		self.variance.sqrt
	}

	standardizedMoment { :self :r |
		self.centralMoment(r) / (self.sampleStandardDeviation ^ r)
	}

	stochasticVector { :self :k |
		let v = 0 # k;
		self.do { :i |
			v[i] := v[i] + 1
		};
		v / v.sum
	}

	trimmedMean { :self :f |
		let [f1, f2] = f;
		let n = self.size;
		self.sorted(<=).sliceFromTo(
			1 + (f1 * n).floor,
			n - (f2 * n).floor
		).mean
	}

	variance { :self |
		((self - self.mean) ^ 2).sum / (self.size - 1)
	}

	winsorizedMean { :self :f |
		let [f1, f2] = f;
		let n = self.size;
		let z1 = self.rankedMin(1 + (f1 * n).floor);
		let z2 = self.rankedMax(1 + (f2 * n).floor);
		self.clip([z1 z2]).mean
	}

}

+@Sequenceable {

	absoluteCorrelation { :u :v |
		let n = u.size;
		(v.size = n).if {
			u.dot(v.conjugate) / n
		} {
			u.error('absoluteCorrelation: size mismatch')
		}
	}

	absoluteCorrelationFunction { :x :hList |
		let n = x.size;
		hList.collect { :h |
			(1 .. n - h).collect { :i |
				x[i] * x[i + h]
			}.sum / n
		}
	}

	blomqvistBeta { :v :w |
		(v - v.median).sign.correlation(
			(w - w.median).sign
		)
	}

	correlation { :v :w |
		v.isMatrix.if {
			v.matrixCorrelation(w)
		} {
			v.covariance(w) / (v.standardDeviation * w.standardDeviation)
		}
	}

	correlationDistance { :u :v |
		let uu = (u - u.mean);
		let vv = (v - v.mean);
		1 - ((u - u.mean).dot(v - v.mean) / (uu.norm * vv.norm))
	}

	correlationFunction { :x :hList |
		let n = x.size;
		let mu = x.mean;
		hList.collect { :h |
			let a = (1 .. n - h).collect { :i |
				(x[i] - mu) * (x[i + h] - mu)
			}.sum;
			let b = (1 .. n).collect { :i |
				(x[i] - mu).square
			}.sum;
			a / b
		}
	}

	covariance { :v :w |
		v.isMatrix.if {
			v.crossCovarianceMatrix(w)
		} {
			let n = v.size;
			let m = w.size;
			(n = m).if {
				(1 / (n - 1)) * (v - v.mean).dot((w - w.mean).conjugate)
			} {
				[v, w].error('@Sequenceable>>covariance: vectors must be equal')
			}
		}
	}

	covarianceFunction { :x :hList |
		let n = x.size;
		let mu = x.mean;
		hList.collect { :h |
			(1 / n) * (1 .. n - h).collect { :i |
				(x[i + h] - mu) * (x[i] - mu)
			}.sum
		}
	}

	median { :self |
		self.asSortedList(<=).median
	}

	spearmanRho { :u :v |
		correlation(
			u.rankingFractional,
			v.rankingFractional
		)
	}

	standardDeviation { :self |
		self.isMatrix.if {
			self.transpose.collect { :each |
				each.variance.sqrt
			}
		} {
			self.variance.sqrt
		}
	}

	standardize { :self :meanBlock:/1 :deviationBlock:/1 |
		let deviation = deviationBlock(self);
		(deviation = 0).if {
			self.error('@Sequenceable>>standardize: deviation = 0?')
		} {
			(self - meanBlock(self)) / deviation
		}
	}

	standardize { :self :meanBlock:/1 |
		self.standardize(meanBlock:/1, standardDeviation:/1)
	}

	standardize { :self |
		self.standardize(mean:/1, standardDeviation:/1)
	}

	variance { :self |
		self.isMatrix.if {
			self.transpose.collect(variance:/1)
		} {
			((self - self.mean) ^ 2).sum / (self.size - 1)
		}
	}

}

+List {

	gaussianFilter { :x :r |
		let sigma = r / 2;
		let k = [r.negate .. r].collect(sigma.gaussianKernel);
		let y = k.convolve(x);
		y.removeFirst(r);
		y.removeLast(r);
		y
	}

	geometricMeanFilter { :x :r |
		{ :y :i |
			y.geometricMean
		}.neighbourhoodMap(x, r)
	}

	harmonicMeanFilter { :x :r |
		{ :y :i |
			y.harmonicMean
		}.neighbourhoodMap(x, r)
	}

	meanFilter { :x :r |
		{ :y :i |
			y.mean
		}.neighbourhoodMap(x, r)
	}

	medianFilter { :x :r |
		{ :y :i |
			y.median
		}.neighbourhoodMap(x, r)
	}

	meanShiftFilter { :self :r :d |
		{ :each :i |
			let a = self[i];
			each.select { :b |
				a.euclideanDistance(b) <= d
			}.mean
		}.neighbourhoodMap(self, r)
	}

	nadarayaWatsonEstimator { :i :x :y :h :k:/1 |
		let kx = x.collect { :each |
			((i - each) / h).collect(k:/1) / h
		}.transpose;
		let w = kx / kx.collect(sum:/1);
		w.dot(y)
	}

}


+System {

	nistData { :self |
		self
		.requireLibraryItem(
			'NistEngineeringStatisticsHandbookData'
		)
	}

	nistData { :self :name :columns |
		let d = self.nistData.at(name);
		(d.isVector & { columns = [1] }).if {
			d
		} {
			d.isMatrix.if {
				let h = d[1];
				let m = d.allButFirst;
				(columns.size = 1).if {
					m.column(columns[1])
				} {
					m.columns(columns)
				}
			} {
				self.error('nistData: invalid data')
			}
		}
	}

}

LibraryItem(
	name: 'NistEngineeringStatisticsHandbookData',
	category: 'Math/Statistics',
	url: 'https://rohandrape.net/sw/hsc3-data/data/statistics/nist.json',
	mimeType: 'application/json',
	parser: identity:/1
)
