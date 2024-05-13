{- Require: Object -}

@Indexable {

	@ { :self :index |
		self[index]
	}

	@> { :self :path |
		self.atPath(path)
	}

	@/ { :self :pathString |
		self.atPath(pathString.splitBy('/'))
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
			self.error('@Indexable>>assertIsValidIndex: no such index: ' ++ index)
		}
	}

	at { :self :index |
		self.typeResponsibility('@Indexable>>at')
	}

	at { :self :primaryIndex :secondaryIndex |
		self.at(primaryIndex).at(secondaryIndex)
	}

	at { :self :primaryIndex :secondaryIndex :tertiaryIndex |
		self.at(primaryIndex).at(secondaryIndex).at(tertiaryIndex)
	}

	at { :self :primaryIndex :secondaryIndex :tertiaryIndex :quaternaryIndex |
		self.at(primaryIndex).at(secondaryIndex).at(tertiaryIndex).at(quaternaryIndex)
	}

	atAllPut { :self :anObject |
		self.indices.do { :index |
			self[index] := anObject
		};
		anObject
	}

	atAllPut { :self :indices :anObject |
		indices.do { :index |
			self[index] := anObject
		};
		anObject
	}

	atAllPutAll { :self :indices :values |
		indices.withDo(values) { :index :value |
			self[index] := value
		};
		values
	}

	atIfAbsent { :self :index :aBlock:/0 |
		self.includesIndex(index).if {
			self[index]
		} {
			aBlock()
		}
	}

	atIfAbsentPut { :self :index :aBlock:/0 |
		self.atIfAbsent(index) {
			self[index] := aBlock()
		}
	}

	atIfPresent { :self :index :aBlock:/1 |
		self.includesIndex(index).ifTrue {
			aBlock(self[index])
		}
	}

	atIfPresentIfAbsent { :self :index :ifPresent:/1 :ifAbsent:/0 |
		self.includesIndex(index).if {
			ifPresent(self[index])
		} {
			ifAbsent()
		}
	}

	atIncrementBy { :self :index :value |
		self[index] := self[index] + value
	}

	atModify { :self :index :aBlock:/1 |
		self[index] := aBlock(self[index])
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

	atPathPut { :self :indices :value |
		let item = self;
		indices.ifEmpty {
			self.error('atPath: empty indices')
		} {
			1.toDo(indices.size - 1) { :indicesIndex |
				let index = indices[indicesIndex];
				item := item[index]
			};
			item[indices.last] := value
		}
	}

	atPut { :self :index :anObject |
		self.typeResponsibility('@Indexable>>atPut')
	}

	atPut { :self :primaryIndex :secondaryIndex :anObject |
		self.at(primaryIndex).atPut(secondaryIndex, anObject)
	}

	atPut { :self :primaryIndex :secondaryIndex :tertiaryIndex :anObject |
		self.at(primaryIndex).at(secondaryIndex).atPut(tertiaryIndex, anObject)
	}

	atPut { :self :primaryIndex :secondaryIndex :tertiaryIndex :quaternaryIndex :anObject |
		self.at(primaryIndex).at(secondaryIndex).at(tertiaryIndex).atPut(quaternaryIndex, anObject)
	}

	basicAt { :self :index |
		self.typeResponsibility('@Indexable>>basicAt')
	}

	basicAtPut { :self :index :anObject |
		self.typeResponsibility('@Indexable>>basicAtPut')
	}

	deepIndices { :self |
		self.deepIndices(true.constant)
	}

	deepIndices { :self :aBlock:/1 |
		let answer = [];
		self.deepIndicesStartingAtDo([]) { :each :index |
			aBlock(each).ifTrue {
				answer.add(index)
			}
		};
		answer
	}

	deepIndicesStartingAtDo { :self :startIndex :aBlock:/2 |
		let type = self.typeOf;
		self.withIndexDo { :each :index |
			let here = startIndex ++ [index];
			(each.typeOf = type).if {
				each.deepIndicesStartingAtDo(here, aBlock:/2)
			} {
				aBlock(each, here)
			}
		}
	}

	errorInvalidIndex { :self :for :index |
		self.error(
			[
				'errorInvalidIndex: index not correct type or out of range.',
				' index: ', index,
				' for: ', for,
				' index.typeOf: ', index.typeOf,
				' self.size: ', self.size
			].stringJoin
		)
	}

	includesIndex { :self :anObject |
		self.indices.includes(anObject)
	}

	indexOf { :self :anObject |
		self.indexOfIfAbsent(anObject) {
			self.error('@Indexable>>indexOf: no such element')
		}
	}

	indexOfIfAbsent { :self :anObject :aBlock:/0 |
		valueWithReturn { :return:/1 |
			self.indices.do { :index |
				(self[index] = anObject).ifTrue {
					index.return
				}
			};
			aBlock()
		}
	}

	indices { :self |
		self.typeResponsibility('@Indexable>>indices')
	}

	indices { :self :aBlock:/1 |
		let answer = [];
		self.withIndexDo { :each :index |
			aBlock(each).ifTrue {
				answer.add(index)
			}
		};
		answer
	}

	indicesOf { :self :anObject |
		let answer = [];
		self.withIndexDo { :each :index |
			(each = anObject).ifTrue {
				answer.add(index)
			}
		};
		answer
	}

	indicesSorted { :self |
		let answer = self.indices;
		answer.sort;
		answer
	}

	indicesDo { :self :aBlock:/1 |
		self.indices.do(aBlock:/1)
	}

	isIndexable { :self |
		true
	}

	withIndexDo { :self :elementAndIndexBlock:/2 |
		self.indices.do { :index |
			elementAndIndexBlock(self[index], index)
		}
	}

}

+@Object {

	isIndexable { :self |
		false
	}

}
