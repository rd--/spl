BernoulliProcess : [Object] { | p |

	randomFunction { :self :r :t :n |
		self.Stream(r).valueSeriesRandomFunction(t, n)
	}

	Stream { :self :r |
		let p = self.p;
		BlockStream {
			(r.nextRandomFloat < p).boole
		} {
		}
	}

}

+SmallFloat {

	BernoulliProcess { :p |
		newBernoulliProcess().initializeSlots(p)
	}

}
