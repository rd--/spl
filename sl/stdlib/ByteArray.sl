ByteArray : [Collection, SequenceableCollection, ArrayedCollection] {

	atPut { :self :anInteger :aByte |
		<primitive: if(Number.isInteger(_anInteger) && sl.isByte(_aByte)) { _self[_anInteger - 1] = _aByte; return _aByte; }>
		error('ByteArray>>atPut: index not an integer or value not a byte')
	}

	printString { :self |
		self.asArray.printString ++ '.asByteArray'
	}

}

+ Array {

	asByteArray { :self |
		| answer = ByteArray(self.size); |
		answer.fillFromWith(self, identity:/1)
	}

}

+ Number {

	ByteArray { :self |
		<primitive: return new Uint8Array(_self);>
	}

}

+ Void {

	ByteArray {
		<primitive: return new Uint8Array(0);>
	}

}
