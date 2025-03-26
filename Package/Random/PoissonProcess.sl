PoissonProcess : [Object] { | mu |

	asStream { :self :r :t0 |
		let mu = self.mu;
		let t = t0;
		let k = 0;
		BlockStream {
			let answer = [t, k];
			t := t + r.exponentialDistribution(mu);
			k := k + 1;
			answer
		} {
			t := t0;
			k := 0
		}
	}

	randomFunction { :self :r :t :n |
		let [tMin, tMax] = t;
		self.asStream(r, tMin).timeSeriesRandomFunction(t, n)
	}

}

+SmallFloat {

	PoissonProcess { :mu |
		newPoissonProcess().initializeSlots(mu)
	}

}
