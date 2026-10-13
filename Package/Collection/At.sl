/* Require: Object */

@At {

	atIfAbsent { :self :index :ifAbsent/0 |
		self.typeResponsibility('atIfPresentIfAbsent')
	}

}

+@At {

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
		self.assert('isOfSize') {
			self.size = anInteger
		}
	}

	assertIsValidIndex { :self :index |
		self.includesIndex(index).if {
			index
		} {
			self.errorInvalidIndex('assertIsValidIndex', index)
		}
	}

	[at, @] { :self :index |
		self.atIfAbsent(index) {
			self.errorInvalidIndex('at', index)
		}
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

	atPath { :self :path |
		let item = self;
		path.ifEmpty {
			self.errorInvalidIndex('atPath', path)
		} {
			path.do { :index |
				item := item[index]
			};
			item
		}
	}

}

+@At {

	indices { :self |
		self.typeResponsibility('indices')
	}

}

+@At {

	deepIndices { :self :aBlock/1 |
		let answer = [];
		self.deepIndicesStartingAtDo([]) { :each :index |
			aBlock(each).ifTrue {
				answer.add!(index)
			}
		};
		answer
	}

	deepIndices { :self |
		self.deepIndices(true.constant)
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

	errorInvalidIndex { :self :message :index |
		self.error(
			'InvalidIndex: %, i=%:%, n=%'.format(
				[message, index, index.typeOf, self.size]
			)
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
			self.error('indexOf: no such element', [anObject])
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
