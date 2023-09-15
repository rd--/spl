(* Requires: System-Blob *)

File! : [Object, Blob] {

	lastModified { :self |
		<primitive: return _self.lastModified;> (* Read only *)
	}

	name { :self |
		<primitive: return _self.name;> (* Read only *)
	}

}
