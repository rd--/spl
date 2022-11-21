ByteArray : [Collection, SequenceableCollection, ArrayedCollection] {

	printString { :self |
		self.asArray.printString ++ '.asByteArray'
	}

	put { :self :anInteger :aByte |
		<primitive: if(Number.isInteger(_anInteger) && sl.isByte(_aByte)) { _self[_anInteger - 1] = _aByte; return _aByte; }>
		error('ByteArray>>put: index not an integer or value not a byte')
	}

}

+ Array {

	asByteArray { :self |
		| answer = ByteArray(self.size); |
		answer.fillFromWith(self, identity)
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
