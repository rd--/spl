+String {

	callSubProcess { :self :arguments |
		<primitive: return new Deno.Command(_self, {args: _arguments}).output();>
	}

}
