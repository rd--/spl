+List {

	ncsToRgb { :self |
		/* https://github.com/m90/ncs-color/ */
		<primitive:
		let Sn = _self[0];
		let Cn = _self[1];
		let C1 = _self[2];
		let N = _self[3];
		if (C1 !== 'N') {
			const S = (1.05 * Sn - 5.25);
			const C = Cn;
			let Ra = nil, Ba = nil, Ga = nil;
			if (C1 === 'Y' && N <= 60) {
				Ra = 1
			} else if ((C1 === 'Y' && N > 60) || (C1 === 'R' && N <= 80)) {
				const x = (C1 === 'Y') ? N - 60 : N + 40;
				Ra = ((Math.sqrt(14884 - Math.pow(x, 2))) - 22) / 100;
			} else if ((C1 === 'R' && N > 80) || (C1 === 'B')) {
				Ra = 0;
			} else if (C1 === 'G') {
				const x = (N - 170);
				Ra = ((Math.sqrt(33800 - Math.pow(x, 2))) - 70) / 100;
			}
			if (C1 === 'Y' && N <= 80) {
				Ba = 0;
			} else if ((C1 === 'Y' && N > 80) || (C1 === 'R' && N <= 60)) {
				const x = (C1 === 'Y') ? (N - 80) + 20.5 : (N + 20) + 20.5;
				Ba = (104 - (Math.sqrt(11236 - Math.pow(x, 2)))) / 100;
			} else if ((C1 === 'R' && N > 60) || (C1 === 'B' && N <= 80)) {
				const x = (C1 === 'R') ? (N - 60) - 60 : (N + 40) - 60;
				Ba = ((Math.sqrt(10000 - Math.pow(x, 2))) - 10) / 100;
			} else if ((C1 === 'B' && N > 80) || (C1 === 'G' && N <= 40)) {
				const x = (C1 === 'B') ? (N - 80) - 131 : (N + 20) - 131;
				Ba = (122 - (Math.sqrt(19881 - Math.pow(x, 2)))) / 100;
			} else if (C1 === 'G' && N > 40) {
				Ba = 0;
			}
			if (C1 === 'Y') {
				Ga = (85 - 17 / 20 * N) / 100;
			} else if (C1 === 'R' && N <= 60) {
				Ga = 0;
			} else if (C1 === 'R' && N > 60) {
				const x = (N - 60) + 35;
				Ga = (67.5 - (Math.sqrt(5776 - Math.pow(x, 2)))) / 100;
			} else if (C1 === 'B' && N <= 60) {
				const x = (1 * N - 68.5);
				Ga = (6.5 + (Math.sqrt(7044.5 - Math.pow(x, 2)))) / 100;
			} else if ((C1 === 'B' && N > 60) || (C1 === 'G' && N <= 60)) {
				Ga = 0.9;
			} else if (C1 === 'G' && N > 60) {
				const x = (N - 60);
				Ga = (90 - (1 / 8 * x)) / 100;
			}
			const x = (Ra + Ga + Ba) / 3;
			const Rc = ((x - Ra) * (100 - C) / 100) + Ra;
			const Gc = ((x - Ga) * (100 - C) / 100) + Ga;
			const Bc = ((x - Ba) * (100 - C) / 100) + Ba;
			const ss = 1 / Math.max(Rc, Gc, Bc);
			return [
				(Rc * ss * (100 - S) / 100),
				(Gc * ss * (100 - S) / 100),
				(Bc * ss * (100 - S) / 100)
			]
		} else {
			const v = 1 - (Sn / 100);
			return [v, v, v];
		}
		>
	}

	NcsColour { :self |
		RgbColour(self.ncsToRgb, 1)
	}

}

+String {

	NcsColour { :self |
		NcsColour(self.parseNcs)
	}

	parseNcs { :self |
		/* https://github.com/m90/ncs-color/ */
		<primitive:
		const ncsRe = /^(?:NCS|NCS\sS)\s(\d{2})(\d{2})-(N|R|G|B|Y)(\d{2})?(R|G|B|Y)?$/;
		let ncs = _self.trim().toUpperCase().match(ncsRe);
		return [
			parseInt(ncs[1], 10),
			parseInt(ncs[2], 10),
			ncs[3],
			parseInt(ncs[4], 10) || 0,
			ncs[5]
		];
		>
	}

}
