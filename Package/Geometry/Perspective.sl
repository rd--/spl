+SmallFloat {

	glFrustum { :left :right :bottom :top :nearVal :farVal |
		let x = (2 * nearVal) / (right - left);
		let y = (2 * nearVal) / (top - bottom);
		let a = (right + left) / (right - left);
		let b = (top + bottom) / (top - bottom);
		let c = -(farVal + nearVal) / (farVal - nearVal);
		let d = -(2 * farVal * nearVal) / (farVal - nearVal);
		[x 0 0 0; 0 y 0 0; a b c -1; a 0 d 0]
	}

	glOrtho { :left :right :bottom :top :nearval :farval |
		[
			[2 / (right - left), 0, 0, 0],
			[0, 2 / (top - bottom), 0, 0],
			[0, 0, -2 / (farval - nearval), 0],
			[
				(right + left).negated / (right - left),
				(top + bottom).negated / (top - bottom),
				(farval + nearva.negatedl) / (farval - nearval),
				1
			]
		]
	}

	gluPerspective { :fovy :aspect :zNear :zFar |
		let ymax = zNear * (fovy * pi / 360).tan;
		let ymin = ymax.negated;
		let xmin = ymin * aspect;
		let xmax = ymax * aspect;
		glFrustum(xmin, xmax, ymin, ymax, zNear, zFar)
	}

}

+List {

	gluLookAt { :eye :center :up |
		let z = (eye - center).normalize;
		let x = up.cross(z);
		let y = z.cross(x);
		let [x1, x2, x3] = x.normalize;
		let [y1, y2, y3] = y.normalize;
		let [z1, z2, z3] = z;
		let [w1, w2, w3] = eye.negated;
		[x1 y1 z1 w1; x2 y2 z2 w2; x3 y3 z3 w3; 0 0 0 1]
	}

}
