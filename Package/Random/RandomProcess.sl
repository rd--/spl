BernoulliProcess : [Object] { | p |

	reset { :self |
		self
	}

	nextRandom { :self :randomNumberGenerator |
		(randomNumberGenerator.nextRandomFloat < self.p).boole
	}

}

WienerProcess : [Object] { | mu sigma x |

	reset { :self |
		self.x := self.mu
	}

	nextRandom { :self :randomNumberGenerator |
		let answer = self.x + randomNumberGenerator.nextRandomFloatGaussianDistribution(self.mu, self.sigma);
		self.x := answer;
		answer
	}

}

+SmallFloat {

	BernoulliProcess { :p |
		newBernoulliProcess().initializeSlots(p)
	}

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
