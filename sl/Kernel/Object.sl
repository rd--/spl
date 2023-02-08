@Object {

	~= { :self :anObject |
		not(self = anObject)
	}

	== { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	~~ { :self :anObject |
		<primitive: return _self !== _anObject;>
	}

	asString { :self |
		self.printString
	}

	caseOf { :self :aBlockAssociationCollection |
		self.caseOfOtherwise(aBlockAssociationCollection) { :case |
			('Case not found, and no otherwise clause: ' ++  case.printString).error
		}
	}

	caseOfOtherwise { :self :aBlockAssociationCollection :otherwise:/1 |
		withReturn {
			aBlockAssociationCollection.associationsDo { :assoc |
				(assoc.key.value = self).ifTrue {
					assoc.value.value.return
				}
			};
			self.otherwise
		}
	}

	identity { :self |
		self
	}

	printString { :self |
		self.typeOf
	}

	return { :self |
		<primitive: throw _self;>
	}

	throw { :self |
		<primitive: throw _self;>
	}

	typeOf { :self |
		<primitive: return sl.typeOf(_self)>
	}

	value { :self |
		self
	}

}
