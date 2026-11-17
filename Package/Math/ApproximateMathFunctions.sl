+Float {

	blinnWyvillRaisedInvertedCosine { :x |
		let x2 = x * x;
		let x4 = x2 * x2;
		let x6 = x4 * x2;
		let fa = 4.0 / 9.0;
		let fb = 17.0 / 9.0;
		let fc = 22.0 / 9.0;
		(fa * x6) - (fb * x4) + (fc * x2)
	}

	cosApproximation { :x |
		let x2 = x * x;
		let numerator = (-39251520.0 + (x2 * (18471600.0 + (x2 * (-1075032.0 + (14615.0 * x2)))))).negate;
		let denominator = 39251520.0 + (x2 * (1154160.0 + (x2 * (16632.0 + (x2 * 127.0)))));
		numerator / denominator
	}

	coshApproximation { :x |
		let x2 = x * x;
		let numerator = (39251520.0 + (x2 * (18471600.0 + (x2 * (1075032.0 + (14615.0 * x2)))))).negate;
		let denominator = -39251520.0 + (x2 * (1154160.0 + (x2 * (-16632.0 + (127.0 * x2)))));
		numerator / denominator
	}

	expApproximation { :x |
		let numerator = 1680.0 + (x * (840.0 + (x * (180.0 + (x * (20.0 + x))))));
		let denominator = 1680.0 + (x *(-840.0 + (x * (180.0 + (x * (-20.0 + x))))));
		numerator / denominator
	}

	sinApproximation { :x |
		let x2 = x * x;
		let numerator = x.- * (-11511339840.0 + (x2 * (1640635920.0 + (x2 * (-52785432.0 + (x2 * 479249.0))))));
		let denominator = 11511339840.0 + (x2 * (277920720.0 + (x2 * (3177720.0 + (x2 * 18361.0)))));
		numerator / denominator
	}

	sinhApproximation { :x |
		let x2 = x * x;
		let numerator = x.- * (11511339840.0 + (x2 * (1640635920.0 + (x2 * (52785432.0 + (x2 * 479249.0))))));
		let denominator = -11511339840.0 + (x2 * (277920720.0 + (x2 * (-3177720.0 + (x2 * 18361.0)))));
		numerator / denominator
	}

	tanApproximation { :x |
		let x2 = x * x;
		let numerator = x * (-135135.0 + (x2 * (17325.0 + (x2 * (-378.0 + x2)))));
		let denominator = -135135.0 + (x2 * (62370.0 + (x2 * (-3150.0 + (28.0 * x2)))));
		numerator / denominator
	}

	tanhApproximation { :x |
		let x2 = x * x;
		let numerator = x * (135135.0 + (x2 * (17325.0 + (x2 * (378.0 + x2)))));
		let denominator = 135135.0 + (x2 * (62370.0 + (x2 * (3150.0 + (28.0 * x2)))));
		numerator / denominator
	}

}
