# Type Definition Syntax

A `Type` definition consists of a name,
an optional `Trait` list,
an opening brace (`{`),
an optional slot name list,
zero or more method definitions,
and a closing brace (`}`).

~~~
Foo : [Object] { |bar|
	randomMutation { :self |
		self.bar := 1:99.atRandom
	}
}
~~~

A `Type` definition implicitly defines a constructor, a slot initializer and a predicate,
as well as methods to read and write instance variables.

* * *

See also: :, {, }, Trait, Type

Guides: Defining Types, Syntax Guides, Syntax Tokens

Category: Syntax
