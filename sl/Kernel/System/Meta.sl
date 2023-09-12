+String {

	Meta { :self |
		<primitive:
		return {
			'_type': _self + '_Type',
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

(*

'x'.meta.aMetaMethod

+^String {

	aMetaMethod { :self |
		'a meta method'
	}

}

*)
