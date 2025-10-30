+@Number {

	ampersandCurve { :t |
		let r =
		(1 / 4)
		*
		(
			(10 * (cos(t) ^ 3))
			+
			(11 * cos(t))
			+
			((-3 * ((21 * (cos(t) ^ 2)) - 16) * (((2 * (cos(t) ^ 2)) - 1) ^ 2)) ^ (1 / 2))
		)
		/
		((2 * (cos(t) ^ 4)) - (cos(t) ^ 2) + 2);
		r.isComplex.if {
			nil
		} {
			[r, t].fromPolarCoordinates
		}
	}

	archimedeanSpiral { :a :n |
		{ :theta |
			let r = a * (theta ^ (1 / n));
			[r, theta].fromPolarCoordinates
		}
	}

	bicorn { :a |
		{ :t |
			let x = a * t.sin;
			let y = (a * t.cos.square * (2 + t.cos)) / (3 + t.sin.square);
			[x, y]
		}
	}

	bifoliate { :a |
		{ :theta |
			let r = a * ((8 * theta.cos * theta.sin.square) / (3 + (4 * theta).cos));
			[r, theta].fromPolarCoordinates
		}
	}

	bifolium { :a |
		{ :theta |
			let r = 4 * a * theta.sin.square * theta.cos;
			[r, theta].fromPolarCoordinates
		}
	}

	botanicCurve { :c :d |
		{ :theta |
			let r = 1 + (d * (c * theta).sin);
			[r, theta].fromPolarCoordinates
		}
	}

	butterflyCurve { :t |
		let a = t.cos.exp;
		let b = 2 * (4 * t).cos;
		let c = (t / 12).sin ^ 5;
		[t.sin, t.cos] * (a - b - c)
	}

	catenaryCurve { :a |
		catenaryCurve(a, a)
	}

	catenaryCurve { :a :b |
		{ :theta |
			[
				theta,
				b * (theta / a).cosh
			]
		}
	}

	cayleysSextic { :t |
		let a = t.cos.cube;
		let x = a * (3 * t).cos;
		let y = a * (3 * t).sin;
		[x, y]
	}

	cissoidOfDiocles { :a |
		{ :theta |
			let t = theta.tan;
			let x = 2 * a * (t ^ 2) / (1 + (t ^ 2));
			let y = t * x;
			[x, y]
		}
	}

	cleliaCurve { :r :c |
		{ :theta |
			[
				r * theta.cos * (c * theta).cos,
				r * theta.cos * (c * theta).sin,
				r * theta.sin
			]
		}
	}

	cochleoid { :a |
		{ :theta |
			(theta = 0).if {
				[1, 0]
			} {
				let r = (a * theta.sin) / theta;
				[r, theta].fromPolarCoordinates
			}
		}
	}

	conchoidOfDeSluze { :a |
		{ :t |
			let r = t.sec + (a * t.cos);
			[r, t].fromPolarCoordinates
		}
	}

	conchoidOfDurer { :a :b |
		{ :t |
			let x = ((b * t.cos) / (t.cos - t.sin)) + (a * t.cos);
			let y = a * t.sin;
			[x, y]
		}
	}

	cycloid { :r |
		{ :t |
			[
				r * (t - t.sin),
				r * (1 - t.cos)
			]
		}
	}

	epicycloid { :a :b |
		epitrochoid(a, b, b)
	}

	epitrochoid { :a :b :h |
		{ :theta |
			let p = a + b;
			let q = p / b;
			[
				(p * theta.cos) - (h * (q * theta).cos),
				(p * theta.sin) - (h * (q * theta).sin)
			]
		}
	}

	eulerSpiral { :theta |
		[theta.fresnelC, theta.fresnelS]
	}

	fernandezGuastiSquircle { :r :s |
		{ :theta |
			let a = r * 2.sqrt;
			let b = s * (2 * theta).sin.abs;
			let rho = b.isVeryCloseTo(0).if {
				r
			} {
				let c = (1 - (s.square * (2 * theta).sin.square)).sqrt;
				let d = (1 - c).sqrt;
				(a / b) * d
			};
			[rho theta].fromPolarCoordinates
		}
	}

	foliumOfDescartes { :a |
		{ :theta |
			let r = (3 * a * theta.sin * theta.cos) / (theta.sin.cube + theta.cos.cube);
			[r, theta].fromPolarCoordinates
		}
	}

	freethsNephroid { :a |
		{ :theta |
			let r = a * (1 + (2 * (0.5 * theta).sin));
			[r, theta].fromPolarCoordinates
		}
	}

	galileanSpiral { :a :b |
		{ :theta |
			let rho = (b * theta.square) - a;
			[rho theta].fromPolarCoordinates
		}
	}

	geocentricOrbitCurve { :r |
		let a = r ^ 2/3;
		{ :t |
			let b = t * 2.pi;
			let c = b / r;
			let x = b.sin + (a * c.sin);
			let y = b.cos + (a * c.cos);
			[x, y]
		}
	}

	geocentricOrbitCurve { :tP :rP |
		let a = 2.pi * (1 - (1 / tP));
		{ :t |
			let r = (1 + (rP ^ 2) - (2 * rP * cos(a * t))).sqrt;
			let b = (rP * sin(a * t)) / r;
			let c = (1 + (r ^ 2) - (rP ^ 2)) / (2 * r);
			let d = sin(2.pi * t);
			let e = cos(2.pi * t);
			let x = r * ((d * b) - (e * c));
			let y = r * (0 - ((d * c) + (e * b)));
			[x, y]
		}
	}

	hippopede { :a :b |
		{ :theta |
			let r = 2 * (a - (b * (theta.sin ^ 2))).sqrt.real;
			[r, theta].fromPolarCoordinates
		}
	}

	hypocycloid { :a :b |
		hypotrochoid(a, b, b)
	}

	hypotrochoid { :a :b :h |
		let c = a - b;
		let d = c / b;
		{ :t |
			[
				(c * t.cos) + (h * (t * d).cos),
				(c * t.sin) - (h * (t * d).sin)
			]
		}
	}

	inverseNorwichSpiral { :a |
		{ :t |
			let rho = a * t.cos.square;
			let theta = (2 * t) - t.tan;
			[rho theta].fromPolarCoordinates
		}
	}

	lemniscate { :a |
		{ :theta |
			/*let rho = a * (2 * theta).cos.sqrt;
			[rho theta].fromPolarCoordinates*/
			let u = 1 + theta.sin.square;
			let x = (a * theta.cos) / u;
			let y = (a * theta.sin * theta.cos) / u;
			[x, y]
		}
	}

	lHospitalQuintic { :a |
		{ :theta |
			let u = (theta / 2).tan;
			let x = (a / 2) * (u - ((u ^ 5) / 5));
			let y = (a / 4) * (1 + u.square).square;
			[x, y]
		}
	}

	limacon { :a :b |
		{ :t |
			let r = b + (a * t.cos);
			[r, t].fromPolarCoordinates
		}
	}

	lissajousCurve { :delta :a :b |
		{ :t |
			let x = ((a * t) + delta).sin;
			let y = (b * t).sin;
			[x, y]
		}
	}

	logarithmicSpiral { :a :b |
		{ :theta |
			let r = a * (b * theta).exp;
			[r, theta].fromPolarCoordinates
		}
	}

	norwichSpiral { :a |
		{ :t |
			let rho = a / t.cos.square;
			let theta = t.tan - (2 * t);
			[rho theta].fromPolarCoordinates
		}
	}

	plateauCurve { :a :m :n |
		{ :t |
			let p = ((m - n) * t).sin;
			let x = (a * ((m + n) * t).sin) / p;
			let y = (2 * a * (m * t).sin * (n * t).sin) / p;
			[x, y]
		}
	}

	quadratrixOfHippias { :a |
		let m = (2 * a) / 1.pi;
		{ :t |
			[
				m * t * t.cot,
				m * t
			]
		}
	}

	reuleauxPolygonCurve { :n |
		{ :theta |
			let a = n * (theta - 1.pi) / 2.pi + 0.5;
			let b = 2.pi * a.floor / n;
			let c = (theta - b).cos;
			let d = 2 * (1.pi / n).cos;
			let r = c + (1 + d + (c ^ 2)).sqrt;
			[r theta].fromPolarCoordinates
		}
	}

	rhodonea { :a :n |
		{ :theta |
			let r = a * (n * theta).cos;
			[r, theta].fromPolarCoordinates
		}
	}

	satelliteCurve { :r :alpha :k |
		{ :theta |
			let x = r * ((alpha.cos * theta.cos * (k * theta).cos) - (theta.sin * (k * theta).sin));
			let y = r * ((alpha.cos * theta.sin * (k * theta).cos) + (theta.cos * (k * theta).sin));
			let z = r * alpha.sin * (k * theta).cos;
			[x, y, z]
		}
	}

	seiffertsSpiral { :m |
		let k = m.sqrt;
		{ :s |
			let rho = jacobiSn(s, m);
			let theta = k * s;
			let z = jacobiCn(s, m);
			[rho theta z].fromCylindricalCoordinates
		}
	}

	semicubicalParabola { :a |
		{ :t |
			let x = t.square;
			let y = a * t.cube;
			[x, y]
		}
	}

	serpentineCurve { :a :b |
		{ :theta |
			[
				a * theta.cot,
				b * theta.sin * theta.cos
			]
		}
	}

	sinusoidalSpiral { :n :a |
		{ :theta |
			let r = (2 * (a ^ n) * (n * theta).cos).nthRoot(n);
			[r theta].fromPolarCoordinates
		}
	}

	sphericalSpiral { :a |
		{ :t |
			let c = (t * a).arcTan;
			let d = c.cos;
			let x = t.cos * d;
			let y = t.sin * d;
			let z = c.sin.-;
			[x, y, z]
		}
	}

	sphericalTrochoid { :omega :a :b :d |
		let q = a / b;
		let i = omega.cos;
		let j = omega.sin;
		{ :theta |
			let p = a - (b * i) + (d * i * (q * theta).cos);
			let x = (p * theta.cos) + (d * theta.sin * (q * theta).sin);
			let y = (p * theta.sin) - (d * theta.cos * (q * theta).sin);
			let z = j * (b - (d * (q * theta).cos));
			[x, y, z]
		}
	}

	strophoid { :a |
		{ :theta |
			let rho = a * ((2 * theta - a).sin / (theta - a).sin);
			[rho theta].fromPolarCoordinates
		}
	}

	superellipseCurve { :a :b :n |
		{ :t |
			let m = 2 / n;
			let c = t.cos;
			let s = t.sin;
			let x = (c.abs ^ m) * a * c.sign;
			let y = (s.abs ^ m) * b * s.sign;
			[x, y]
		}
	}

	superformulaCurve { :a :b :m :n1 :n2 :n3 |
		{ :u |
			let p = ((m * u / 4).cos / a).abs ^ n2;
			let q = ((m * u / 4).sin / b).abs ^ n3;
			let r = (p + q) ^ (-1 / n1);
			let x = r * u.cos;
			let y = r * u.sin;
			[x, y]
		}
	}

	syntractrix { :a :k |
		{ :t |
			let x = a * (t - (k * tanh(t)));
			let y = a * (k / cosh(t));
			[x, y]
		}
	}

	tschirnhausenCubic { :a |
		{ :t |
			let x = 9 * a * (1 - (3 * t * t));
			let y = t * x;
			[x, y]
		}
	}

	tractrix { :theta |
		[
			theta - theta.tanh,
			1 / theta.cosh
		]
	}

	tractrixSpiral { :a |
		{ :t |
			[
				a * cos(t) * cos(t - tan(t)),
				a * cos(t) * sin(t - tan(t))
			]
		}
	}

	trifolium { :r :a :b |
		{ :theta |
			let rho = (4 * r * theta.cos.cube) + ((a - (3 * r)) * theta.cos) + (b * theta.sin);
			[rho, theta].fromPolarCoordinates
		}
	}

	trifolium { :a |
		{ :theta |
			let r = -a * (3 * theta).cos;
			[r, theta].fromPolarCoordinates
		}
	}

	trisectrixOfMaclaurin { :a |
		{ :theta |
			let r = (a / 2) * ((4 * theta.cos) - theta.sec);
			[r, theta].fromPolarCoordinates
		}
	}

	trochoid { :a :b |
		{ :theta |
			let x = (a * theta) - (b * theta.sin);
			let y = a - (b * theta.cos);
			[x, y]
		}
	}

	witchOfAgnesi { :a |
		{ :theta |
			let x = 2 * a * theta;
			let y = (2 * a) / (1 + theta.square);
			[x, y]
		}
	}

}

