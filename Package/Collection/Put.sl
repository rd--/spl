/* Require: Object */

@Put {

	atAllPut { :self :anObject |
		self.indicesDo { :index |
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

	atIfAbsentPut { :self :index :ifAbsent/0 |
		self.atIfAbsent(index) {
			self[index] := ifAbsent()
		}
	}

	atModify { :self :index :defaultValue :aBlock/1 |
		self.put!(index, aBlock(self.atIfAbsent(index, { defaultValue })))
	}

	atPathPut! { :self :indices :value |
		let item = self;
		indices.ifEmpty {
			self.error('atPathPut!: empty indices')
		} {
			1.toDo(indices.size - 1) { :indicesIndex |
				let index = indices[indicesIndex];
				item := item[index]
			};
			item[indices.last] := value
		}
	}

	put! { :self :index :anObject |
		self.typeResponsibility('@Put>>put!')
	}

	put! { :self :primaryIndex :secondaryIndex :anObject |
		self.at(primaryIndex).put!(secondaryIndex, anObject)
	}

	put! { :self :primaryIndex :secondaryIndex :tertiaryIndex :anObject |
		self.at(primaryIndex).at(secondaryIndex).put!(tertiaryIndex, anObject)
	}

	put! { :self :primaryIndex :secondaryIndex :tertiaryIndex :quaternaryIndex :anObject |
		self.at(primaryIndex).at(secondaryIndex).at(tertiaryIndex).put!(quaternaryIndex, anObject)
	}

}
