@WriteStream {

	nextPut { :self :anObject |
		self.typeResponsibility('@WriteStream>>nextPut')
	}

	nextPutAll { :self :aCollection |
		aCollection.do { :each |
			self.nextPut(each)
		};
		aCollection
	}

}

+@Object {

	putOn { :self :aStream |
		aStream.nextPut(self)
	}

}

+List {

	putOn { :self :aStream |
		aStream.nextPutAll(self)
	}

}

+String {

	encodeOn { :self :aStream |
		aStream.isBinary.if {
			aStream.nextPutAll(self.utf8ByteArray)
		} {
			'String>>encodeOn: not binary stream'.error
		}
	}

}

+@Object {

	printOn { :self :aStream |
		self.printString.encodeOn(aStream)
	}

	storeOn { :self :aStream |
		self.storeString.encodeOn(aStream)
	}

}
