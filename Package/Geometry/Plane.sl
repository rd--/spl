+List {

	pointPlaneDistance { :plane :point |
		plane.signedPointPlaneDistance(point).abs
	}

	signedPointPlaneDistance { :plane :point |
		let [a, b, c, d] = plane;
		let [x, y, z] = point;
		((a * x) + (b * y) + (c * z) + d) / ((a * a) + (b * b) + (c * c)).sqrt
	}

}