+@Number {

	ampersandImplicitCurve { :x :y |
		(6 * (x ^ 4))
		+
		(4 * (y ^ 4))
		-
		(21 * (x ^ 3))
		+
		(6 * (x ^ 2) * (y ^ 2))
		+
		(19 * (x ^ 2))
		-
		(11 * x * (y ^ 2))
		-
		(3 * (y ^ 2))
	}

	bicuspidCurve { :a |
		{ :x :y |
			let p = (x ^ 2) - (a ^ 2);
			let q = (x - a) ^ 2;
			let r = ((y ^ 2) - (a ^ 2)) ^ 2;
			p * q + r
		}
	}

	bowCurve { :x :y |
		(x ^ 4) - ((x ^ 2) * y) + (y ^ 3)
	}

	cassiniOval { :a :b |
		{ :x :y |
			(((x ^ 2) + (y ^ 2) + (a ^ 2)) ^ 2)
			-
			(4 * (a ^ 2) * (x ^ 2))
			-
			(b ^ 4)
		}
	}

	ellipticCurve { :a :b |
		{ :x :y |
			(x ^ 3) + (a * x) + b - (y ^ 2)
		}
	}

	spiricSection { :a :b :c |
		{ :x :y |
			(x.square + y.square - a.square + b.square + c.square).square - (4 * b.square * (x.square + c.square))
		}
	}

	squareChladniPlateEquation { :m :n |
		{ :x :y |
			(cos(n.pi * x) * cos(m.pi * y))
			-
			(cos(m.pi * x) * cos(n.pi * y))
		}
	}

	stirrupCurve { :x :y |
		let a = ((x ^ 2) - 1) ^ 2;
		let b = (y - 1) * (y - 2) * (y + 5);
		a - ((y ^ 2) * b)
	}

	wattsCurve { :a :b :c |
		let aa = a * a;
		let bb = b * b;
		let cc = c * c;
		{ :x :y |
			let xx = x * x;
			let yy = y * y;
			let r = xx + yy;
			(r * (r - aa - bb + cc).square)
			+
			(4 * aa * yy * (r - bb))
		}
	}

}

