+@Stream {

	randomFunction { :self :t :n |
		{ :timeList |
			let answer = self.next(timeList.size);
			self.reset;
			answer
		}.regularTemporalData(t ! n)
	}

}

BernoulliProcess : [Object] { | p |

	asStream { :self :r |
		BlockStream {
			(r.nextRandomFloat < self.p).boole
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

HiddenMarkovProcess : [Object] { | p0 m e |

	asStream { :self :r |
		let p0 = AliasMethod(self.p0);
		let m = self.m.collect(AliasMethod:/1);
		let e = self.e.collect(AliasMethod:/1);
		let x = p0.nextRandom(r);
		BlockStream {
			let answer = e[x].nextRandom(r);
			x := m[x].nextRandom(r);
			answer
		} {
			x := p0.nextRandom(r)
		}
	}

	randomFunction { :self :r :t :n |
		self.asStream(r).randomFunction(t, n)
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
		newHiddenMarkovProcess().initializeSlots(p0, m, e)
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
					x0 := r.normalDistribution(self.mu, self.sigma / (2 * self.theta).sqrt)
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
					let i = r.exponentialDistribution(mu);
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

RandomWalkProcess : [Object] { | p q |

	asStream { :self :r |
		let p = self.p;
		let q = self.q;
		let x = 0;
		BlockStream {
			let u = r.nextRandomFloat;
			(u < p).if {
				x := x + 1
			} {
				(u < (p + q)).ifTrue {
					x := x - 1
				}
			};
			x
		} {
			x := 0
		}
	}

	randomFunction { :self :r :t :n |
		self.asStream(r).randomFunction(t, n)
	}

}

+SmallFloat {

	RandomWalkProcess { :p :q |
		newRandomWalkProcess().initializeSlots(p, q)
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
			self.normalDistribution(0, dt.sqrt)
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
			self.normalDistribution(0, dt.sqrt)
		};
		ys[1] := y0;
		2.toDo(n) { :i |
			let y = ys[i - 1];
			let dw = dW(dt);
			ys[i] := y + (a(y) * dt) + (b(y) * dw) + (0.5 * c(y) * (dw.squared - dt))
		};
		[ts, ys]
	}

}

+Block {

	regularTemporalData { :aBlock:/1 :timeSpecificationList |
		TemporalData(
			timeSpecificationList.collect { :timeSpecification |
				let [tMin, tMax, tStep] = (timeSpecification.size = 2).if {
					timeSpecification ++ [1]
				} {
					timeSpecification
				};
				let timeList = [tMin, tMin + tStep .. tMax];
				[
					timeList,
					aBlock(timeList)
				].transposed
			}
		)
	}

}
