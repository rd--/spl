FractionalGaussianNoiseProcess : [Object] {

	| mu sigma h |

	randomFunction { :self :r :t :n |
		r.hoskingMethodRandomFunction(self.h, false, t, n)
	}

}

+Float {

	FractionalGaussianNoiseProcess { :h |
		newFractionalGaussianNoiseProcess().initializeSlots(0, 1, h)
	}

}
