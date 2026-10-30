Dictionary : [Object, Copy, Store, Equal, Do, At, Indices, Put, Collection, Add, Remove, Dictionary] {

	| keys values comparator |

	atIfAbsent { :self :key :ifAbsent/0 |
		let index = self.keys.indexOfBy(key, self.comparator);
		(index = 0).if {
			ifAbsent()
		} {
			self.values[index]
		}
	}

	keysAndValuesDo { :self :aBlock/2 |
		let keys = self.keys;
		let values = self.values;
		let size = keys.size;
		1.toDo(size) { :index |
			aBlock(keys[index], values[index])
		}
	}

	postCopy { :self |
		self.keys := self.keys.copy;
		self.values := self.values.copy
	}

	put! { :self :key :value |
		let index = self.keys.indexOfBy(key, self.comparator);
		(index = 0).if {
			self.keys.add!(key);
			self.values.add!(value)
		} {
			self.values[index] := value
		};
		value
	}

	size { :self |
		self.keys.size
	}

	storeString { :self |
		'Dictionary(%)'.format([self.associations])
	}

	storeStringLiteral { :self |
		self.storeStringLiteral(
			'[| |]',
			'[|', '|]',
			storeString/1, ' -> ', storeString/1
		)
	}

}

+Void {

	[Dictionary, emptyDictionary] {
		newDictionary().initializeSlots([], [], =)
	}

}

+List {

	assocationListToDicionary { :self |
		self.collect(
			keyAndValue/1
		).listToDictionary
	}

	Dictionary { :self |
		self.isEmpty.if {
			Dictionary()
		} {
			self.isAssociationList.if {
				self.assocationListToDicionary
			} {
				self.listToDictionary
			}
		}
	}

	listToDictionary { :self |
		let [_, m] = self.dimensions(2);
		(m = 2).if {
			self.twoColumnMatrixToDictionary
		} {
			self.error('List>>listToDictionary')
		}
	}

	twoColumnMatrixToDictionary { :self |
		let [keys, values] = self.transpose;
		let answer = Dictionary();
		answer.keys := keys;
		answer.values := values;
		answer
	}

}

+Block {

	comparatorToEmptyDictionary { :comparator/2 |
		[
			{ comparator/2 == = } -> { Dictionary() },
			{ comparator/2 == == } -> { Map() },
			{ true } -> {
				comparator/2.error('comparatorToEmptyDictionary')
			}
		].which
	}

}
