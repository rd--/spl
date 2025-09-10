TelegraphProcess : [Object] { | mu |

	randomFunction { :self :r :t :n |
		let mu = self.mu;
		let [tMin, tMax, dt] = t;
		let ts = [tMin, tMin + dt .. tMax];
		let k = ts.size;
		TemporalData(
			{
				let c = 0;
				let a = 1;
				let e = r.exponentialDistribution(mu);
				[
					ts,
					ts.collect { :t |
						(t >= e).ifTrue {
							c := c + 1;
							a := c.isEven.if { 1 } { -1 };
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
