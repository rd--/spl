@Equatable {

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	!= { :self :anObject |
		(self = anObject).not
	}

	equalBy { :self :anObject :aBlock:/2 |
		/* self.typeResponsibility('@Equatable>>equalBy') */
		self.hasEqualSlots(anObject, aBlock:/2)
	}

	equalByAtNamedSlots { :self :anObject :slotNameList :aBlock:/2 |
		<primitive: return _slotNameList.every(function (key) {
			return _aBlock_2(_self[key], _anObject[key]);
		});
		>
	}

	hasEqualSlots { :self :anObject :aBlock:/2 |
		self.typeOf == anObject.typeOf & {
			self.equalByAtNamedSlots(
				anObject,
				self.slotNameList,
				aBlock:/2
			)
		}
	}

	hasEqualSlots { :self :anObject |
		self.hasEqualSlots(anObject, =)
	}

	primitiveEquals { :self :anObject |
		<primitive: return _self == _anObject;>
	}

}
