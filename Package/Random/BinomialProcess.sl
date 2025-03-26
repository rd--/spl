BinomialProcess : [Object] { | p |

	asStream { :self :r |
		let p = self.p;
		let x = 0;
		BlockStream {
			x := x + (r.nextRandomFloat < p).boole
		} {
			x := 0
		}
	}

	randomFunction { :self :r :t :n |
		self.asStream(r).valueSeriesRandomFunction(t, n)
	}

}

+SmallFloat {

	BinomialProcess { :p |
		newBinomialProcess().initializeSlots(p)
	}

}