+List {

	circleCurve { :c :r |
		let [x0, y0] = c;
		{ :t |
			let x = x0 + (r * t.cos);
			let y = y0 + (r * t.sin);
			[x, y]
		}
	}

	ellipseCurve { :c :r :theta |
		let [a, b] = r;
		let [x0, y0] = c;
		let p = theta.cos;
		let q = theta.sin;
		{ :t |
			let x = x0 + (a * p * t.cos) - (b * q * t.sin);
			let y = y0 + (a * q * t.cos) + (b * p * t.sin);
			[x, y]
		}
	}

	harmonographCurve { :f :p :a :d |
		let [f1, f2, f3, f4] = f;
		let [p1, p2, p3, p4] = p;
		let [a1, a2, a3, a4] = a;
		let [d1, d2, d3, d4] = d / 100;
		{ :t |
			let x = (
				(a1 * sin((t * f1) + p1) * (-1 * d1 * t).exp)
				+
				(a2 * sin((t * f2) + p2) * (-1 * d2 * t).exp)
			);
			let y = (
				(a3 * sin((t * f3) + p3) * (-1 * d3 * t).exp)
				+
				(a4 * sin((t * f4) + p4) * (-1 * d4 * t).exp)
			);
			[x, y]
		}
	}

	lateralHarmonographCurve { :self |
		let [f, p, a, d] = self;
		harmonographCurve([1 0 f 0], [0 0 p 0], [1 0 a 0], [d 0 d 0])
	}

	rotaryHarmonographCurve { :self |
		let [f, p, a, d] = self;
		harmonographCurve([1 f 1 f], [0, p, 1/2.pi, p + 1/2.pi], [1 a 1 a], [d d d d])
	}

	tridentCurve { :self |
		let [a, b, c, d] = self;
		{ :x :y |
			(x * y) + (a * (x ^ 3)) + (b * (x ^ 2)) + (c * x) - d
		}
	}

	tridentOfNewton { :self |
		let [a, b, c, d] = self;
		{ :x |
			(d / x) - (a * x.square) - (b * x) - c
		}
	}

	trottCurve { :x :y |
		let a = 144 * ((x ^ 4) + (y ^ 4));
		let b = 225 * ((x ^ 2) + (y ^ 2));
		let c = 350 * (x ^ 2) * (y ^ 2);
		a - b + c + 81
	}

}

