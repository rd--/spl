@Extensible {

	addInPlace { :self :anObject |
		self.typeResponsibility('@Extensible>>addInPlace')
	}

	addAllInPlace { :self :aCollection |
		aCollection.do { :each |
			self.addInPlace(each)
		};
		aCollection
	}

	addAllIfNotPresent { :self :aCollection |
		aCollection.do { :each |
			self.addIfNotPresent(each)
		}
	}

	addIfNotPresent { :self :anObject |
		self.includes(anObject).ifFalse {
			self.addInPlace(anObject)
		};
		anObject
	}

	addIfNotPresentBy { :self :anObject :aBlock/2 |
		self.includesBy(anObject, aBlock/2).ifFalse {
			self.addInPlace(anObject)
		};
		anObject
	}

	addWithOccurrences { :self :newObject :anInteger |
		anInteger.timesRepeat {
			self.addInPlace(newObject)
		};
		newObject
	}

	fillFromWith { :self :aCollection :aBlock/1 |
		aCollection.do { :each |
			self.addInPlace(aBlock(each))
		}
	}

	ifAbsentAddInPlace { :self :anObject |
		self.includes(anObject).if {
			false
		} {
			self.addInPlace(anObject);
			true
		}
	}

	includeInPlace { :self :anObject |
		/* self.typeResponsibility('@Extensible>>include') */
		self.addInPlace(anObject)
	}

	includeAllInPlace { :self :aCollection |
		aCollection.do { :each |
			self.includeInPlace(each)
		};
		aCollection
	}

	intersperse { :self :anObject |
		let answer = self.species.new;
		self.doSeparatedBy { :each |
			answer.addInPlace(each)
		} {
			answer.addInPlace(anObject)
		};
		answer
	}

	removeInPlace { :self :oldObject |
		self.removeIfAbsent(oldObject) {
			self.errorNotFound(oldObject)
		}
	}

	removeAllInPlace { :self |
		self.do { :each |
			self.removeInPlace(each)
		}
	}

	removeAllInPlace { :self :aCollection |
		(aCollection == self).if {
			self.removeAllInPlace
		} {
			aCollection.do { :each |
				self.removeInPlace(each)
			}
		}
	}

	removeAllEqualTo { :self :oldObject |
		self.removeAllSuchThat { :each |
			each = oldObject
		}
	}

	removeAllFoundIn { :self :aCollection |
		aCollection.do { :each |
			self.removeIfAbsent(each) {
			}
		};
		aCollection
	}

	removeAllSuchThat { :self :aBlock/1 |
		self.copy.do { :each |
			aBlock(each).ifTrue {
				self.removeInPlace(each)
			}
		}
	}

	removeIfAbsent { :self :oldObject :anExceptionBlock |
		self.typeResponsibility('@Extensible>>removeIfAbsent')
	}

	union { :self :aCollection |
		let answer = self.copy;
		answer.includeAllInPlace(aCollection);
		answer
	}

	withoutInPlace { :self :oldObject |
		self.removeAllSuchThat { :each |
			each = oldObject
		};
		self
	}

	withoutAllInPlace { :self :aCollection |
		self.removeAllSuchThat { :each |
			aCollection.includes(each)
		};
		self
	}

}
