WeightedData : [Object] { | inputData weights |

	mean { :self |
		let x = self.inputData;
		let w = self.weights;
		(x * w).sum / w.sum
	}

	median { :self |
		let x = self.inputData;
		let w = self.weights;
		let k = x.size;
		let wH = w.sum / 2;
		let o = x.ordering(<=);
		let xO = x.atAll(o);
		let wO = w.atAll(o);
		let z = wO.prefixSum;
		let i = z.detectIndex { :each | each >= wH };
		xO[i] /* no interpolation */
	}

	rootMeanSquare { :self |
		let x = self.inputData;
		let w = self.weights;
		((x.squared * w) / w.sum).sum.sqrt
	}

	sampleVariance { :self |
		let x = self.inputData;
		let w = self.weights;
		let mu = self.mean;
		(w * ((x - mu) ^ 2)).sum / w.sum
	}

	standardDeviation { :self |
		self.variance.sqrt
	}

	variance { :self |
		let x = self.inputData;
		let w = self.weights;
		let wSum = w.sum;
		let v = w.squared.sum;
		let n = x.size;
		let mu = self.mean;
		(wSum / (wSum.squared - v)) * (w * ((x - mu) ^ 2)).sum
	}


}

+List {

	WeightedData { :x :wSpecifier |
		let w = wSpecifier.isBlock.if {
			x.collect(wSpecifier)
		} {
			wSpecifier
		};
		newWeightedData().initializeSlots(x, w)
	}

}
