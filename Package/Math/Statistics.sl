+@Collection {

	arithmeticMean { :self |
		self.sum / self.size
	}

	average { :self |
		self.mean
	}

	centralMoment { :self :r |
		let mean = self.mean;
		(1 / self.size) * ((self - mean) ^ r).sum
	}

	contraharmonicMean { :self |
		self.squared.sum / self.sum
	}

	geometricMean { :self |
		self.product ^ (1 / self.size)
	}

	harmonicMean { :self |
		self.size / self.reciprocal.sum
	}

	interquartileRange { :self :a :b :c :d |
		let [q1, q2, q3] = self.quartiles(a, b, c, d);
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
				self.transposed.collect(kurtosis:/1)
			} {
				'@Collection>>kurtosis: not vector or matrix'.error
			}
		}
	}

	mean { :self |
		self.sum / self.size
	}

	meanDeviation { :self |
		(self - self.mean).abs.sum / self.size
	}

	moment { :self :r |
		(1 / self.size) * (self ^ r).sum
	}

	quantile { :self :p :a :b :c :d |
		self.isVector.if {
			self.asSortedList.quantile(p, a, b, c, d)
		} {
			self.isMatrix.if {
				self.transposed.collect { :each |
					each.asSortedList.quantile(p, a, b, c, d)
				}
			} {
				'Collection>>quantile: not vector or matrix'
			}
		}
	}

	quantile { :self :p |
		self.quantile(p, 0, 0, 1, 0)
	}

	quartiles { :self :a :b :c :d |
		self.quantile([1 2 3] / 4, a, b, c, d)
	}

	quartiles { :self |
		self.quartiles(1 / 2, 0, 0, 1)
	}

	sampleStandardDeviation { :self |
		(self - self.mean).squared.mean.sqrt
	}

	sampleVariance { :self |
		((self - self.mean) ^ 2).sum / self.size
	}

	skewness { :self |
		self.isVector.if {
			self.centralMoment(3) / (self.centralMoment(2) ^ (3 / 2))
		} {
			self.isMatrix.if {
				self.transposed.collect(skewness:/1)
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

	variance { :self |
		((self - self.mean) ^ 2).sum / (self.size - 1)
	}

}

+@Sequenceable {

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

	covariance { :v :w |
		v.isMatrix.if {
			v.matrixCovariance(w)
		} {
			let n = v.size;
			let m = w.size;
			(n = m).if {
				(1 / (n - 1)) * (v - v.mean).dot((w - w.mean).conjugated)
			} {
				[v, w].error('@Sequenceable>>covariance: vectors must be equal')
			}
		}
	}

	median { :self |
		self.asSortedList.median
	}

	standardDeviation { :self |
		self.isMatrix.if {
			self.transposed.collect { :each |
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
			self.transposed.collect(variance:/1)
		} {
			((self - self.mean) ^ 2).sum / (self.size - 1)
		}
	}

}

+List {

	nadarayaWatsonEstimator { :i :x :y :h :k:/1 |
		let kx = x.collect { :each |
			((i - each) / h).collect(k:/1) / h
		}.transposed;
		let w = kx / kx.collect(sum:/1);
		w.dot(y)
	}

}
