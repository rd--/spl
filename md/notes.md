# Packages

There is initial support for a "package" field at Type, Trait and Method.
The "package" field indicates the entity that "defines" the Type or Trait or Method.
(C.f. the "origin" field at Method, which indicates which Type or Trait the method is defined at.)
The idea is to have a _very_ simple notion of a _Package_.
A package is a named sequence of one or more .sl files.
For network loading it's important to be able to send requests for all required files immediately.
The primitive is _loadPackagesSequence_.
After the core is loaded there is a language level Package type.
In the simplest case of a package consisting of a single file it can be written Package(fileName).
Package names should be simple, ie. Set not Collection-Set.
Packages should be categorized, ie. the category of Set is Collection.
Packages named for types are already categorized under 'type'.
Local packages are given by 'Category' and 'Name' and the implementation file is derived as 'Category/Name.sl'.
Remove packages are given by 'Url', the first comment provides 'Name' and 'Category'.
In both cases dependencies are given by 'Requires' in first comment.
In a package index, remote packages are named by Url, local packages by a 'Package' (Category-Name) string.

# Categories

```
loadUrlSequence(['cat.sl'])
system.uncategorisedMethods
```

# Thoughts

- ProgramCollectionBrowser
- DocumentBrowser for structured texts, i.e. Adc Create Tutorial
- System -> SimpleLanguageInterpreter
- "Global" namespace
  + Are "workspace" variables a good idea?
  + Dictionary at Interpreter that can be "set"

# Self-like objects

- ⦃p: q…⦄ → PrototypeObject.newFrom(['p' -> q…])
- p‣q(r…) → p.performMessageSendWithSelfSemantics('q', [r…])

# Constants

There is a syntax for defining constants, ie. pi, e & epsilon (c.f. Kernel.sl).

Implement a dictionary for constants, either _constant_ or _system.constant_.
Instead of _Void>>unicodeFractions_ there would be _constant::unicodeFractions_
Add values such as _system.constant::epsilon = 2 ** -52_.
Defining constants in .sl library files requires adding a ConstantDefinition clause to the grammar.
To define array and dictionary constants requires adding arrayLiteral & dictionaryLiteral clauses.
In Ohm the ListOf rule is not allowed in literal contexts.

	LibraryExpression = TypeExpression | TraitExpression | ConstantDefinition
	ConstantDefinition = "constant" "::" identifier ":=" literal ";"
	literal = numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral | arrayLiteral | dictionaryLiteral
	arrayLiteral = "[" listOf<literal, ","> "]"
	dictionaryLiteral = "(" listOf<associationLiteral, ","> ")"
	associationLiteral = identifierAssociationLiteral | stringAssociationLiteral
	identifierAssociationLiteral = identifier ":" " "? literal
	stringAssociationLiteral = singleQuotedStringLiteral ":" " "? literal

	ConstantDefinition(_constant, _colonColon, name, _colonEquals, value, _semicolon) {
		return `_constant.set('${name.sourceString}', ${value.asJs});`
	},
	arrayLiteral(_l, array, _r) { return `[${commaList(array.asIteration().children)}]`; },
	dictionaryLiteral(_l, dict, _r) { return `new Map([${commaList(dict.asIteration().children)}])`; },
	identifierAssociationLiteral(lhs, _colon, _maybeSpace, rhs) { return `['${lhs.sourceString}', ${rhs.asJs}]`; },
	stringAssociationLiteral(lhs, _colon, _maybeSpace, rhs) { return `[${lhs.sourceString}, ${rhs.asJs}]`; },

# Traits For

Allow specifying existing types a Trait should apply to.
Replace definitions at multiple types (i.e. SinOsc at Array & Number & Ugen) with a Trait defined at the types (ie. @UgenInput : [Array, Number, Ugen])

# Application and Assignment

- _f()_ ⇒ apply _f_
- _f(x, ...)_ ⇒ apply _f_ to _x, ..._
- _x := y_ ⇒ assign _y_ to _x_

# Spl

- What is Spl?
- Why Spl?
- Notation?
- StdLib?
- Js-Sc3?

# Collections

Sequenceable:

- ByteArray, Float64Array - fixed size, one-indexed (Array in St)
- Array - variable sized, one-indexed (OrderedCollection in St, Array in Js)
- LinkedList - variable sized, one-indexed

Unordered:

- Set == IdentitySet (Set in Js)
- Map == IdentityDictionary - (Map in Js)
- Record == StringDictionary - (Object in Js)
- Bag

# Subtleties

The dispatch mechansim is by arity, so method calls are by definition arity-correct.
Local (anonymous) blocks however can be called at incorrect arity.
Arity checks are optionally added to non-method blocks.

System dictionary, system clock, system scheduler.
Workspace dictionary, implicitDictionary.

# Cli

