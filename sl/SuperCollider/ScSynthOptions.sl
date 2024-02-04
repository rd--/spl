ScSynthOptions! : [Object] {

	blockSize { :self |
		<primitive: return _self.blockSize;>
	}

	hardwareBufferSize { :self |
		<primitive: return _self.hardwareBufferSize;>
	}

	numInputs { :self |
		<primitive: return _self.numInputs;>
	}

	numInputs { :self :anInteger |
		<primitive: _self.numInputs = _anInteger; return _anInteger;>
	}

	numOutputs { :self |
		<primitive: return _self.numOutputs;>
	}

	numOutputs { :self :anInteger |
		<primitive: _self.numOutputs = _anInteger; return _anInteger;>
	}

	pseudoSlotNameList { :self |
		['hardwareBufferSize', 'blockSize', 'numInputs', 'numOutputs']
	}

}