+@Integer {

	torusKnotCurve { :p :q |
		{ :t |
			let r = p + (q * t).cos;
			let x = r * (p * t).cos;
			let y = r * (p * t).sin;
			let z = (q * t).sin;
			[x, y, z]
		}
	}

}

+@Number {

	catenoid { :c |
		{ :u :v |
			let a = c * (v / c).cosh;
			let x = a * u.cos;
			let y = a * u.sin;
			let z = v;
			[x, y, z]
		}
	}

	dinisSurface { :a :b |
		{ :u :v |
			let i = v.cos + (0.5 * v).tan.log;
			[
				a * u.cos * v.sin,
				a * u.sin * v.sin,
				(a * i) + (b * u)
			]
		}
	}

	ellipsoid { :a :b :c |
		{ :u :v |
			let x = a * u.cos * v.sin;
			let y = b * u.sin * v.sin;
			let z = c * v.cos;
			[x, y, z]
		}
	}

	ellipticParaboloid { :a :b |
		{ :u :v |
			let p = u.sqrt;
			let x = a * p * v.cos;
			let y = b * p * v.sin;
			let z = u;
			[x, y, z]
		}
	}

	helicoid { :a |
		{ :u :v |
			let x = v * (a * u).cos;
			let y = v * (a * u).sin;
			let z = u;
			[x, y, z]
		}
	}

	hyperbolicHelicoid { :t |
		{ :u :v |
			let a = 1 + (u.cosh * v.cosh);
			let x = v.sinh * (t * u).cos;
			let y = v.sinh * (t * u).sin;
			let z = v.cosh * u.sinh;
			[x, y, z] / a
		}
	}

	moebiusStrip { :r |
		{ :u :v |
			let a = r + ((v / 2) * (u / 2).cos);
			let x = a * u.cos;
			let y = a * u.sin;
			let z = (v / 2) * (u / 2).sin;
			[x, y, z]
		}
	}

	pleuckersConoid { :n |
		{ :u :v |
			let x = v * u.cos;
			let y = v * u.sin;
			let z = (n * u).sin;
			[x, y, z]
		}
	}

	pseudosphere { :u :v |
		let i = v.cos + (0.5 * v).tan.log;
		[
			u.sech * v.cos,
			u.sech * v.sin,
			u - u.tanh
		]
	}

	torus { :r |
		{ :theta :phi |
			let a = r + theta.sin;
			let x = a * phi.cos;
			let y = a * phi.sin;
			let z = theta.cos;
			[x, y, z]
		}
	}

	umbilicTorus { :u :v |
		let a = (u / 3) - (2 * v);
		let b = (u / 3) + v;
		let c = 7 + a.cos + (2 * b.cos);
		let x = c * u.sin;
		let y = c * u.cos;
		let z = a.sin + (2 * b.sin);
		[x, y, z]
	}

}
