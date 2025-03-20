BernoulliProcess : [Object] { | p |

	nextRandom { :self :shape :randomNumberGenerator |
		{ (randomNumberGenerator.nextRandomFloat < self.p).boole } ! shape
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

	nextRandom { :self :shape :randomNumberGenerator |
		let p0 = AliasMethod(self.p0);
		let m = self.m.collect(AliasMethod:/1);
		{
			let c = self.x.ifNil {
				p0
			} {
				m[self.x]
			};
			self.x := c.nextRandom(randomNumberGenerator);
			self.x
		} ! shape
	}

	reset { :self |
		self.x := nil
	}

}

+List {

	DiscreteMarkovProcess { :p0 :m |
		newDiscreteMarkovProcess().initializeSlots(p0, m, nil)
	}

}

HiddenMarkovProcess : [Object] { | p0 m e x |

	nextRandom { :self :shape :randomNumberGenerator |
		let p0 = AliasMethod(self.p0);
		let m = self.m.collect(AliasMethod:/1);
		let e = self.e.collect(AliasMethod:/1);
		{
			let c = self.x.ifNil {
				self.p0
			} {
				self.m[self.x]
			};
			self.x := c.nextRandom(randomNumberGenerator);
			self.e[self.x].nextRandom(randomNumberGenerator)
		} ! shape
	}

	reset { :self |
		self.x := nil
	}

	viterbiDecoding { :self :aList |
		let p0 = self.p0;
		let m = self.m;
		let e = self.e;
		let o = aList;
		let t = o.size;
		let s = p0.size;
		let p = zeroMatrix(t, s);
		let z = zeroMatrix(t, s);
		let answer = List(t);
		1.toDo(s) { :i |
			p[1][i] := p0[i] * e[i][o[1]]
		};
		2.toDo(t) { :i |
			1.toDo(s) { :j |
				1.toDo(s) { :k |
					let x = p[i - 1][k] * m[k][j] * e[j][o[i]];
					(x > p[i][j]).ifTrue {
						p[i][j] := x;
						z[i][j] := k
					}
				}
			}
		};
		answer[t] := p[t].indexOf(p[t].max);
		(t - 1).downToDo(1) { :i |
			answer[i] := z[i + 1][answer[i + 1]]
		};
		answer
	}

}

+List {

	HiddenMarkovProcess { :p0 :m :e |
		newHiddenMarkovProcess().initializeSlots(p0, m, e, nil)
	}

}

RandomWalkProcess : [Object] { | p q x |

	nextRandom { :self :shape :randomNumberGenerator |
		let x = self.x;
		let p = self.p;
		let q = self.q;
		{
			let u = randomNumberGenerator.nextRandomFloat;
			(u < p).if {
				self.x := x + 1
			} {
				(u < (p + q)).ifTrue {
					self.x := x - 1
				}
			};
			self.x
		} ! shape
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

	nextRandom { :self :shape :randomNumberGenerator |
		{
			let u = randomNumberGenerator.nextRandomFloatGaussianDistribution(self.mu, self.sigma);
			self.x := self.x + u;
			self.x
		} ! shape
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
		let timeList = [tMin, tMin + tStep .. tMax];
		TemporalData(
			(1 .. count).collect { :unused |
				process.reset;
				[
					timeList,
					process.nextRandom(timeList.size, self)
				].transposed
			}
		)
	}

}
