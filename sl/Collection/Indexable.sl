(* Require: Object *)

@Indexable {

	assertIsValidIndex { :self :index |
		self.includesIndex(index).if {
			index
		} {
			self.error('@Indexable>>assertIsValidIndex: no such index: ' ++ index)
		}
	}

	at { :self :index |
		self.error('@Indexable>>at: type responsibility')
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

	atIfAbsentPut { :self :index :aProcedure:/0 |
		self.atIfAbsent(index) {
			self[index] := aProcedure()
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
		self[index] +:= value
	}

	atModify { :self :index :aBlock:/1 |
		self[index] := aBlock(self[index])
	}

	atPath { :self :indices |
		| item = self; |
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
		| item = self; |
		indices.ifEmpty {
			self.error('atPath: empty indices')
		} {
			1.toDo(indices.size - 1) { :indicesIndex |
				| index = indices[indicesIndex]; |
				item := item[index]
			};
			item[indices.last] := value
		}
	}

	atPut { :self :index :anObject |
		self.error('@Indexable>>atPut: type responsibility')
	}

	basicAt { :self :index |
		self.error('@Indexable>>basicAt: type responsibility')
	}

	basicAtPut { :self :index :anObject |
		self.error('@Indexable>>basicAtPut: type responsibility')
	}

	errorInvalidIndex { :self :for :index |
		self.error([
			'errorInvalidIndex: index not correct type or out of range.',
			' index: ', index,
			' for: ', for,
			' index.typeOf: ', index.typeOf,
			' self.size: ', self.size
		].join)
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
		self.error('@Indexable>>indices: type responsibility')
	}

	indicesSorted { :self |
		| answer = self.indices; |
		answer.sort;
		answer
	}

	indicesDo { :self :aBlock:/1 |
		self.indices.do(aBlock:/1)
	}

	isIndexable { :self |
		true
	}

	withIndexDo { :self :elementAndIndexProcedure:/2 |
		self.indices.do { :index |
			elementAndIndexProcedure(self[index], index)
		}
	}

}

+@Object {

	isIndexable { :self |
		false
	}

}
