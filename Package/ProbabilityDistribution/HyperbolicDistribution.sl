HyperbolicDistribution : [Object, Equatable, ProbabilityDistribution] { | alpha beta delta mu |

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let delta = self.delta;
		let mu = self.mu;
		let p = (alpha.square - beta.square).sqrt;
		let q = 2 * alpha * delta * besselK(1, p * delta);
		{ :x |
			let b = beta * (x - mu);
			let a = alpha * (delta.square + (x - mu).square).sqrt;
			(b - a).exp * p / q
		}
	}

}

+SmallFloat {

	HyperbolicDistribution { :alpha :beta :delta :mu |
		newHyperbolicDistribution().initializeSlots(alpha, beta, delta, mu)
	}

}
