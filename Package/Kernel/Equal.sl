@Equal {

	[equal, =] { :self :anObject |
		self.equalBy(anObject, equal:/2)
	}

	equalBy { :self :anObject :aBlock:/2 |
		/* self.typeResponsibility('@Equal>>equalBy') */
		self.hasEqualSlots(anObject, aBlock:/2)
	}

	equalByAtNamedSlots { :self :anObject :slotNameList :aBlock:/2 |
		<primitive: return _slotNameList.every(function (key) {
			return _aBlock_2(_self[key], _anObject[key]);
		});
		>
	}

	equalTo { :y |
		{ :x |
			equal(x, y)
		}
	}

	hasEqualSlots { :self :anObject :aBlock:/2 |
		self.typeOf = anObject.typeOf & {
			self.equalByAtNamedSlots(
				anObject,
				self.slotNameList,
				aBlock:/2
			)
		}
	}

	hasEqualSlots { :self :anObject |
		self.hasEqualSlots(anObject, equal:/2)
	}

	primitiveEquals { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	[similar, ~] { :self :anObject |
		self.equalBy(anObject, ~)
	}

	[unequal, !=] { :self :anObject |
		equal(self, anObject).not
	}

}
