MultinormalDistribution : [Object, Storeable] { | mu sigma |

	randomVariate { :self :r :shape |
		let mu = self.mu;
		let sigma = self.sigma;
		let k = mu.size;
		let n = NormalDistribution(0, 1);
		let c = sigma.choleskyDecomposition;
		{
			let t = n.randomVariate(r, [k]);
			let z = List(k, 0);
			1.toDo(k) { :i |
				1.toDo(i) { :j |
					z[i] := z[i] + (c[i][j] * t[j])
				};
				z[i] := z[i] + mu[i]
			};
			z
		} ! shape
	}

}

+List {

	BinormalDistribution { :mu :sigma :rho |
		let [i, j] = sigma;
		MultinormalDistribution(
			mu,
			[
				[i * i, rho * i * j],
				[rho * i * j, j * j]
			]
		)
	}

	MultinormalDistribution { :mu :sigma |
		newMultinormalDistribution().initializeSlots(mu, sigma)
	}

}
