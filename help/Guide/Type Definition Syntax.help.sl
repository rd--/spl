# Type Definition Syntax

A `Type` definition consists of a name,
an optional `Trait` list,
an opening brace (`{`),
an optional slot name list,
zero or more method definitions,
and a closing brace (`}`).

```
>>> Foo : [Object] { |bar|
>>> 	randomMutation { :self |
>>> 		self.bar := 1:99.atRandom
>>> 	}
>>> }
nil

>>> newFoo().isFoo
true
```

* * *

See also: :, {, }, Trait, Type

Guides: Defining Types, Syntax Guides, Syntax Tokens

Category: Syntax