- echo '{"command": "playText", "text": "SinOsc(440, 0) * 0.1"}' | netcat -C -q 0 -u 127.0.0.1 3010
- echo '{"command": "playText", "text": "Sin/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles.stc"}' | netcat -C -q 0 -u 127.0.0.1 3010
- echo '{"command": "playFile", "fileName": "/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles.stc"}' | netcat -C -q 0 -u 127.0.0.1 3010
- echo '{"command": "playFile", "fileName": "/home/rohan/sw/jssc3/help/graph/jmcc-analog-bubbles-mouse.stc"}' | netcat -C -q 0 -u 127.0.0.1 3010
- hsc3-scsynth reset

# Implications of Js

The standard library cannot assume:

- tail call optimisation
- shift/reset or call/cc

Co-routines cannot be implemented where control operators are implemented as higher-order procedures.
(Js has co-routines using _function*_ and _yield_ syntaxes.
Spl could implement a syntax, say _{! ... }_, to indicate a routine, however _yield_ cannot be called indirectly.
Idiomatic Spl requires yielding from within control structures, i.e. _{! 9.timesRepeat { 3.random.yield } }.fork_, which is not allowed.)

All Io is asynchronous, hence Promises.

# Implementation

All names, not only those that are reserved in Js, are prefixed with an underscore by the translator.

The built-in types are _unboxed_, that is they are encoded as their Js values.

User defined types, such as for Cartesian points, are encoded as records of the form _{type: 'Point', x: 0, y: 0}_.

# Smalltalk

- Control structures are implemented as procedures (no reserved words, no macro system)
- Notation to make writing arguments to control procedures concise, i.e. _(lamda () ...)_ is written _{...}_
- Trailing closure notation for control structure notation, i.e. _if(p) { q } { r }_
- Method return must be delimited, i.e. _withReturn { ... return(...) }_

# St Compatibility

- _f.(x...)_ ⇒ _f.value(x...)_

_Rationale:_ In Smalltalk sending a message and evaluating a block are distinct operations. If _f(x)_ means send the message _f_ to _x_ it cannot also mean evaluate _f_ of _x_.   This syntax allows distinguishing these two cases where Sl is used as a notation for both systems.

# Mutation

Mutation return value rules are currently as in Smalltalk, i.e. p.x(1) == 1.
Variants for _update_ and _mutate_?  Pt(0,0).x(1) == Pt(1, 0)?  p.x!(1) == 1?

# Syntax

Arguments: _{ :p :q | ... }_
Temporaries: _| p q |_ or _| p = q, r = s; |_.
Trailing closures: _if(p) { q } { r }_ &etc.
Keywords: _p.at(q, put: r)_ could mean _p.atPut(q, r)_.

# Exceptions

_return_ and _withReturn_ should operate using a distinct type.
At present _withReturn_ re-throws any value that is an instance of _Error_.
_ifError_ is after St.

# Types

Built-in types are the underlying type.
Some are renamed (_Object_ ⇒ _Record_)
Ordinary types have a _type_ field that names the type.
Js types will be inferred as _value.constructor.name_.

# Prelude

Prelude is both _kernel_ and _stdlib_.

# Primitive

The <primitive> notation could include a language field, so that Js and Scheme implementations could be written in the same method.

# Trailing Array Syntax

A _trailing array_ syntax would be like trailing closure syntax.
_f(p) [q..] [r..]_ would mean _f(p, [q..], [r..])_.
However this conflicts with [At Syntax], where _c[i]_ means _c.at(i)_.

# Array Syntax

_[1, 2, 3; 4, 5, 6]_ could mean _[[1, 2, 3], [4, 5, 6]]_.
_[1, 2; 3, 4;; 5, 6; 7, 8] could mean [[[1, 2], [3, 4]], [[5, 6], [7, 8]]].
And so on.
c[1; 2] could mean c[1][2]
c[1, 2; 3, 4] could mean c[1, 2][3, 4] meaning [c[1][3, 4], c[2][3, 4]]

# String Traits

If Strings are made Collections and SequenceableCollections then:

````
'string'.last = 'g'
'string'.includes('i')
'string'.indexOf('i') = 4
'string'.atWrap(13) = 's'
var a = Array(6); 'string'.collectInto({ :each | each.toUpperCase }, a); a.join = 'STRING'
'string'.atRandom.isString = true
````

However, Strings are not collections in the ordinary sense.

# Ohm

- Whitespace is implicitly skipped inside a rule application if the
	rule name begins with an uppercase letter.  (A syntactic rule is a
	rule whose name begins with an uppercase letter, and lexical rule
	is one whose name begins with a lowercase letter.)

# Input/Output

```
system.window.fetch('./text/smallhours-programs.text').then { :aResponse |
	aResponse.text.then { :aString |
		aString.postLine
	}
}

system.window.fetchString('./text/smallhours-programs.text').then { :aString |
	aString.lines.collect { :each | each.splitRegExp(RegExp(' - |/')) }.postLine
}

system.window.fetch('./png/os.512.png').then { :aResponse |
	aResponse.byteArray.then { :aByteArray |
		aByteArray.size.postLine
	}
}

system.window.fetchByteArray('./png/os.512.png').then { :aByteArray |
	aByteArray.size.postLine
}
```

# Unicode

