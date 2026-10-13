/* Require: Object */

@At {

	@* { :self :indexList |
		self.atAll(indexList)
	}

	@> { :self :path |
		self.atPath(path)
	}

	@/ { :self :pathString |
		self.atPath(
			pathString.splitBy('/')
		)
	}

	assertIsOfSize { :self :anInteger |
		self.assert {
			self.size = anInteger
		}
	}

	assertIsValidIndex { :self :index |
		self.includesIndex(index).if {
			index
		} {
			self.error('assertIsValidIndex: no such index', [index])
		}
	}

	[at, @] { :self :index |
		self.atIfAbsent(index) {
			self.error('at: invalid index', [index])
		}
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		self.typeResponsibility('atIfPresentIfAbsent')
	}

	atIfPresent { :self :index :ifPresent/1 |
		self.atIfPresentIfAbsent(
			index,
			ifPresent/1,
			{ nil }
		)
	}

	atIfPresentIfAbsent { :self :index :ifPresent/1 :ifAbsent/0 |
		let isPresent = true;
		let answer = self.atIfAbsent(index) {
			isPresent := false;
			ifAbsent()
		};
		isPresent.if {
			ifPresent(answer)
		} {
			answer
		}
	}

	atIncrementBy { :self :index :value |
		self[index] := self[index] + value
	}

	atLinear { :self :index |
		self.atPath(self.shape.cartesianIndex(index))
	}

	atOrMissing { :self :index |
		self.atIfAbsent(index) {
			Missing('NotAvailable', index)
		}
	}

	atOrNil { :self :index |
		self.atIfAbsent(index) {
			nil
		}
	}

	atPath { :self :indices |
		let item = self;
		indices.ifEmpty {
			self.error('atPath: empty indices')
		} {
			indices.do { :index |
				item := item[index]
			};
			item
		}
	}

	deepIndices { :self |
		self.deepIndices(true.constant)
	}

	deepIndices { :self :aBlock/1 |
		let answer = [];
		self.deepIndicesStartingAtDo([]) { :each :index |
			aBlock(each).ifTrue {
				answer.add!(index)
			}
		};
		answer
	}

	deepIndicesOf { :self :anObject |
		let answer = [];
		self.withDeepIndexDo { :each :index |
			(each = anObject).ifTrue {
				answer.add!(index)
			}
		};
		answer
	}

	deepIndicesStartingAtDo { :self :startIndex :aBlock/2 |
		let type = self.typeOf;
		self.withIndexDo { :each :index |
			let here = startIndex ++ [index];
			(each.typeOf = type).if {
				each.deepIndicesStartingAtDo(here, aBlock/2)
			} {
				aBlock(each, here)
			}
		}
	}

	errorInvalidIndex { :self :for :index |
		self.error(
			[
				'errorInvalidIndex: index not correct type or out of range.',
				'index:', index.printString,
				'for:', for,
				'index.typeOf:', index.typeOf,
				'self.size:', self.size.printString
			].unwords
		)
	}

	includesIndex { :self :anObject |
		self.indices.includes(anObject)
	}

	includesIndices { :self :aCollection |
		self.indices.includesAll(aCollection)
	}

	indexOf { :self :anObject |
		self.indexOfIfAbsent(anObject) {
			self.error('indexOf: no such element')
		}
	}

	indexOfIfAbsent { :self :anObject :aBlock/0 |
		withReturn { :return/1 |
			self.indicesDo { :index |
				(self[index] = anObject).ifTrue {
					index.return
				}
			};
			aBlock()
		}
	}

	indices { :self |
		self.typeResponsibility('indices')
	}

	indices { :self :aBlock/1 |
		let answer = [];
		self.withIndexDo { :each :index |
			aBlock(each).ifTrue {
				answer.add!(index)
			}
		};
		answer
	}

	indicesOf { :self :anObject |
		self.indices { :each |
			each = anObject
		}
	}

	indicesSorted { :self |
		let answer = self.indices;
		answer.sort;
		answer
	}

	indicesDo { :self :aBlock/1 |
		self.indices.do(aBlock/1);
		nil
	}

	isIndexable { :self |
		true
	}

	positionIndex { :self |
		let answer = Map();
		self.withIndexDo { :each :index |
			answer.includesKey(each).if {
				answer.at(each).add!(index)
			} {
				answer.put!(each, [index])
			}
		};
		answer
	}

	positionSmallest { :self |
		let x = self.min;
		self.indicesOf(x)
	}

	positionSmallest { :self :n |
		let x = self.sort;
		1.to(n).collect { :y |
			self.indicesOf(x[y])
		}
	}

	withDeepIndexDo { :self :elementAndIndexBlock/2 |
		self.deepIndices.do { :index |
			elementAndIndexBlock(self.atPath(index), index)
		}
	}

	withIndexDo { :self :elementAndIndexBlock/2 |
		self.indicesDo { :index |
			elementAndIndexBlock(self[index], index)
		}
	}

}

+@Object {

	isIndexable { :self |
		false
	}

}
