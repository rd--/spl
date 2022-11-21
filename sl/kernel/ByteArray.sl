ByteArray : [Collection, SequenceableCollection, ArrayedCollection] {

	asArray { :self |
		Array(self.size).fillFromWith(self, identity)
	}

	at { :self :anInteger |
		<primitive: if(Number.isInteger(_anInteger)) { return _self[_anInteger - 1]; }>
		error('ByteArray>>at: index not an integer')
	}

	printString { :self | self.asArray.printString ++ '.asByteArray' }

	put { :self :anInteger :aByte |
		<primitive: if(Number.isInteger(_anInteger) && sl.isByte(_aByte)) { _self[_anInteger - 1] = _aByte; return _aByte; }>
		error('ByteArray>>put: index not an integer or value not a byte')
	}

	size { :self |
		<primitive: return _self.length;>
	}

}

+ Array {
	asByteArray { :self |
		| answer = ByteArray(self.size); |
		answer.fillFromWith(self, identity)
	}
}

+ Number {
	ByteArray { :self | <primitive: return new Uint8Array(_self);> }
}

+ Void {
	ByteArray { <primitive: return new Uint8Array(0);> }
}
