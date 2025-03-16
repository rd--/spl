BernoulliProcess : [Object] { | p |

	nextRandom { :self :randomNumberGenerator |
		(randomNumberGenerator.nextRandomFloat < self.p).boole
	}

	reset { :self |
		self
	}

}

+SmallFloat {

	BernoulliProcess { :p |
		newBernoulliProcess().initializeSlots(p)
	}

}

DiscreteMarkovProcess : [Object] { | p0 m x |

	nextRandom { :self :randomNumberGenerator |
		let c = self.x.ifNil {
			self.x := self.p0
		} {
			self.x := self.m[self.x]
		};
		self.x := c.nextRandom(randomNumberGenerator);
		self.x
	}

	reset { :self |
		self.x := nil
	}

}

+List {

	DiscreteMarkovProcess { :p0 :m |
		newDiscreteMarkovProcess().initializeSlots(
			AliasMethod(p0),
			m.collect(AliasMethod:/1),
			nil
		)
	}

}

RandomWalkProcess : [Object] { | p q x |

	nextRandom { :self :randomNumberGenerator |
		let u = randomNumberGenerator.nextRandomFloat;
		let x = self.x;
		let p = self.p;
		let q = self.q;
		(u < p).if {
			self.x := x + 1
		} {
			(u < (p + q)).ifTrue {
				self.x := x - 1
			}
		};
		self.x
	}

	reset { :self |
		self.x := 0
	}

}

+SmallFloat {

	RandomWalkProcess { :p :q |
		newRandomWalkProcess().initializeSlots(p, q, 0)
	}

}

WienerProcess : [Object] { | mu sigma x |

	nextRandom { :self :randomNumberGenerator |
		let answer = self.x + randomNumberGenerator.nextRandomFloatGaussianDistribution(self.mu, self.sigma);
		self.x := answer;
		answer
	}

	reset { :self |
		self.x := self.mu
	}

}

+SmallFloat {

	WienerProcess { :mu :sigma |
		newWienerProcess().initializeSlots(mu, sigma, mu)
	}

}

+@RandomNumberGenerator {

	randomFunction { :self :process :timeSpecification :count |
		let [tMin, tMax, tStep] = timeSpecification;
		TemporalData(
			(1 .. count).collect { :unused |
				process.reset;
				(tMin, tMin + tStep .. tMax).collect { :t |
					[t, process.nextRandom(self)]
				}
			}
		)
	}

}
