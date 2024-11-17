Request! : [Object] {

	url { :self |
		<primitive: return _self.url;> /* read only */
	}

}

+String {

	Request { :self |
		<primitive: return new Request(_self);>
	}

}
