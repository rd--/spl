WeightedData : [Object] { | inputData weights |

	mean { :self |
		let x = self.inputData;
		let w = self.weights;
		(x * w).sum / w.sum
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

	WeightedData { :x :w |
		newWeightedData().initializeSlots(x, w)
	}

}
