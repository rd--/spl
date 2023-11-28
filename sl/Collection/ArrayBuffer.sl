ArrayBuffer! : [Object] {

	asByteArray { :self |
		<primitive: return new Uint8Array(_self);>
	}

	asFloat64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

	byteSize { :self |
		<primitive: return _self.byteLength;>
	}

	size { :self |
		self.error('size: should not implement')
	}

}
