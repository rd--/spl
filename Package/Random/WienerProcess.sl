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
