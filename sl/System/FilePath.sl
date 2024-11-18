+String {

	pathDirectory { :self |
		<primitive: return sc.pathDirectory(_self);>
	}

	pathExtension { :self |
		<primitive: return sc.pathExtension(_self);>
	}

	pathIsAbsolute { :self |
		<primitive: return sc.pathIsAbsolute(_self);>
	}

	pathNormalize { :self |
		<primitive: return sc.pathNormalize(_self);>
	}

}

+List {

	pathJoin { :self |
		<primitive: return sc.pathJoin(_self);>
	}

}
