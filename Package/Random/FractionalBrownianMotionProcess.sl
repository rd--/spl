FractionalBrownianMotionProcess : [Object] { | mu sigma h |

	randomFunction { :self :r :t :n |
		r.hoskingMethodRandomFunction(self.h, true, t, n)
	}

}

+SmallFloat {

	FractionalBrownianMotionProcess { :h |
		newFractionalBrownianMotionProcess().initializeSlots(0, 1, h)
	}

}

+SmallFloat {

	basicHoskingMethod { :n :h :l :cum :snorm |
		<primitive:
		/* https://www.columbia.edu/~ad3217/fbm.html */
		function covariance(i, h) {
			if (i == 0) {
				return 1;
			}
			return (Math.pow(i - 1, 2 * h) - (2 * Math.pow(i, 2 * h)) + Math.pow(i + 1, 2 * h)) / 2;
		};
		const n = _n;
		const h = _h;
		const l = _l;
		const cum = _cum;
		const snorm = _snorm;
		const m = Math.pow(2, n);
		const phi = new Array(m);
		const psi = new Array(m);
		const cov = new Array(m);
		const output = new Array(m);
		output[0] = snorm();
		let v = 1;
		phi[0] = 0;
		for (let i = 0; i < m; i++) {
			cov[i] = covariance(i, h);
		}
		for (let i = 1; i < m; i++) {
			phi[i-1] = cov[i];
			for (let j = 0; j < i - 1; j++) {
				psi[j] = phi[j];
				phi[i - 1] -= psi[j] * cov[i - j - 1];
			}
			phi[i - 1] /= v;
			for (let j = 0; j < i - 1; j++) {
				phi[j] = psi[j] - (phi[i - 1] * psi[i - j - 2]);
			}
			v *= 1 - (phi[i - 1] * phi[i - 1]);
			output[i] = 0;
			for (let j = 0; j < i; j++) {
				output[i] += phi[j] * output[i - j - 1];
			}
			output[i] += Math.sqrt(v) * snorm();
		}
		const scaling = Math.pow(l / m, h);
		for(let i = 0; i < m; i++) {
			output[i] = scaling * output[i];
			if (cum === 1 && i > 0) {
				output[i] += output[i - 1];
			}
		};
		return output;
		>
	}

}

+@RandomNumberGenerator {

	hoskingMethod { :self :t :m :h :k |
		m.basicHoskingMethod(h, t, k.boole, { self.normalDistribution(0, 1) })
	}

	hoskingMethodRandomFunction { :self :h :k :t :n |
		let [tMin, tMax, dt] = t;
		let timeList = [tMin, tMin + dt .. tMax];
		let l = timeList.size;
		let m = l.nextPowerOfTwo.log(2);
		TemporalData(
			{
				[
					timeList,
					self.hoskingMethod(tMax - tMin, m, h, k).take(l)
				].transpose
			} ! n
		)
	}

}
