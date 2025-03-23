BernoulliProcess : [Object] { | p |

	nextRandom { :self :shape :randomNumberGenerator |
		{ (randomNumberGenerator.nextRandomFloat < self.p).boole } ! shape
	}

	randomFunction { :self :r :t :n |
		let [tMin, tMax] = t;
		r.randomFunction(self, [tMin, tMax, 1], n)
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

ContinuousMarkovProcess : [Object] { | p0 q |

	initialProbabilities { :self |
		self.p0
	}

	holdingTimeMean { :self |
		1 / self.transitionRateVector
	}

	transitionMatrix { :self |
		let q = self.q;
		let [m, n] = q.shape;
		let t = zeroMatrix(m, n);
		1:m.do { :i |
			let h = q[i][i].abs;
			let r = (h = 0).if { 0 } { 1 / h };
			1:n.do { :j |
				(i ~= j).ifTrue {
					t[i][j] := q[i][j] * r
				}
			};
			t[i][i] := (1 - t[i].sum).abs
		};
		t
	}

	transitionRateVector { :self |
		self.q.diagonal.abs
	}

}

+List {

	ContinuousMarkovProcess { :p0 :q |
		newContinuousMarkovProcess().initializeSlots(p0, q)
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

	randomFunction { :self :r :t :n |
		let [tMin, tMax] = t;
		r.randomFunction(self, [tMin, tMax, 1], n)
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

GeometricBrownianMotionProcess : [Object] { | mu sigma x0 |

	randomFunction { :self :r :t :n |
		let a = { :y | self.mu * y };
		let b = { :y | self.sigma * y };
		let c = { :y | (self.sigma.squared / 2) * y };
		TemporalData(
			{
				r.milsteinMethod(a:/1, b:/1, c:/1, t, self.x0).transposed
			} ! n
		)
	}

}

+SmallFloat {

	GeometricBrownianMotionProcess { :mu :sigma :x0 |
		newGeometricBrownianMotionProcess().initializeSlots(mu, sigma, x0)
	}

}

HiddenMarkovProcess : [Object] { | p0 m e x |

	nextRandom { :self :shape :randomNumberGenerator |
		let p0 = AliasMethod(self.p0);
		let m = self.m.collect(AliasMethod:/1);
		let e = self.e.collect(AliasMethod:/1);
		{
			let c = self.x.ifNil {
				p0
			} {
				m[self.x]
			};
			self.x := c.nextRandom(randomNumberGenerator);
			e[self.x].nextRandom(randomNumberGenerator)
		} ! shape
	}

	randomFunction { :self :r :t :n |
		let [tMin, tMax] = t;
		r.randomFunction(self, [tMin, tMax, 1], n)
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

OrnsteinUhlenbeckProcess : [Object] { | mu sigma theta x0 |

	randomFunction { :self :r :t :n |
		let a = { :y :t |
			self.theta * (self.mu - y)
		};
		let b = { :y :t |
			self.sigma
		};
		TemporalData(
			{
				let x0 = self.x0;
				x0.ifNil {
					'x0=Nil'.postLine;
					x0 := r.nextRandomFloatGaussianDistribution(self.mu, self.sigma / (2 * self.theta).sqrt)
				};
				r.eulerMaruyamaMethod(a:/2, b:/2, t, x0).transposed
			} ! n
		)
	}

}

+SmallFloat {

	OrnsteinUhlenbeckProcess { :mu :sigma :theta |
		newOrnsteinUhlenbeckProcess().initializeSlots(mu, sigma, theta, nil)
	}

	OrnsteinUhlenbeckProcess { :mu :sigma :theta :x0 |
		newOrnsteinUhlenbeckProcess().initializeSlots(mu, sigma, theta, x0)
	}

}

PoissonProcess : [Object] { | mu |

	randomFunction { :self :r :t :n |
		let [tMin, tMax] = t;
		let mu = self.mu;
		TemporalData(
			{
				let t = tMin;
				let k = 0;
				let l = [[t, k]];
				{
					let i = r.nextRandomFloatExponentialDistribution(mu);
					t := t + i;
					(t <= tMax).if {
						k := k + 1;
						l.add([t, k]);
						true
					} {
						false
					}
				}.whileTrue;
				l
			} ! n
		)
	}

}

+SmallFloat {

	PoissonProcess { :mu |
		newPoissonProcess().initializeSlots(mu)
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

WienerProcess : [Object] { | mu sigma |

	randomFunction { :self :r :t :n |
		let mu = self.mu;
		let sigma = self.sigma;
		let a = { :y :t | mu };
		let b = { :y :t | sigma };
		TemporalData(
			{
				r.eulerMaruyamaMethod(a:/2, b:/2, t, 0).transposed
			} ! n
		)
	}

}

+SmallFloat {

	WienerProcess { :mu :sigma |
		newWienerProcess().initializeSlots(mu, sigma)
	}

}

+@RandomNumberGenerator {

	eulerMaruyamaMethod { :self :a:/2 :b:/2 :t :y0 |
		let [tMin, tMax, dt] = t;
		let ts = [tMin, tMin + dt .. tMax];
		let n = ts.size;
		let ys = List(n, 0);
		let dW = { :dt |
			self.nextRandomFloatGaussianDistribution(0, dt.sqrt)
		};
		ys[1] := y0;
		2.toDo(n) { :i |
			let t = ts[i - 1];
			let y = ys[i - 1];
			ys[i] := y + (a(y, t) * dt) + (b(y, t) * dW(dt))
		};
		[ts, ys]
	}

	milsteinMethod { :self :a:/1 :b:/1 :c:/1 :t :y0 |
		let [tMin, tMax, dt] = t;
		let ts = [tMin, tMin + dt .. tMax];
		let n = ts.size;
		let ys = List(n, 0);
		let dW = { :dt |
			self.nextRandomFloatGaussianDistribution(0, dt.sqrt)
		};
		ys[1] := y0;
		2.toDo(n) { :i |
			let y = ys[i - 1];
			let dw = dW(dt);
			ys[i] := y + (a(y) * dt) + (b(y) * dw) + (0.5 * c(y) * (dw.squared - dt))
		};
		[ts, ys]
	}

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
