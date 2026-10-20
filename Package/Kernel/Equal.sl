@Equal {

	hasEqualSlots { :self :anObject :aBlock/2 |
		self.typeName = anObject.typeName & {
			self.isEqualByAtNamedSlots(
				anObject,
				self.slotNameList,
				aBlock/2
			)
		}
	}

	hasEqualSlots { :self :anObject |
		self.hasEqualSlots(anObject, isEqual/2)
	}

	isEqual { :y |
		{ :x |
			isEqual(x, y)
		}
	}

	[isEqual, =] { :self :anObject |
		self.isEqualBy(anObject, isEqual/2)
	}

	isEqualBy { :self :anObject :aBlock/2 |
		/* self.typeResponsibility('@Equal>>isEqualBy') */
		self.hasEqualSlots(anObject, aBlock/2)
	}

	isEqualByAtNamedSlots { :self :anObject :slotNameList :aBlock/2 |
		<primitive: return _slotNameList.every(function (key) {
			return _aBlock_2(_self[key], _anObject[key]);
		});
		>
	}

	isEqualOn { :self :operand :f/1 |
		isEqual(f(self), f(operand))
	}

	[isSimilar, ~] { :self :anObject |
		self.isEqualBy(anObject, ~)
	}

	[isUnequal, !=] { :self :anObject |
		isEqual(self, anObject).not
	}

}
