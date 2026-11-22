CoxIngersollRossProcess : [Object] {

	| mu sigma theta x0 | <Float>

	randomFunction { :self :r :t :n |
		let mu = self.mu;
		let sigma = self.sigma;
		let theta = self.theta;
		let x0 = self.x0;
		let a = { :y :t | sigma * (mu - y) };
		let b = { :y :t | sigma * y.sqrt };
		TemporalData(
			{
				r.eulerMaruyamaMethod(a/2, b/2, t, x0).transpose
			} ! n
		)
	}

}

+Float {

	CoxIngersollRossProcess { :mu :sigma Float :theta Float :x0 Float |
		uncheckedCoxIngersollRossProcess(mu, sigma, theta, x0)
	}

}
