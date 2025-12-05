TelegraphProcess : [Object] { | mu |

	randomFunction { :self :r :t :n |
		let mu = self.mu;
		let [tMin, tMax, dt] = t;
		let ts = [tMin, tMin + dt .. tMax];
		let k = ts.size;
		TemporalData(
			{
				let a = 1;
				let e = r.exponentialDistribution(mu);
				[
					ts,
					ts.collect { :t |
						(t >= e).ifTrue {
							a := a.negate;
							e := e + r.exponentialDistribution(mu)
						};
						a
					}
				].transpose
			} ! n
		)
	}

}

+SmallFloat {

	TelegraphProcess { :mu |
		newTelegraphProcess().initializeSlots(mu)
	}

}
