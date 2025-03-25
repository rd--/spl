DiscreteMarkovProcess : [Object] { | p0 m |

	asStream { :self :r |
		let p0 = AliasMethod(self.p0);
		let m = self.m.collect(AliasMethod:/1);
		let x = p0.nextRandom(r);
		BlockStream {
			let h = x;
			x := m[x].nextRandom(r);
			h
		} {
			x := p0.nextRandom(r)
		}
	}

	randomFunction { :self :r :t :n |
		self.asStream(r).randomFunction(t, n)
	}

}

+List {

	DiscreteMarkovProcess { :p0 :m |
		newDiscreteMarkovProcess().initializeSlots(p0, m)
	}

}
