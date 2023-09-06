ArrayBuffer : [Object] {

	byteSize { :self |
		<primitive: return _self.byteLength;>
	}

	size { :self |
		self.error('size: should not implement')
	}

	ByteArray { :self |
		<primitive: return new Uint8Array(_self);>
	}

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}
