+SmallFloat {

	doyleSpiralParameters { :p :q |
		<primitive:
		/* https://gist.github.com/robinhouston/6096950 */
		let p = _p;
		let q = _q;
		let pow = Math.pow;
		let sin = Math.sin;
		let cos = Math.cos;
		let pi = Math.PI;
		let _d = function(z,t, p,q) {
			let w = pow(z, p/q);
			let s =(p*t + 2*pi)/q;
			return (
				pow( z*cos(t) - w*cos(s), 2 )
				+ pow( z*sin(t) - w*sin(s), 2 )
			);
		};
		let ddz_d = function(z,t, p,q) {
			let w = pow(z, p/q);
			let s = (p*t + 2*pi)/q;
			let ddz_w = (p/q)*pow(z, (p-q)/q);
			return (
				2*(w*cos(s) - z*cos(t))*(ddz_w*cos(s) - cos(t))
				+ 2*(w*sin(s) - z*sin(t))*(ddz_w*sin(s) - sin(t))
			);
		};
		let ddt_d = function(z,t, p,q) {
			let w = pow(z, p/q);
			let s = (p*t + 2*pi)/q;
			let dds_t = (p/q);
			return (
				2*( z*cos(t) - w*cos(s) )*( -z*sin(t) + w*sin(s)*dds_t )
				+ 2*( z*sin(t) - w*sin(s) )*( z*cos(t) - w*cos(s)*dds_t )
			);
		};
		let _s = function(z,_t, p,q) {
			return pow(z + pow(z, p/q), 2);
		};
		let ddz_s = function(z,_t, p,q) {
			let w = pow(z, p/q);
			let ddz_w = (p/q)*pow(z, (p-q)/q);
			return 2*(w+z)*(ddz_w+1);
		};
		let _r = function(z,t, p,q) {
			return _d(z,t,p,q) / _s(z,t,p,q);
		};
		let ddz_r = function(z,t, p,q) {
			return (
				ddz_d(z,t,p,q) * _s(z,t,p,q)
				- _d(z,t,p,q) * ddz_s(z,t,p,q)
			) / pow( _s(z,t,p,q), 2 );
		};
		let ddt_r = function(z,t, p,q) {
			return (
				ddt_d(z,t,p,q) * _s(z,t,p,q)
			) / pow( _s(z,t,p,q), 2 );
		};
		let epsilon = 1e-10;
		let _f = function(z, t) {
			return _r(z,t,0,1) - _r(z,t,p,q);
		};
		let ddz_f = function(z, t) {
			return ddz_r(z,t,0,1) - ddz_r(z,t,p,q);
		};
		let ddt_f = function(z, t) {
			return ddt_r(z,t,0,1) - ddt_r(z,t,p,q);
		};
		let _g =  function(z, t) {
			return _r(z,t,0,1) - _r(pow(z, p/q), (p*t + 2*pi)/q, 0,1);
		};
		let ddz_g = function(z, t) {
			return ddz_r(z,t,0,1) - ddz_r(pow(z, p/q), (p*t + 2*pi)/q, 0,1) * (p/q)*pow(z, (p-q)/q);
		};
		let ddt_g = function(z, t) {
			return ddt_r(z,t,0,1) - ddt_r(pow(z, p/q), (p*t + 2*pi)/q, 0,1) * (p/q);
		};
		let find_root = function(z, t) {
			for(;;) {
				let v_f = _f(z, t);
				let v_g = _g(z, t);
				if (-epsilon < v_f && v_f < epsilon && -epsilon < v_g && v_g < epsilon) {
					return {ok: true, z: z, t: t, r: Math.sqrt(_r(z,t,0,1))};
				}
				let a = ddz_f(z,t);
				let b = ddt_f(z,t);
				let c = ddz_g(z,t);
				let d = ddt_g(z,t);
				let det = a*d-b*c;
				if (-epsilon < det && det < epsilon) {
					return {ok: false};
				}
				z -= (d*v_f - b*v_g)/det;
				t -= (a*v_g - c*v_f)/det;
				if (z < epsilon) {
					return {ok: false};
				}
			}
		};
		let root = find_root(2, 0);
		if (!root.ok) {
			throw "Failed to find root for p=" + p + ", q=" + q;
		}
		let a = [root.z * cos(root.t), root.z * sin(root.t) ];
		let coroot = {z: pow(root.z, p/q), t: (p*root.t+2*pi)/q};
		let b = [coroot.z * cos(coroot.t), coroot.z * sin(coroot.t) ];
		return [_asComplex_1(a), _asComplex_1(b), root.r];
		>
	}

	doyleSpiralArm { :r :z :delta :limit |
		let recipDelta = 1 / delta;
		let modDelta = delta.abs;
		let modRecipDelta = 1 / modDelta;
		let [minD, maxD] = limit;
		let q = z;
		let modQ = q.abs;
		let answer = [];
		let count = 0;
		{ modQ < maxD }.whileTrue {
			answer.add(Circle(q.asList, modQ * r));
			q := q * delta;
			modQ := modQ * modDelta;
			count := count + 1
		};
		q := z * recipDelta;
		modQ := q.abs;
		{ modQ > minD }.whileTrue {
			answer.add(Circle(q.asList, modQ * r));
			q := q * recipDelta;
			modQ := modQ * modRecipDelta;
			count := count + 1
		};
		answer
	}

	doyleSpiral { :p :q :l |
		let [a, b, r] = doyleSpiralParameters(p, q);
		let z = a;
		let answer = [];
		1.toDo(q) { :i |
			answer.addAll(doyleSpiralArm(r, z, a, l));
			z := z * b
		};
		answer
	}

}
