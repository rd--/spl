FractionalGaussianNoiseProcess : [Object] {

	| mu sigma h | <Float>

	randomFunction { :self :r :t :n |
		r.hoskingMethodRandomFunction(self.h, false, t, n)
	}

}

+Float {

	FractionalGaussianNoiseProcess { :h |
		uncheckedFractionalGaussianNoiseProcess(0.0, 1.0, h)
	}

}
