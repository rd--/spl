+@Sequenceable {

	binaryDistance { :u :v |
		(u = v).boole
	}

	brayCurtisDistance { :self :aList |
		(self - aList).abs.sum / (self + aList).abs.sum
	}

	canberraDistance { :self :aList |
		((self - aList).abs / (self.abs + aList.abs)).sum
	}

	chessboardDistance { :self :aList |
		(self - aList).abs.max
	}

	cosineDistance { :u :v |
		1 - (u.dot(v) / (u.norm * v.norm))
	}

	editDistance { :self :other |
		self.levenshteinDistance(other)
	}

	euclideanDistance { :self :aList |
		(self - aList).norm
	}

	hammingDistance { :self :other |
		let size = self.size.min(other.size);
		let count = (self.size - other.size).abs;
		1.toDo(size) { :index |
			(self[index] ~= other[index]).ifTrue {
				count := count + 1
			}
		};
		count
	}

	jaccardDissimilarity { :u :v |
		let k = u.size;
		(v.size = k).if {
			let a = 0;
			let b = 0;
			u.withDo(v) { :i :j |
				(i ~= j).ifTrue {
					a := a + 1
				};
				(i.asBoolean.not & { j.asBoolean.not }).ifTrue {
					b := b + 1
				}
			};
			a / (k - b)
		} {
			u.error('jaccardDissimilarity: size mismatch')
		}
	}

	levenshteinDistance { :self :other |
		self.levenshteinDistance(other, =)
	}

	levenshteinDistance { :self :other :equalityBlock:/2 |
		(self.isEmpty | {
			other.isEmpty
		}).if {
			self.size
		} {
			let matrix = [0 .. other.size];
			1.toDo(self.size) { :xIndex |
				let corner = xIndex - 1;
				matrix[1] := xIndex - 1;
				1.toDo(other.size) { :yIndex |
					let upper = matrix[yIndex + 1];
					matrix[yIndex + 1] := equalityBlock(self[xIndex], other[yIndex]).if {
						corner
					} {
						[upper, corner, matrix[yIndex]].min + 1
					};
					corner := upper
				}
			};
			matrix[other.size + 1]
		}
	}

	matchingDissimilarity { :u :v |
		(u.size = v.size).if {
			u.withCollect(v, =).occurrencesOf(false) / u.size
		} {
			[u, v].error('matchingDissimilarity: invalid input')
		}
	}

	manhattanDistance { :self :aList |
		(self - aList).abs.sum
	}

	normalizedSquaredEuclideanDistance { :u :v |
		let uu = (u - u.mean);
		let vv = (v - v.mean);
		0.5 * (uu - vv).norm.squared / (uu.norm.squared + vv.norm.squared)
	}

	squaredEuclideanDistance { :self :aList |
		(self - aList).norm.squared
	}

}

+@Number {

	euclideanDistance { :self :aNumber |
		(aNumber - self).abs
	}

	minkowskiDistance { :p :u :v |
		((u - v).abs ^ p).sum ^ (1 / p)
	}

}

+String {

	editDistance { :self :aString |
		self.characters.editDistance(aString.characters)
	}

	hammingDistance { :self :aString |
		self.characters.hammingDistance(aString.characters)
	}

}
