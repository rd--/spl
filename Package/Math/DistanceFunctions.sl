+@Sequenceable {

	binaryDistance { :u :v |
		(u ~= v).boole
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

	chebyshevDistance { :self :operand |
		(self - operand).abs.max
	}

	cosineDistance { :u :v |
		1 - (u.dot(v) / (u.norm * v.norm))
	}

	cosineSimilarity { :u :v |
		let p = u.norm;
		let q = v.norm;
		dotProduct(u, v) / (p * q)
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

	leeDistance { :x :y :q |
		let n = x.size;
		(1 .. n).sum { :i |
			let z = (x[i] - y[i]).abs;
			min(z, q - z)
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

	binaryDistance { :self :operand |
		(self ~= operand).boole
	}

	euclideanDistance { :self :aNumber |
		(aNumber - self).abs
	}

	minkowskiDistance { :p :u :v |
		((u - v).abs ^ p).sum ^ (1 / p)
	}

	minkowskiDistance { :p |
		{ :u :v |
			((u - v).abs ^ p).sum ^ (1 / p)
		}
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

+@Collection {

	nearestBy { :self :anObject :aBlock:/2 |
		let distanceList = self.collect { :each |
			aBlock(each, anObject)
		};
		let leastDistance = distanceList.min;
		self.select { :each |
			aBlock(each, anObject) = leastDistance
		}
	}

	nearest { :self :anObject |
		self.nearestBy(anObject, euclideanDistance:/2)
	}

	nearest { :self :anObject :anInteger |
		let distanceList = self.collect { :each |
			euclideanDistance(each, anObject)
		};
		let indexList = distanceList.ordering.first(anInteger);
		self.atAll(indexList)
	}

}

+List {

	directedHausdorffMetric { :u :v :f:/2 |
		let cMax  = 0;
		let a = nil;
		let b = nil;
		u.withIndexDo { :x :i |
			let cMin = Infinity;
			let k = nil;
			v.withIndexDo { :y :j |
				let d = f(x, y);
				(d < cMin).ifTrue {
					cMin := d;
					k := j
				}
			};
			(cMin > cMax).ifTrue {
				cMax := cMin;
				a := i;
				b := k
			}
		};
		[cMax, a, b]
	}

	directedHausdorffMetric { :u :v |
		directedHausdorffMetric(u, v, euclideanDistance:/2)
	}

	hausdorffDistance { :u :v :f:/2 |
		hausdorffMetric(u, v, f:/2).at(1)
	}

	hausdorffDistance { :u :v |
		hausdorffMetric(u, v).at(1)
	}

	hausdorffMetric { :u :v :f:/2 |
		let a = directedHausdorffMetric(u, v, f:/2);
		let b = directedHausdorffMetric(v, u, f:/2);
		(a[1] > b[1]).if { a } { b }
	}

	hausdorffMetric { :u :v |
		hausdorffMetric(u, v, euclideanDistance:/2)
	}

	nearestNeighbourAlgorithm { :self :initialIndex |
		let distanceMatrix = self.distanceMatrix;
		let visited = List(self.size, false);
		let currentIndex = initialIndex;
		let answer = [currentIndex];
		visited[currentIndex] := true;
		{
			visited.allTrue
		}.whileFalse {
			let distanceList = distanceMatrix[currentIndex];
			let o = distanceList.ordering;
			let i = 1;
			{
				visited[o[i]]
			}.whileTrue {
				i := i + 1
			};
			visited[o[i]] := true;
			answer.add(o[i]);
			currentIndex := o[i]
		};
		answer
	}

	nearestNeighbourGraph { :self |
		let distanceMatrix = self.distanceMatrix;
		let vertexCount = self.size;
		let vertexList = [1 .. vertexCount];
		let edgeList = [];
		1.toDo(vertexCount) { :i |
			let distanceList = distanceMatrix[i];
			let sortedDistances = distanceList.sorted;
			let leastDistance = sortedDistances[2];
			1.toDo(vertexCount) { :j |
				let distance = distanceList[j];
				(i ~= j & { distance <= leastDistance }).ifTrue {
					edgeList.addIfNotPresent(i --> j)
				}
			}
		};
		Graph(vertexList, edgeList)
	}

	pairwiseDistances { :u :f:/2 |
		let k = u.size;
		let answer = [];
		1.toDo(k) { :i |
			(i + 1).toDo(k) { :j |
				answer.add(f(u[i], u[j]))
			}
		};
		answer
	}

	pairwiseDistances { :u |
		pairwiseDistances(u, euclideanDistance:/2)
	}

}

+List{

	warpingMatrices { :x :y :w :f:/2 |
		let n = x.size;
		let m = y.size;
		let tracebackMatrix = [0].reshape([n, m]);
		let costMatrix = [Infinity].reshape([n + 1, m + 1]);
		costMatrix[1][1] := 0;
		w := w + 1;
		2.toDo(n + 1) { :i |
			let a = max(2, i - w);
			let b = min(m + 1, i + w);
			a.toDo(b) { :j |
				let z = f(x[i - 1], y[j - 1]);
				let h = [
					costMatrix[i - 1][j - 1],
					costMatrix[i - 1][j],
					costMatrix[i][j - 1]
				];
				let l = h.min;
				costMatrix[i][j] := z + l;
				tracebackMatrix[i - 1][j - 1] := h.indexOf(l)
			}
		};
		costMatrix.removeFirst;
		costMatrix.do { :each |
			each.removeFirst
		};
		[tracebackMatrix, costMatrix]
	}

	warpingCorrespondence { :x :y :w :f:/2 |
		let derivePath = { :tracebackMatrix |
			let [n, m] = tracebackMatrix.shape;
			let i = n;
			let j = m;
			let path = [[i, j]];
			{ i > 1 | { j > 1 } }.whileTrue {
				tracebackMatrix[i][j].caseOf([
					1 -> {
						i := i - 1;
						j := j - 1
					},
					2 -> {
						i := (i - 1)
					},
					3 -> {
						j := j - 1
					}
				]);
				path.addLast([i, j])
			};
			path
		};
		let [tracebackMatrix, _] = warpingMatrices(x, y, w, f:/2);
		tracebackMatrix.derivePath.transposed.collect(reverse:/1)
	}

	warpingCorrespondence { :x :y :w |
		warpingCorrespondence(x, y, w, euclideanDistance:/2)
	}

	warpingCorrespondence { :x :y |
		warpingCorrespondence(x, y, Infinity, euclideanDistance:/2)
	}

	warpingDistance { :x :y :w :f:/2 |
		let i = x.size;
		let j = y.size;
		let [_, costMatrix] = warpingMatrices(x, y, w, f:/2);
		costMatrix[i][j]
	}

	warpingDistance { :x :y :w |
		warpingDistance(x, y, w, euclideanDistance:/2)
	}

	warpingDistance { :x :y |
		warpingDistance(x, y, Infinity, euclideanDistance:/2)
	}

}

