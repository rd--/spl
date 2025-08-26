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
				r.eulerMaruyamaMethod(a:/2, b:/2, t, x0).transpose
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
