ByteArray : [Collection, SequenceableCollection, ArrayedCollection] {

	atPut { :self :anInteger :aByte |
		<primitive: if(Number.isInteger(_anInteger) && sl.isByte(_aByte)) { _self[_anInteger - 1] = _aByte; return _aByte; }>
		error('ByteArray>>atPut: index not an integer or value not a byte')
	}

	printString { :self |
		'ByteArray(' ++ self.asArray.printString ++ ')'
	}

	species { :self |
		ByteArray:/1
	}

}

+ Array {

	ByteArray { :self |
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
		ByteArray(0)
	}

}