- U+0021 ! Exclamation Mark
- U+0024 $ Dollar Sign
- U+0025 % Percent Sign
- U+0026 & Ampersand
- U+002a * Asterisk
- U+002b + Plus Sign
- U+002d - Hyphen-Minus
- U+002f / Solidus
- U+003c < Less-Than Sign
- U+003d = Equals Sign
- U+003e > Greater-Than Sign
- U+003f ? Question Mark
- U+0040 @ Commercial At
- U+005c \ Reverse Solidus
- U+005e ^ Circumflex Accent
- U+007c | Vertical Line
- U+007c | Vertical Line
- U+007e ~ Tilde
- U+00a6 ¦ Broken Bar
- U+00a7 § Section Sign
- U+00ac ¬ Not Sign
- U+00b0 ° Degree Sign
- U+00b1 ± Plus-Minus Sign
- U+00b6 ¶ Pilcrow Sign
- U+00b7 · Middle Dot
- U+00d7 × Multiplication Sign
- U+00f7 ÷ Division Sign
- U+02d9 ˙ Dot Above
- U+03a0 Π Greek Capital Letter Pi
- U+03a3 Σ Greek Capital Letter Sigma
- U+03bb Λ Greek Small Letter Lamda
- U+03c0 Π Greek Small Letter Pi
- U+2016 ‖ Double Vertical Line
- U+2020 † Dagger
- U+2021 ‡ Double Dagger
- U+2022 • Bullet
- U+2026 … Horizontal Ellipsis
- U+2043 ⁃ Hyphen Bullet
- U+2044 ⁄ Fraction Slash
- U+204b ⁋ Reversed Pilcrow Sign
- U+2052 ⁒ Commercial Minus Sign
- U+207a ⁺ Superscript Plus Sign
- U+207b ⁻ Superscript Minus
- U+207c ⁼ Superscript Equals Sign
- U+207d ⁽ Superscript Left Parenthesis
- U+207e ⁾ Superscript Right Parenthesis
- U+208a ₊ Subscript Plus Sign
- U+208b ₋ Subscript Minus
- U+208c ₌ Subscript Equals Sign
- U+208d ₍ Subscript Left Parenthesis
- U+208e ₎ Subscript Right Parenthesis
- U+2190 ← Leftwards Arrow
- U+2191 ↑ Upwards Arrow
- U+2192 → Rightwards Arrow
- U+2193 ↓ Downwards Arrow
- U+21d2 ⇒ Rightwards Double Arrow
- U+21e0 ⇠ Leftwards Dashed Arrow
- U+2209 ∉ Not An Element Of
- U+220c ∌ Does Not Contain As Member
- U+2212 − Minus Sign
- U+2213 ∓ Minus-Or-Plus Sign
- U+2215 ∕ Division Slash
- U+2219 ∙ Bullet Operator
- U+2223 ∣ Divides
- U+2227 ∧ Logical And
- U+2228 ∨ Logical And
- U+2248 ≈ Almost Equal To
- U+2254 ≔ Colon Equals
- U+2260 ≠ Not Equal To
- U+2261 ≡ Identical To
- U+2262 ≢ Not Identical To
- U+2264 ≤ Less-Than Or Equal To
- U+2265 ≥ Greater-Than Or Equal To
- U+226a ≪ Much Less-Than
- U+226b ≫ Much Greater-Than
- U+226e ≮ Not Less-Than
- U+226f ≯ Not Greater-Than
- U+229c ⊜ Circled Equals
- U+22a1 ⊡ Squared Dot Operator
- U+22a4 ⊤ Down Tack
- U+22ba ⊺ Intercalate
- U+22c5 ⋅ Dot Operator
- U+22ee ⋮ Vertical Ellipsis
- U+22ef ⋯ Midline Horizontal Ellipsis
- U+25cb ○ White Circle
- U+25cf ● Black Circle
- U+261b ☛ Black Right Pointing Index
- U+261e ☞ White Right Pointing Index
- U+2628 ☨ Cross Of Lorraine
- U+271d ✝ Latin Cross
- U+2761 ❡ Curved Stem Paragraph Sign Ornament
- U+27f5 ⟵ Long Leftwards Arrow
- U+27f6 ⟶ Long Rightwards Arrow
- U+27f9 ⟹ Long Rightwards Double Arrow
- U+2919 ⤙ Leftwards Arrow-Tail
- U+291b ⤛ Leftwards Double Arrow-Tail
- U+291d ⤝ Leftwards Arrow To Black Diamond
- U+29bf ⦿ Circled Bullet
- U+29fa ⧺ Double Plus
- U+2e3f ⸿ Capitulum
- U+2e4d ⹍ Paragraphus Mark
- U+2a74 ⩴ Double Colon Equal
- U+2a75 ⩵ Two Consecutive Equals Signs
- U+2a76 ⩶ Three Consecutive Equals Signs
- U+2a7d ⩽ Less-Than Or Slanted Equal To
- U+2a7e ⩾ Greater-Than Or Slanted Equal To
- U+2e38 ⸸ Turned Dagger
- U+2e4b ⹋ Triple Dagger
