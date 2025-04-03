+SmallFloat {

	blinnWyvillRaisedInvertedCosine { :x |
		let x2 = x * x;
		let x4 = x2 * x2;
		let x6 = x4 * x2;
		let fa = 4 / 9;
		let fb = 17 / 9;
		let fc = 22 / 9;
		(fa * x6) - (fb * x4) + (fc * x2)
	}

	cosApproximation { :x |
		let x2 = x * x;
		let numerator = (-39251520 + (x2 * (18471600 + (x2 * (-1075032 + (14615 * x2)))))).-;
		let denominator = 39251520 + (x2 * (1154160 + (x2 * (16632 + (x2 * 127)))));
		numerator / denominator
	}

	coshApproximation { :x |
		let x2 = x * x;
		let numerator = (39251520 + (x2 * (18471600 + (x2 * (1075032 + (14615 * x2)))))).-;
		let denominator = -39251520 + (x2 * (1154160 + (x2 * (-16632 + (127 * x2)))));
		numerator / denominator
	}

	expApproximation { :x |
		let numerator = 1680 + (x * (840 + (x * (180 + (x * (20 + x))))));
		let denominator = 1680 + (x *(-840 + (x * (180 + (x * (-20 + x))))));
		numerator / denominator
	}

	sinApproximation { :x |
		let x2 = x * x;
		let numerator = x.- * (-11511339840 + (x2 * (1640635920 + (x2 * (-52785432 + (x2 * 479249))))));
		let denominator = 11511339840 + (x2 * (277920720 + (x2 * (3177720 + (x2 * 18361)))));
		numerator / denominator
	}

	sinhApproximation { :x |
		let x2 = x * x;
		let numerator = x.- * (11511339840 + (x2 * (1640635920 + (x2 * (52785432 + (x2 * 479249))))));
		let denominator = -11511339840 + (x2 * (277920720 + (x2 * (-3177720 + (x2 * 18361)))));
		numerator / denominator
	}

	tanApproximation { :x |
		let x2 = x * x;
		let numerator = x * (-135135 + (x2 * (17325 + (x2 * (-378 + x2)))));
		let denominator = -135135 + (x2 * (62370 + (x2 * (-3150 + (28 * x2)))));
		numerator / denominator
	}

	tanhApproximation { :x |
		let x2 = x * x;
		let numerator = x * (135135 + (x2 * (17325 + (x2 * (378 + x2)))));
		let denominator = 135135 + (x2 * (62370 + (x2 * (3150 + (28 * x2)))));
		numerator / denominator
	}

}
