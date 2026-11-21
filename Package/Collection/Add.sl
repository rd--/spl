@Add {

	add! { :self :anObject |
		self.typeResponsibility('@Add>>add!')
	}

	addAll! { :self :aCollection |
		aCollection.do { :each |
			self.add!(each)
		};
		aCollection
	}

	addAllIfNotPresent! { :self :aCollection |
		aCollection.do { :each |
			self.addIfNotPresent!(each)
		}
	}

	addIfNotPresent! { :self :anObject |
		self.includes(anObject).ifFalse {
			self.add!(anObject)
		};
		anObject
	}

	addIfNotPresentBy! { :self :anObject :aFunction/2 |
		self.includesBy(anObject, aFunction/2).ifFalse {
			self.add!(anObject)
		};
		anObject
	}

	addUtf8Encoded! { :self :aString |
		self.addAll!(aString.utf8ByteArray)
	}

	addWithOccurrences! { :self :newObject :anInteger |
		anInteger.timesRepeat {
			self.add!(newObject)
		};
		newObject
	}

	[concatenation, ++] { :self :aCollection |
		let answer = self.copy;
		answer.addAll!(aCollection.assertIsCollection);
		answer
	}

	copyWith { :self :newElement |
		let answer = self.copy;
		answer.add!(newElement);
		answer
	}

	extendToSize! { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add!(nil)
		};
		self
	}

	fillFromWith! { :self :aCollection :aFunction/1 |
		aCollection.do { :each |
			self.add!(aFunction(each))
		}
	}

	ifAbsentAdd! { :self :anObject |
		self.includes(anObject).if {
			false
		} {
			self.add!(anObject);
			true
		}
	}

	include! { :self :anObject |
		/* self.typeResponsibility('@Add>>include!') */
		self.add!(anObject)
	}

	includeAll! { :self :aCollection |
		aCollection.do { :each |
			self.include!(each)
		};
		aCollection
	}

	intersperse { :self :anObject |
		let answer = self.new;
		self.doSeparatedBy { :each |
			answer.add!(each)
		} {
			answer.add!(anObject)
		};
		answer
	}

	select { :self :aFunction/1 |
		let answer = self.new;
		self.do { :each |
			aFunction(each).ifTrue {
				answer.include!(each)
			}
		};
		answer
	}

	selectThenCollect { :self :selectFunction/1 :collectFunction/1 |
		let answer = self.new;
		self.selectThenDo(selectFunction/1) { :each |
			answer.add!(collectFunction(each))
		};
		answer
	}

	union { :self :aCollection |
		let answer = self.copy;
		answer.includeAll!(aCollection);
		answer
	}

}
