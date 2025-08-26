+@RandomNumberGenerator {

	katoYamasakiAlgorithm { :self :u :m |
		let [umin, umax, targetUtil] = u;
		let sets = [];
		m.timesRepeat {
			let taskSet = [];
			let totalUtil = 0;
			{
				totalUtil < targetUtil
			}.whileTrue {
				let z = self.nextRandomFloat(umin, umax);
				((z + totalUtil) > targetUtil).ifTrue {
					z := targetUtil - totalUtil
				};
				totalUtil := totalUtil + z;
				taskSet.add(z)
			};
			sets.add(taskSet)
		};
		sets
	}

	randomRealFixedSum { :self :u :shape |
		let k = shape.allButLast;
		let m = k.product;
		let n = shape.last;
		self.staffordsAlgorithm(n, u, m).reshapeList(k)
	}

	staffordsAlgorithm { :self :n :u :nsets |
		/* https://github.com/jlelli/taskgen/ */
		let range = { :i :j :k | Range(i, j - k, k).asList };
		let k = (u.floor, n - 1).min;
		let s1 = u - range(k, k - n, -1);
		let s2 = range(k + n, k, -1) - u;
		let tiny = 1.smallFloatEpsilon;
		let huge = 1.smallFloatMax;
		let w = [n, n + 1].zeroMatrix;
		let t = [n - 1, n].zeroMatrix;
		let m = nsets;
		let x = [n, m].zeroMatrix;
		let rt = self.randomReal([0 1], [n - 1, m]);
		let rs = self.randomReal([0 1], [n - 1, m]);
		let j = (k + 1) # m;
		let sm = 0 # m;
		let pr = 1 # m;
		let s = u # m;
		w[1][2] := huge;
		range(2, n + 1, 1).do { :i |
			let t1 = w.at(i - 2 + 1).atAll(range(1, i + 1, 1) + 1) * s1.atAll(range(0, i, 1) + 1) / i;
			let t2 = w.at(i - 2 + 1).atAll(range(0, i, 1) + 1) * s2.atAll(range(n - i, n, 1) + 1) / i;
			let t3 = t1 + t2 + tiny;
			let t4 = (s2.atAll(range(n - i, n, 1) + 1) > s1.atAll(range(0, i, 1) + 1)).boole;
			let t5 = ((t2 / t3) * t4) + ((1 - (t1 / t3)) * (1 - t4));
			w.at(i - 1 + 1).atAllPutAll(range(1, i + 1, 1) + 1, t1 + t2);
			t.at(i - 2 + 1).atAllPutAll(range(0, i, 1) + 1, t5)
		};
		range(n - 1, 0, -1).do { :i |
			let e = (rt.at((n - i) - 1 + 1) <= t.at(i - 1 + 1).atAll(j - 1 + 1)).boole;
			let sx = rs.at((n - i) - 1 + 1) ^ (1 / i);
			sm := sm + ((1 - sx) * pr * (s / (i + 1)));
			pr := sx * pr;
			x.atPut((n - i) - 1 + 1, sm + (pr * e));
			s := s - e;
			j := j - e
		};
		x.atPut(n - 1 + 1, sm + (pr * s));
		x.transpose.collect { :each |
			each.shuffle(self)
		}
	}

	uUnifastAlgorithm { :self :n :u |
		let utilizations = List(n);
		let sumU = u;
		1.toDo(n - 1) { :i |
			let z = self.nextRandomFloat;
			let nextSumU = sumU * (z ^ (1 / (n - i)));
			utilizations[i] := sumU - nextSumU;
			sumU := nextSumU
		};
		utilizations[n] := sumU;
		utilizations
	}

	uUnifastDiscardAlgorithm { :self :n :u :m |
		let sets = [];
		{
			sets.size < m
		}.whileTrue {
			let utilizations = [];
			let sumU = u;
			1.toDo(n - 1) { :i |
				let z = self.nextRandomFloat;
				let nextSumU = sumU * (z ^ (1 / (n - i)));
				utilizations.add(sumU - nextSumU);
				sumU := nextSumU
			};
			utilizations.add(sumU);
			utilizations.allSatisfy { :each |
				each <= 1
			}.ifTrue {
				sets.add(utilizations)
			}
		};
		sets
	}

}
