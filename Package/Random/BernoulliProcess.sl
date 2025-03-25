BernoulliProcess : [Object] { | p |

	asStream { :self :r |
		let p = self.p;
		BlockStream {
			(r.nextRandomFloat < p).boole
		} {
		}
	}

	randomFunction { :self :r :t :n |
		self.asStream(r).randomFunction(t, n)
	}

}

+SmallFloat {

	BernoulliProcess { :p |
		newBernoulliProcess().initializeSlots(p)
	}

}
