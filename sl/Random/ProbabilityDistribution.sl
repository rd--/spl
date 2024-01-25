{- https://github.com/supercollider/sc3-plugins/blob/main/source/LoopBufUGens/sc/classes/LJP%20Classes/ProbabilityDistributions.sc -}

+@Number {

	randomFloatEularianBetaDistribution { :x1 :x2 :p1 :p2 |
		let p1r = 1 / p1;
		let p2r = 1 / p2;
		let sum = 2;
		let next = nil;
		{
			sum > 1
		}.whileTrue {
			next := 1.randomFloat ^ p1r;
			sum := next + (1.randomFloat ^ p2r)
		};
		((next / sum) * (x2 - x1)) + x1
	}

	randomFloatCauchyDistribution { :mean :spread |
		let r = 0.5;
		{
			r = 0.5
		}.whileTrue {
			r := 1.randomFloat
		};
		spread * (r * pi).tan + mean
	}

	randomFloatGaussianDistribution { :mean :deviation |
		(((-2 * 1.randomFloat.log).sqrt * 2.pi.randomFloat.sin) * deviation) + mean
	}

	randomFloatLinearDistribution { :x1 :x2 |
		let r1 = 1.randomFloat;
		let r2 = 1.randomFloat;
		(r1 < r2).ifTrue {
			r2 := r1
		};
		r2 * (x2 - x1) + x1
	}

	randomFloatLogisticDistribution { :mean :spread |
		let u = 1.randomFloat;
		(u / (1 - u)).log * spread + mean
	}

	randomFloatParetoDistribution { :self :shape |
		(1.randomFloat ^ (-1 / shape)) * self
	}

	randomIntegerPoissonDistribution { :self |
		let k = 0;
		let r = 1.randomFloat;
		let t = self.negated.exp;
		{
			r > t
		}.whileTrue {
			k := k + 1;
			r := r * 1.randomFloat
		};
		k
	}

	randomFloatWeibullDistribution { :location :spread :shape |
		let r = 1;
		{
			r = 1
		}.whileTrue {
			r := 1.randomFloat
		};
		spread * (r.log.negated ^ (1 / shape)) + location
	}

}
