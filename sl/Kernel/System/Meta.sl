+String {

	Meta { :self |
		<primitive:
		return {
			'_type': _self + '^',
			'_isMeta': true,
			'subject': _self
		}
		>
	}

}

+@Object {

	meta { :self |
		self.typeOf.Meta
	}

}
