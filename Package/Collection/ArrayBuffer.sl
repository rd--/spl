/* Requires: SmallFloat */

ArrayBuffer! : [Object] {

	[ByteArray, arrayBufferToByteArray] { :self |
		<primitive: return new Uint8Array(_self);>
	}

	[Float32Array, arrayBufferToFloat32Array] { :self |
		<primitive: return new Float32Array(_self);>
	}

	[Float64Array, arrayBufferToFloat64Array] { :self |
		<primitive: return new Float64Array(_self);>
	}

	byteSize { :self |
		<primitive: return _self.byteLength;>
	}

	isDetached { :self |
		<primitive: return _self.detached;>
	}

	isResizable { :self |
		<primitive: return _self.resizable;>
	}

	maxByteSize { :self |
		<primitive: return _self.maxByteLength;>
	}

	size { :self |
		self.shouldNotImplement('size: see byteSize')
	}

}

+SmallFloat {

	ArrayBuffer { :self |
		<primitive: return new ArrayBuffer(_self);>
	}

}
