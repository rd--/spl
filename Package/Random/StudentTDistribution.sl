+@RandomNumberGenerator {

	studentTDistribution { :self :mu :sigma :nu |
		let gamma = self.gammaDistribution(0.5 * nu, 0.5);
		self.normalDistribution(
			mu,
			sigma * (nu / gamma).sqrt
		)
	}

}

StudentTDistribution : [Object, ProbabilityDistribution] { | mu sigma nu |

	cdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		let nu = self.nu;
		{ :x |
			let a = sigma.square * nu;
			let b = (x - mu).square;
			let t = a / (a + b);
			let r = (1 / 2) * t.betaRegularized(nu / 2, 1 / 2);
			(x <= mu).if {
				r
			} {
				1 - r
			}
		}
	}

	mean { :self |
		(self.nu > 1).if {
			self.mu
		} {
			NaN
		}
	}

	median { :self |
		self.mu
	}

	mode { :self |
		self.mu
	}

	pdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		let nu = self.nu;
		{ :x |
			let d = (x - mu).square / sigma.square;
			((nu / (d + nu)) ^ ((nu + 1) / 2))
			/
			(sigma * nu.sqrt * (nu / 2).beta(1 / 2))
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let sigma = self.sigma;
		let nu = self.nu;
		{
			rng.studentTDistribution(mu, sigma, nu)
		} ! shape
	}

	skewness { :self |
		(self.nu > 3).if {
			0
		} {
			NaN
		}
	}

	variance { :self |
		let nu = self.nu;
		(nu > 2).if {
			nu / (nu - 2)
		} {
			(nu > 1).if {
				Infinity
			} {
				NaN
			}
		}
	}

}

+[SmallFloat, Symbol] {

	StudentTDistribution { :mu :sigma :nu |
		newStudentTDistribution().initializeSlots(mu, sigma, nu)
	}

}
