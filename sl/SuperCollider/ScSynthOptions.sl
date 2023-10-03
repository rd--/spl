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

	numOutputs { :self |
		<primitive: return _self.numOutputs;>
	}

	pseudoSlotNameArray { :self |
		['hardwareBufferSize', 'blockSize', 'numInputs', 'numOutputs']
	}

}
