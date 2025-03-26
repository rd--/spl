CoxIngersollRossProcess : [Object] { | mu sigma theta x0 |

	randomFunction { :self :r :t :n |
		let mu = self.mu;
		let sigma = self.sigma;
		let theta = self.theta;
		let x0 = self.x0;
		let a = { :y :t | sigma * (mu - y) };
		let b = { :y :t | sigma * y.sqrt };
		TemporalData(
			{
				r.eulerMaruyamaMethod(a:/2, b:/2, t, x0).transposed
			} ! n
		)
	}

}

+SmallFloat {

	CoxIngersollRossProcess { :mu :sigma :theta :x0 |
		newCoxIngersollRossProcess().initializeSlots(mu, sigma, theta, x0)
	}

}
