+String {

	systemCommand { :self :arguments |
		<primitive:
		return new Deno.Command(_self, {args: _arguments}).output().then(function(result) {
			return result.code;
		});
		>
	}

}
