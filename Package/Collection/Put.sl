@Put {

	atAllPut! { :self :indices :anObject |
		indices.do { :index |
			put!(self, index, anObject)
		};
		anObject
	}

	atAllPutAll! { :self :indices :values |
		indices.withDo(values) { :index :anObject |
			put!(self, index, anObject)
		};
		values
	}

	atIfAbsentPut! { :self :index :ifAbsent/0 |
		self.atIfAbsent(index) {
			let anObject = ifAbsent();
			put!(self, index, anObject)
		}
	}

	atModify! { :self :index :defaultValue :aBlock/1 |
		self.put!(
			index,
			aBlock(
				self.atIfAbsent(index) {
					defaultValue
				}
			)
		)
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
			put!(item, indices.last, value)
		}
	}

	put { :self :index :anObject |
		let answer = self.copy;
		answer.put!(index, anObject);
		answer
	}

	put! { :self :index :anObject |
		self.typeResponsibility('@Put>>put!')
	}

}
