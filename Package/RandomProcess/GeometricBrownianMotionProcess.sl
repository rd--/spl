GeometricBrownianMotionProcess : [Object] { | mu sigma x0 |

	randomFunction { :self :r :t :n |
		let a = { :y | self.mu * y };
		let b = { :y | self.sigma * y };
		let c = { :y | (self.sigma.square / 2) * y };
		TemporalData(
			{
				r.milsteinMethod(a:/1, b:/1, c:/1, t, self.x0).transpose
			} ! n
		)
	}

}

+SmallFloat {

	GeometricBrownianMotionProcess { :mu :sigma :x0 |
		newGeometricBrownianMotionProcess().initializeSlots(mu, sigma, x0)
	}

}
