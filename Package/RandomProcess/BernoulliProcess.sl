BernoulliProcess : [Object] {

	| p |

	Stream { :self :r |
		let p = self.p;
		BlockStream {
			(r.nextRandomFloat < p).boole
		} {
		}
	}

	randomFunction { :self :r :t :n |
		self.Stream(r).valueSeriesRandomFunction(t, n)
	}

}

+SmallFloat {

	BernoulliProcess { :p |
		newBernoulliProcess().initializeSlots(p)
	}

}
