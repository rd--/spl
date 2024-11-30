Request! : [Object] {

	url { :self |
		<primitive: return _self.url;>
	}

}

+String {

	Request { :self |
		<primitive: return new Request(_self);>
	}

}
