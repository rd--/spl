+SmallFloat{

	erfAbramowitzStegun { :x |
		(x >= 0).if {
			let p = 0.47047;
			let t = 1 / (1 + (p * x));
			let a1 = 0.3480242 * t;
			let a2 = -0.0958798 * t * t;
			let a3 = 0.7478556 * t * t * t;
			1 - ((a1 + a2 + a3) * x.squared.negated.exp)
		} {
			x.negated.erf.negated
		}
	}

	erf { :x |
		(x >= 0).if {
			let p = 0.3275911;
			let t = 1 / (1 + (p * x));
			let a1 = 0.254829592 * t;
			let a2 = -0.284496736 * t * t;
			let a3 = 1.421413741 * t * t * t;
			let a4 = -1.453152027 * t * t * t * t;
			let a5 = 1.061405429 * t * t * t * t * t;
			1 - ((a1 + a2 + a3 + a4 + a5) * x.squared.negated.exp)
		} {
			x.negated.erf.negated
		}
	}

	erfc { :x |
		1 - x.erf
	}

	fresnel { :x :k :n |
		<primitive:
		let x = _x;
		let n = _n;
		let f = (_k === 'C') ? Math.cos : Math.sin;
		const pi = Math.PI;
		const dx = x / n;
		let sum = 0;
		for (let i = 0; i < n; i++) {
			const t = i * dx;
			const u = (i + 1) * dx;
			sum += (f(pi * (t ** 2) / 2) + f(pi * (u ** 2) / 2)) / 2 * dx;
		}
		return sum;
		>
	}

	fresnelC { :z |
		fresnel(z, 'C', 2000)
	}

	fresnelS { :z |
		fresnel(z, 'S', 2000)
	}

}
