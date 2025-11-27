List! : [Object, Storeable, Equatable, Comparable, Json, Iterable, Indexable, Collection, Extensible, Removable, Sequenceable, PrimitiveArray, Ordered] {

	addListFirst { :self :aList |
		<primitive:
		_self.unshift(..._aList);
		return _aList;
		>
	}

	addListLast { :self :aList |
		<primitive:
		_self.push(..._aList);
		return _aList;
		>
	}

	addFirst { :self :anObject |
		<primitive:
		_self.unshift(_anObject);
		return _anObject;
		>
	}

	addLast { :self :anObject |
		<primitive:
		_self.push(_anObject);
		return _anObject;
		>
	}

	asList { :self |
		self
	}

	atAllPut { :self :anObject |
		<primitive:
		_self.fill(_anObject);
		return _anObject;
		>
	}

	copy { :self |
		<primitive: return Array.from(_self);>
	}

	copyList { :self |
		self.copy
	}

	deinterleave { :self :n |
		/*
		let k = self.size;
		let numberOfChannels = n;
		let numberOfFrames = k // numberOfChannels;
		let channelsArray = {
			List(numberOfFrames)
		} ! numberOfChannels;
		0.toDo(numberOfFrames - 1) { :i |
			1.toDo(numberOfChannels) { :j |
				channelsArray[j][i + 1] := self[(i * numberOfChannels) + j]
			}
		};
		channelsArray
		*/
		self.partition(n, n).transpose
	}

	fill { :shape :aBlock:/1 |
		shape.isEmpty.if {
			aBlock(0)
		} {
			let answer = shape.iota;
			shape.shapeIndicesDo { :index |
				answer.atPathPut(index, aBlock(index))
			};
			answer
		}
	}

	gatherBy { :self :aBlock:/1 |
		let a = [];
		self.do { :x |
			let k = aBlock(x);
			let i = a.detectIndex { :y |
				k = y.key
			};
			i.ifNil {
				a.add(k -> [x])
			} {
				a[i].value.add(x)
			}
		};
		a.collect(value:/1)
	}

	gather { :self :aBlock:/2 |
		let answer = [];
		self.do { :x |
			let i = answer.detectIndex { :y |
				aBlock(x, y.anyOne)
			};
			i.ifNil {
				answer.add([x])
			} {
				answer[i].add(x)
			}
		};
		answer
	}

	interleave { :self |
		self.transposeIrregular.flatten
	}

	isJson { :self |
		self.allSatisfy(isJson:/1)
	}

	isListOf { :self :elementType |
		self.elementType = elementType
	}

	isLiteral { :self |
		self.allSatisfy(isLiteral:/1)
	}

	join { :self :level |
		(level <= 1).if {
			self.catenate
		} {
			1.toAsCollect(self.first.size, self.first.species) { :index |
				self.collect { :row |
					row[index]
				}.join(level - 1)
			}
		}
	}

	keySort { :self |
		self.sortOn(key:/1)
	}

	printString { :self :toString:/1 |
		'[%]'.format([
			self.collect(toString:/1).commaSeparated
		])
	}

	printString { :self |
		self.printString(printString:/1)
	}

	reflectionMatrix { :self |
		self := self / self.norm;
		self.size.caseOf([
			2 -> {
				let [a, b] = self;
				[
					[a.square - b.square, 2 * a * b],
					[2 * a * b, b.square - a.square]
				]
			},
			3 -> {
				let [a, b, c] = self;
				[
					[1 - (2 * a.square), -2 * a * b, -2 * a * c],
					[-2 * a * b, 1 - (2 * b.square), -2 * b * c],
					[-2 * a * c, -2 * b * c, 1 - (2 * c.square)]
				]
			}
		]) {
			'List>>reflectionMatrix: not two or three list'.error
		}
	}

	removeAll { :self |
		<primitive: return _self.splice(0);>
	}

	removeAt { :self :index |
		let removed = self[index];
		self.uncheckedRemoveAt(index);
		removed
	}

	removeAtAll { :self :indices |
		let removed = self.atAll(indices);
		indices.do { :index |
			self.uncheckedRemoveAt(index)
		};
		removed
	}

	removeFirst { :self |
		<primitive: return _self.shift();>
	}

	removeFirst { :self :count |
		<primitive: return _self.splice(0, _count);>
	}

	removeLast { :self |
		<primitive: return _self.pop();>
	}

	removeLast { :self :count |
		<primitive: return _self.splice(_self.length - _count, _count);>
	}

	scalingMatrix { :self |
		self.diagonalMatrix
	}

	species { :self |
		List:/1
	}

	storeString { :self |
		self.printString(storeString:/1)
	}

	valueSort { :self |
		self.sortOn(value:/1)
	}

	windowedReduce { :self :windowSize :aBlock:/2 |
		self.partition(windowSize.abs, 1).collect { :each |
			windowSize.isNegative.ifTrue {
				each.reverseInPlace
			};
			each.foldRight(aBlock:/2)
		}
	}

}

+@Integer {

	alternatingHarmonicSeries { :n |
		1.to(n).collect { :n |
			Fraction(-1 ^ (n + 1), n)
		}
	}

	arithmeticoGeometricSequence { :n :a :d :b :r |
		let i = arithmeticProgression(n, a, d);
		let j = geometricProgression(n, b, r);
		i * j
	}

	arithmeticProgression { :self :start :step |
		1.to(self).collect { :each |
			(step * (each - 1)) + start
		}
	}

	fill { :self :aBlock:/1 |
		let answer = List(self);
		answer.indicesDo { :index |
			answer[index] := aBlock(index)
		};
		answer
	}

	geometricProgression { :self :start :grow |
		let answer = [];
		let next = start;
		self.timesRepeat {
			answer.add(next);
			next := next * grow
		};
		answer
	}

	harmonicProgression { :self :start :step |
		1 / self.arithmeticProgression(start, step)
	}

	harmonicSeries { :self |
		Fraction(1, 1.to(self))
	}

	List { :size |
		<primitive: return Array(Number(_size)).fill(null);>
	}

	List { :size :anObject |
		let answer = List(size);
		answer.atAllPut(anObject);
		answer
	}

}

+@Number {

	linspace { :x1 :x2 :n |
		let step = (x2 - x1) / (n - 1);
		{ :x | x + step }.nestList(x1, n - 1)
	}

	logspace { :a :b :n |
		10 ^ a.linspace(b, n)
	}

}

+Void {

	List {
		<primitive: return [];>
	}

}

+@Collection {

	asList { :self |
		let answer = List(self.size);
		let index = 0;
		self.do { :each |
			index := index + 1;
			answer[index] := each
		};
		answer
	}

}

+@Sequenceable {

	asList { :self |
		let answer = List(self.size);
		self.indicesDo { :index |
			answer[index] := self[index]
		};
		answer
	}

}

+@Object {

	enclose { :self |
		[self]
	}

	nest { :self |
		self.isList.if {
			self
		} {
			[self]
		}
	}

}
