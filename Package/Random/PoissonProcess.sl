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
