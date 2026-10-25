@Indices {

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

	atAllPut! { :self :anObject |
		self.indicesDo { :index |
			put!(self, index, anObject)
		};
		anObject
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
		let type = self.typeName;
		self.withIndexDo { :each :index |
			let here = startIndex ++ [index];
			(each.typeName = type).if {
				each.deepIndicesStartingAtDo(here, aBlock/2)
			} {
				aBlock(each, here)
			}
		}
	}

	errorInvalidIndex { :self :message :index |
		self.error(
			'InvalidIndex: %, i=%:%, n=%'.format(
				[message, index, index.typeName, self.size]
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

	indices { :self |
		self.typeResponsibility('@Indices>>indices')
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

	indicesDo { :self :aBlock/1 |
		self.indices.do(aBlock/1);
		nil
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
