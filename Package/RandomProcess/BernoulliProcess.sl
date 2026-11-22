BernoulliProcess : [Object] {

	| p | <Float>

	Stream { :self :r |
		let p = self.p;
		FunctionStream {
			(r.nextRandomFloat < p).boole
		} {
			nil
		}
	}

	randomFunction { :self :r :t :n |
		self.Stream(r).valueSeriesRandomFunction(t, n)
	}

}

+Float {

	BernoulliProcess { :p |
		uncheckedBernoulliProcess(p)
	}

}
