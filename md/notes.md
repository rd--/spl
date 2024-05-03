# Keyed

Keyed as Trait, implemented by Map and Record.

# Help

Help provides category names, after final '-- ' on initial line.
HelpIndex as Spl package.
Document adverbs.

# Constructor

Allow _type_ declarations at slots, and if one is provided for the first slot make constructor.
Type declarations could be written _| size<@Integer> |_, or | size:@Integer |
See Graph for an instance where the constructor would be elided in this case.

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
var a = Array(6); 'string'.collectInto({ :each | each.asUpperCase }, a); a.join = 'STRING'
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
system.window.fetch('./text/SmallHoursPrograms.text').then { :aResponse |
	aResponse.text.then { :aString |
		aString.postLine
	}
}

system.window.fetchString('./text/SmallHoursPrograms.text').then { :aString |
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
- U+0023 # Number Sign
- U+0024 $ Dollar Sign
- U+0025 % Percent Sign
- U+0026 & Ampersand
- U+0027 ' Apostrophe
- U+002E . Full Stop
- U+002a * Asterisk
- U+002b + Plus Sign
- U+002d - Hyphen-Minus
- U+002f / Solidus
- U+003A : Colon
- U+003B ; Semicolon
- U+003c < Less-Than Sign
- U+003d = Equals Sign
- U+003e > Greater-Than Sign
- U+003f ? Question Mark
- U+0040 @ Commercial At
- U+005c \ Reverse Solidus
- U+005e ^ Circumflex Accent
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
- U+028c Ʌ Latin Small Letter Turned V
- U+02c6 ˆ Modifier Letter Circumflex Accent
- U+02d9 ˙ Dot Above
- U+039b Λ Greek Capital Letter Lamda
- U+03a0 Π Greek Capital Letter Pi
- U+03a3 Σ Greek Capital Letter Sigma
- U+03bb Λ Greek Small Letter Lamda
- U+03c0 Π Greek Small Letter Pi
- U+1019a 𐆚 Roman As Sign
- U+2014 — Em Dash
- U+2016 ‖ Double Vertical Line
- U+2018 ‘ Left Single Quotation Mark
- U+2019 ’ Right Single Quotation Mark
- U+2020 † Dagger
- U+2021 ‡ Double Dagger
- U+2022 • Bullet
- U+2024 ․ One Dot Leader
- U+2025 ‥ Two Dot Leader
- U+2026 … Horizontal Ellipsis
- U+2038 ‸ Caret
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
- U+2194 ↔ Left Right Arrow
- U+21d2 ⇒ Rightwards Double Arrow
- U+21e0 ⇠ Leftwards Dashed Arrow
- U+21e2 ⇢ Rightwards Dashed Arrow
- U+2208 ∈ Element Of
- U+2209 ∉ Not An Element Of
- U+220b ∋ Contains As Member
- U+220c ∌ Does Not Contain As Member
- U+2212 − Minus Sign
- U+2213 ∓ Minus-Or-Plus Sign
- U+2215 ∕ Division Slash
- U+2219 ∙ Bullet Operator
- U+2223 ∣ Divides
- U+2227 ∧ Logical And
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
- U+227a ≺ Precedes
- U+227b ≻ Succeeds
- U+227c ≼ Precedes Or Equal To
- U+227d ≽ Succeeds Or Equal To
- U+227e ≾ Precedes Or Equivalent To
- U+227f ≿ Succeeds Or Equivalent To
- U+2280 ⊀ Does Not Precede
- U+2281 ⊁ Does Not Succeed
- U+2282 ⊂ Subset Of
- U+2283 ⊃ Superset Of
- U+2284 ⊄ Not A Subset Of
- U+2285 ⊅ Not A Superset Of
- U+2286 ⊆ Subset Of Or Equal To
- U+2287 ⊇ Superset Of Or Equal To
- U+2288 ⊈ Neither A Subset Of Nor Equal To
- U+2289 ⊉ Neither A Superset Of Nor Equal To
- U+228a ⊊ Subset Of With Not Equal To
- U+228b ⊋ Superset Of With Not Equal To
- U+228c ⊌ Multiset
- U+228d ⊍ Multiset Multiplication
- U+228e ⊎ Multiset Union
- U+229a ⊚ Circled Ring Operator
- U+229b ⊛ Circled Asterisk Operator
- U+229c ⊜ Circled Equals
- U+22a1 ⊡ Squared Dot Operator
- U+22a4 ⊤ Down Tack
- U+22a5 ⊥ Up Tack
- U+22a7 ⊧ Models
- U+22a8 ⊨ True
- U+22a9 ⊩ Forces
- U+22aa ⊪ Triple Vertical Bar Right Turnstile
- U+22ab ⊫ Double Vertical Bar Double Right Turnstile
- U+22ac ⊬ Does Not Prove
- U+22ad ⊭ Not True
- U+22ae ⊮ Does Not Force
- U+22af ⊯ Negated Double Vertical Bar Double Right Turnstile
- U+22b0 ⊰ Precedes Under Relation
- U+22b1 ⊱ Succeeds Under Relation
- U+22b2 ⊲ Normal Subgroup Of
- U+22b3 ⊳ Contains As Normal Subgroup
- U+22b4 ⊴ Normal Subgroup Of Or Equal To
- U+22b5 ⊵ Contains As Normal Subgroup Or Equal To
- U+22b6 ⊶ Original Of
- U+22b7 ⊷ Image Of
- U+22b8 ⊸ Multimap
- U+22b9 ⊹ Hermitian Conjugate Matrix
- U+22ba ⊺ Intercalate
- U+22ba ⊺ Intercalate
- U+22bb ⊻ \Veebar, \Xor Xor
- U+22bc ⊼ \Barwedge, \Nand Nand
- U+22bd ⊽ \Barvee, \Nor Nor
- U+22be ⊾ Right Angle With Arc
- U+22bf ⊿ Right Triangle
- U+22c0 ⋀ N-Ary Logical And
- U+22c1 ⋁ N-Ary Logical Or
- U+22c2 ⋂ N-Ary Intersection
- U+22c3 ⋃ N-Ary Union
- U+22c4 ⋄ Diamond Operator
- U+22c5 ⋅ Dot Operator
- U+22c6 ⋆ Star Operator
- U+22c7 ⋇ Division Times
- U+22c8 ⋈ Bowtie
- U+22c9 ⋉ Left Normal Factor Semidirect Product
- U+22ca ⋊ Right Normal Factor Semidirect Product
- U+22cb ⋋ Left Semidirect Product
- U+22cc ⋌ Right Semidirect Product
- U+22cd ⋍ Reversed Tilde Equals
- U+22ce ⋎ Curly Logical Or
- U+22cf ⋏ Curly Logical And
- U+22d0 ⋐ Double Subset
- U+22d1 ⋑ Double Superset
- U+22d2 ⋒ Double Intersection
- U+22d3 ⋓ Double Union
- U+22d4 ⋔ Pitchfork
- U+22d5 ⋕ Equal And Parallel To
- U+22d6 ⋖ Less-Than With Dot / Less Than With Dot
- U+22d7 ⋗ Greater-Than With Dot / Greater Than With Dot
- U+22d8 ⋘ Very Much Less-Than / Very Much Less Than
- U+22d9 ⋙ Very Much Greater-Than / Very Much Greater Than
- U+22da ⋚ Less-Than Equal To Or Greater-Than / Less Than Equal To Or Greater Than
- U+22db ⋛ Greater-Than Equal To Or Less-Than / Greater Than Equal To Or Less Than
- U+22dc ⋜ Equal To Or Less-Than / Equal To Or Less Than
- U+22dd ⋝ Equal To Or Greater-Than / Equal To Or Greater Than
- U+22de ⋞ Equal To Or Precedes
- U+22df ⋟ Equal To Or Succeeds
- U+22e0 ⋠ Does Not Precede Or Equal
- U+22e1 ⋡ Does Not Succeed Or Equal
- U+22e2 ⋢ Not Square Image Of Or Equal To
- U+22e3 ⋣ Not Square Original Of Or Equal To
- U+22e4 ⋤ Square Image Of Or Not Equal To
- U+22e5 ⋥ Square Original Of Or Not Equal To
- U+22e6 ⋦ Less-Than But Not Equivalent To / Less Than But Not Equivalent To
- U+22e7 ⋧ Greater-Than But Not Equivalent To / Greater Than But Not Equivalent To
- U+22e8 ⋨ Precedes But Not Equivalent To
- U+22e9 ⋩ Succeeds But Not Equivalent To
- U+22ea ⋪ Not Normal Subgroup Of
- U+22eb ⋫ Does Not Contain As Normal Subgroup
- U+22ec ⋬ Not Normal Subgroup Of Or Equal To
- U+22ed ⋭ Does Not Contain As Normal Subgroup Or Equal
- U+22ee ⋮ Vertical Ellipsis
- U+22ef ⋯ Midline Horizontal Ellipsis
- U+22f0 ⋰ Up Right Diagonal Ellipsis
- U+22f1 ⋱ Down Right Diagonal Ellipsis
- U+22f2 ⋲ Element Of With Long Horizontal Stroke
- U+22f3 ⋳ Element Of With Vertical Bar At End Of Horizontal Stroke
- U+22f4 ⋴ Small Element Of With Vertical Bar At End Of Horizontal Stroke
- U+22f5 ⋵ Element Of With Dot Above
- U+22f6 ⋶ Element Of With Overbar
- U+22f7 ⋷ Small Element Of With Overbar
- U+22f8 ⋸ Element Of With Underbar
- U+22f9 ⋹ Element Of With Two Horizontal Strokes
- U+22fa ⋺ Contains With Long Horizontal Stroke
- U+22fb ⋻ Contains With Vertical Bar At End Of Horizontal Stroke
- U+22fc ⋼ Small Contains With Vertical Bar At End Of Horizontal Stroke
- U+22fd ⋽ Contains With Overbar
- U+22fe ⋾ Small Contains With Overbar
- U+22ff ⋿ Z Notation Bag Membership
- U+2300 ⌀ Diameter Sign
- U+2302 ⌂ House
- U+2305 ⌅ Projective
- U+2306 ⌆ Perspective
- U+2308 ⌈ Left Ceiling
- U+2309 ⌉ Right Ceiling
- U+230a ⌊ Left Floor
- U+230b ⌋ Right Floor
- U+2310 ⌐ Reversed Not Sign
- U+2311 ⌑ Square Lozenge
- U+2312 ⌒ Arc
- U+2313 ⌓ Segment
- U+2315 ⌕ Telephone Recorder
- U+2317 ⌗ Viewdata Square
- U+2319 ⌙ Turned Not Sign
- U+231c ⌜ Top Left Corner
- U+231d ⌝ Top Right Corner
- U+231e ⌞ Bottom Left Corner
- U+231f ⌟ Bottom Right Corner
- U+2322 ⌢ Frown
- U+2323 ⌣ Smile
- U+232c ⌬ Benzene Ring
- U+2332 ⌲ Conical Taper
- U+2336 ⌶ Apl Functional Symbol I-Beam
- U+2337 ⌷ Apl Functional Symbol Squish Quad
- U+2338 ⌸ Apl Functional Symbol Quad Equal
- U+2339 ⌹ Apl Functional Symbol Quad Divide
- U+233a ⌺ Apl Functional Symbol Quad Diamond
- U+233b ⌻ Apl Functional Symbol Quad Jot
- U+233c ⌼ Apl Functional Symbol Quad Circle
- U+233d ⌽ Apl Functional Symbol Circle Stile
- U+233e ⌾ Apl Functional Symbol Circle Jot
- U+233f ⌿ Apl Functional Symbol Slash Bar
- U+2340 ⍀ Apl Functional Symbol Backslash Bar
- U+2341 ⍁ Apl Functional Symbol Quad Slash
- U+2342 ⍂ Apl Functional Symbol Quad Backslash
- U+2343 ⍃ Apl Functional Symbol Quad Less-Than
- U+2344 ⍄ Apl Functional Symbol Quad Greaterthan
- U+2345 ⍅ Apl Functional Symbol Leftwards Vane
- U+2346 ⍆ Apl Functional Symbol Rightwards Vane
- U+2347 ⍇ Apl Functional Symbol Quad Leftwards Arrow
- U+2348 ⍈ Apl Functional Symbol Quad Rightwards Arrow
- U+2349 ⍉ Apl Functional Symbol Circle Backslash
- U+234a ⍊ Apl Functional Symbol Down Tack Underbar
- U+234b ⍋ Apl Functional Symbol Delta Stile
- U+234c ⍌ Apl Functional Symbol Quad Down Caret
- U+234d ⍍ Apl Functional Symbol Quad Delta
- U+234e ⍎ Apl Functional Symbol Down Tack Jot
- U+234f ⍏ Apl Functional Symbol Upwards Vane
- U+2350 ⍐ Apl Functional Symbol Quad Upwards Arrow
- U+2351 ⍑ Apl Functional Symbol Up Tack Overbar
- U+2352 ⍒ Apl Functional Symbol Del Stile
- U+2353 ⍓ Apl Functional Symbol Quad Up Caret
- U+2353 ⍓ Apl Functional Symbol Quad Up Caret
- U+2354 ⍔ Apl Functional Symbol Quad Del
- U+2355 ⍕ Apl Functional Symbol Up Tack Jot
- U+2356 ⍖ Apl Functional Symbol Downwards Vane
- U+2357 ⍗ Apl Functional Symbol Quad Downwards Arrow
- U+2358 ⍘ Apl Functional Symbol Quote Underbar
- U+2359 ⍙ Apl Functional Symbol Delta Underbar
- U+235a ⍚ Apl Functional Symbol Diamond Underbar
- U+235b ⍛ Apl Functional Symbol Jot Underbar
- U+235c ⍜ Apl Functional Symbol Circle Underbar
- U+235d ⍝ Apl Functional Symbol Up Shoe Jot
- U+235e ⍞ Apl Functional Symbol Quote Quad
- U+235f ⍟ Apl Functional Symbol Circle Star
- U+2360 ⍠ Apl Functional Symbol Quad Colon
- U+2361 ⍡ Apl Functional Symbol Up Tack Diaeresis
- U+2362 ⍢ Apl Functional Symbol Del Diaeresis
- U+2363 ⍣ Apl Functional Symbol Star Diaeresis
- U+2364 ⍤ Apl Functional Symbol Jot Diaeresis
- U+2365 ⍥ Apl Functional Symbol Circle Diaeresis
- U+2366 ⍦ Apl Functional Symbol Down Shoe Stile
- U+2367 ⍧ Apl Functional Symbol Left Shoe Stile
- U+2368 ⍨ Apl Functional Symbol Tilde Diaeresis
- U+2369 ⍩ Apl Functional Symbol Greater-Than Diaeresis
- U+236a ⍪ Apl Functional Symbol Comma Bar
- U+236b ⍫ Apl Functional Symbol Del Tilde
- U+236c ⍬ Apl Functional Symbol Zilde
- U+236d ⍭ Apl Functional Symbol Stile Tilde
- U+236e ⍮ Apl Functional Symbol Semicolon Underbar
- U+236f ⍯ Apl Functional Symbol Quad Not Equal
- U+2370 ⍰ Apl Functional Symbol Quad Question
- U+2371 ⍱ Apl Functional Symbol Down Caret Tilde
- U+2372 ⍲ Apl Functional Symbol Up Caret Tilde
- U+2373 ⍳ Apl Functional Symbol Iota
- U+2374 ⍴ Apl Functional Symbol Rho
- U+2375 ⍵ Apl Functional Symbol Omega
- U+2376 ⍶ Apl Functional Symbol Alpha Underbar
- U+2377 ⍷ Apl Functional Symbol Epsilon Underbar
- U+2378 ⍸ Apl Functional Symbol Iota Underbar
- U+2379 ⍹ Apl Functional Symbol Omega Underbar
- U+237a ⍺ Apl Functional Symbol Alpha
- U+2394 ⎔ Software-Function Symbol
- U+2395 ⎕ Apl Functional Symbol Quad
- U+23a3 ⎣ Left Square Bracket Lower Corner
- U+23b0 ⎰ Upper Left Or Lower Right Curly Bracket Section
- U+23b1 ⎱ Upper Right Or Lower Left Curly Bracket Section
- U+23b4 ⎴ Top Square Bracket
- U+23b5 ⎵ Bottom Square Bracket
- U+23b6 ⎶ Bottom Square Bracket Over Top Square Bracket
- U+23b7 ⎷ Radical Symbol Bottom
- U+23b8 ⎸ Left Vertical Box Line
- U+23b9 ⎹ Right Vertical Box Line
- U+23ce ⏎ Return Symbol
- U+23de ⏞ Top Curly Bracket
- U+23df ⏟ Bottom Curly Bracket
- U+23e2 ⏢ White Trapezium
- U+23e3 ⏣ Benzene Ring With Circle
- U+23e4 ⏤ Straightness
- U+23e5 ⏥ Flatness
- U+23e6 ⏦ Ac Current
- U+23e7 ⏧ Electrical Intersection
- U+25af ▯ White Vertical Rectangle
- U+25cb ○ White Circle
- U+25cf ● Black Circle
- U+261b ☛ Black Right Pointing Index
- U+261e ☞ White Right Pointing Index
- U+2628 ☨ Cross Of Lorraine
- U+26cb ⛋ White Diamond In Square
- U+271d ✝ Latin Cross
- U+2761 ❡ Curved Stem Paragraph Sign Ornament
- U+27f5 ⟵ Long Leftwards Arrow
- U+27f6 ⟶ Long Rightwards Arrow
- U+27f7 ⟷ Long Left Right Arrow
- U+27f9 ⟹ Long Rightwards Double Arrow
- U+2919 ⤙ Leftwards Arrow-Tail
- U+291b ⤛ Leftwards Double Arrow-Tail
- U+291d ⤝ Leftwards Arrow To Black Diamond
- U+2987 ⦇ Z Notation Left Image Bracket
- U+2988 ⦈ Z Notation Right Image Bracket
- U+29FF ⧿ Miny
- U+29b0 ⦰ Reversed Empty Set
- U+29be ⦾ Circled White Bullet
- U+29bf ⦿ Circled Bullet
- U+29c4 ⧄ Squared Rising Diagonal Slash
- U+29c5 ⧅ Squared Falling Diagonal Slash
- U+29c7 ⧇ Squared Small Circle
- U+29df ⧟ Double-Ended Multimap
- U+29f7 ⧷ Reverse Solidus With Horizontal Stroke
- U+29fa ⧺ Double Plus
- U+2a40 ⩀ Intersection With Dot
- U+2a74 ⩴ Double Colon Equal
- U+2a75 ⩵ Two Consecutive Equals Signs
- U+2a76 ⩶ Three Consecutive Equals Signs
- U+2a7d ⩽ Less-Than Or Slanted Equal To
- U+2a7e ⩾ Greater-Than Or Slanted Equal To
- U+2aff ⫿ N-Ary White Vertical Bar
- U+2bb9 ⮹ Up Arrowhead In A Rectangle Box
- U+2bd1 ⯑ Uncertainty Sign
- U+2e38 ⸸ Turned Dagger
- U+2e3a ⸺ Two-Em Dash
- U+2e3b ⸻ Three-Em Dash
- U+2e3f ⸿ Capitulum
- U+2e4b ⹋ Triple Dagger
- U+2e4d ⹍ Paragraphus Mark
- U+3012 〒 Postal Mark
- U+2080 ₀ Subscript Zero
- U+2081 ₁ Subscript One
- U+2082 ₂ Subscript Two
- U+2083 ₃ Subscript Three
- U+2084 ₄ Subscript Four
- U+2295 ⊕ Circled Plus
- U+2A01 ⨁ N-Ary Circled Plus Operator

- # Unicode

- <https://www.unicode.org/charts/PDF/U2300.pdf>
- <https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode>
- <https://unicode.org/charts/nameslist/n_2190.html>
- ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ - /
- αβγδεζηθικλμνξοπρστυφχψω - ς
- ABCDEFGHIJKLMNOPQRSTUVWXYZ
- abcdefghijklmnopqrstuvwxyz

# Brackets

- LEFT PARENTHESIS (U+0028, Ps): (
- RIGHT PARENTHESIS (U+0029, Pe): )
- LEFT SQUARE BRACKET (U+005B, Ps): [
- RIGHT SQUARE BRACKET (U+005D, Pe): ]
- LEFT CURLY BRACKET (U+007B, Ps): {
- RIGHT CURLY BRACKET (U+007D, Pe): }
- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, Pi): «
- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, Pf): »
- TIBETAN MARK GUG RTAGS GYON (U+0F3A, Ps): ༺
- TIBETAN MARK GUG RTAGS GYAS (U+0F3B, Pe): ༻
- TIBETAN MARK ANG KHANG GYON (U+0F3C, Ps): ༼
- TIBETAN MARK ANG KHANG GYAS (U+0F3D, Pe): ༽
- OGHAM FEATHER MARK (U+169B, Ps): ᚛
- OGHAM REVERSED FEATHER MARK (U+169C, Pe): ᚜
- LEFT SINGLE QUOTATION MARK (U+2018, Pi): ‘
- RIGHT SINGLE QUOTATION MARK (U+2019, Pf): ’
- SINGLE LOW-9 QUOTATION MARK (U+201A, Ps): ‚
- SINGLE HIGH-REVERSED-9 QUOTATION MARK (U+201B, Pi): ‛
- LEFT DOUBLE QUOTATION MARK (U+201C, Pi): “
- RIGHT DOUBLE QUOTATION MARK (U+201D, Pf): ”
- DOUBLE LOW-9 QUOTATION MARK (U+201E, Ps): „
- DOUBLE HIGH-REVERSED-9 QUOTATION MARK (U+201F, Pi): ‟
- SINGLE LEFT-POINTING ANGLE QUOTATION MARK (U+2039, Pi): ‹
- SINGLE RIGHT-POINTING ANGLE QUOTATION MARK (U+203A, Pf): ›
- LEFT SQUARE BRACKET WITH QUILL (U+2045, Ps): ⁅
- RIGHT SQUARE BRACKET WITH QUILL (U+2046, Pe): ⁆
- SUPERSCRIPT LEFT PARENTHESIS (U+207D, Ps): ⁽
- SUPERSCRIPT RIGHT PARENTHESIS (U+207E, Pe): ⁾
- SUBSCRIPT LEFT PARENTHESIS (U+208D, Ps): ₍
- SUBSCRIPT RIGHT PARENTHESIS (U+208E, Pe): ₎
- LEFT-POINTING ANGLE BRACKET (U+2329, Ps): 〈
- RIGHT-POINTING ANGLE BRACKET (U+232A, Pe): 〉
- MEDIUM LEFT PARENTHESIS ORNAMENT (U+2768, Ps): ❨
- MEDIUM RIGHT PARENTHESIS ORNAMENT (U+2769, Pe): ❩
- MEDIUM FLATTENED LEFT PARENTHESIS ORNAMENT (U+276A, Ps): ❪
- MEDIUM FLATTENED RIGHT PARENTHESIS ORNAMENT (U+276B, Pe): ❫
- MEDIUM LEFT-POINTING ANGLE BRACKET ORNAMENT (U+276C, Ps): ❬
- MEDIUM RIGHT-POINTING ANGLE BRACKET ORNAMENT (U+276D, Pe): ❭
- HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT (U+276E, Ps): ❮
- HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT (U+276F, Pe): ❯
- HEAVY LEFT-POINTING ANGLE BRACKET ORNAMENT (U+2770, Ps): ❰
- HEAVY RIGHT-POINTING ANGLE BRACKET ORNAMENT (U+2771, Pe): ❱
- LIGHT LEFT TORTOISE SHELL BRACKET ORNAMENT (U+2772, Ps): ❲
- LIGHT RIGHT TORTOISE SHELL BRACKET ORNAMENT (U+2773, Pe): ❳
- MEDIUM LEFT CURLY BRACKET ORNAMENT (U+2774, Ps): ❴
- MEDIUM RIGHT CURLY BRACKET ORNAMENT (U+2775, Pe): ❵
- LEFT S-SHAPED BAG DELIMITER (U+27C5, Ps): ⟅
- RIGHT S-SHAPED BAG DELIMITER (U+27C6, Pe): ⟆
- MATHEMATICAL LEFT WHITE SQUARE BRACKET (U+27E6, Ps): ⟦
- MATHEMATICAL RIGHT WHITE SQUARE BRACKET (U+27E7, Pe): ⟧
- MATHEMATICAL LEFT ANGLE BRACKET (U+27E8, Ps): ⟨
- MATHEMATICAL RIGHT ANGLE BRACKET (U+27E9, Pe): ⟩
- MATHEMATICAL LEFT DOUBLE ANGLE BRACKET (U+27EA, Ps): ⟪
- MATHEMATICAL RIGHT DOUBLE ANGLE BRACKET (U+27EB, Pe): ⟫
- MATHEMATICAL LEFT WHITE TORTOISE SHELL BRACKET (U+27EC, Ps): ⟬
- MATHEMATICAL RIGHT WHITE TORTOISE SHELL BRACKET (U+27ED, Pe): ⟭
- MATHEMATICAL LEFT FLATTENED PARENTHESIS (U+27EE, Ps): ⟮
- MATHEMATICAL RIGHT FLATTENED PARENTHESIS (U+27EF, Pe): ⟯
- LEFT WHITE CURLY BRACKET (U+2983, Ps): ⦃
- RIGHT WHITE CURLY BRACKET (U+2984, Pe): ⦄
- LEFT WHITE PARENTHESIS (U+2985, Ps): ⦅
- RIGHT WHITE PARENTHESIS (U+2986, Pe): ⦆
- Z NOTATION LEFT IMAGE BRACKET (U+2987, Ps): ⦇
- Z NOTATION RIGHT IMAGE BRACKET (U+2988, Pe): ⦈
- Z NOTATION LEFT BINDING BRACKET (U+2989, Ps): ⦉
- Z NOTATION RIGHT BINDING BRACKET (U+298A, Pe): ⦊
- LEFT SQUARE BRACKET WITH UNDERBAR (U+298B, Ps): ⦋
- RIGHT SQUARE BRACKET WITH UNDERBAR (U+298C, Pe): ⦌
- LEFT SQUARE BRACKET WITH TICK IN TOP CORNER (U+298D, Ps): ⦍
- RIGHT SQUARE BRACKET WITH TICK IN BOTTOM CORNER (U+298E, Pe): ⦎
- LEFT SQUARE BRACKET WITH TICK IN BOTTOM CORNER (U+298F, Ps): ⦏
- RIGHT SQUARE BRACKET WITH TICK IN TOP CORNER (U+2990, Pe): ⦐
- LEFT ANGLE BRACKET WITH DOT (U+2991, Ps): ⦑
- RIGHT ANGLE BRACKET WITH DOT (U+2992, Pe): ⦒
- LEFT ARC LESS-THAN BRACKET (U+2993, Ps): ⦓
- RIGHT ARC GREATER-THAN BRACKET (U+2994, Pe): ⦔
- DOUBLE LEFT ARC GREATER-THAN BRACKET (U+2995, Ps): ⦕
- DOUBLE RIGHT ARC LESS-THAN BRACKET (U+2996, Pe): ⦖
- LEFT BLACK TORTOISE SHELL BRACKET (U+2997, Ps): ⦗
- RIGHT BLACK TORTOISE SHELL BRACKET (U+2998, Pe): ⦘
- LEFT WIGGLY FENCE (U+29D8, Ps): ⧘
- RIGHT WIGGLY FENCE (U+29D9, Pe): ⧙
- LEFT DOUBLE WIGGLY FENCE (U+29DA, Ps): ⧚
- RIGHT DOUBLE WIGGLY FENCE (U+29DB, Pe): ⧛
- LEFT-POINTING CURVED ANGLE BRACKET (U+29FC, Ps): ⧼
- RIGHT-POINTING CURVED ANGLE BRACKET (U+29FD, Pe): ⧽
- LEFT SUBSTITUTION BRACKET (U+2E02, Pi): ⸂
- RIGHT SUBSTITUTION BRACKET (U+2E03, Pf): ⸃
- LEFT DOTTED SUBSTITUTION BRACKET (U+2E04, Pi): ⸄
- RIGHT DOTTED SUBSTITUTION BRACKET (U+2E05, Pf): ⸅
- LEFT TRANSPOSITION BRACKET (U+2E09, Pi): ⸉
- RIGHT TRANSPOSITION BRACKET (U+2E0A, Pf): ⸊
- LEFT RAISED OMISSION BRACKET (U+2E0C, Pi): ⸌
- RIGHT RAISED OMISSION BRACKET (U+2E0D, Pf): ⸍
- LEFT LOW PARAPHRASE BRACKET (U+2E1C, Pi): ⸜
- RIGHT LOW PARAPHRASE BRACKET (U+2E1D, Pf): ⸝
- LEFT VERTICAL BAR WITH QUILL (U+2E20, Pi): ⸠
- RIGHT VERTICAL BAR WITH QUILL (U+2E21, Pf): ⸡
- TOP LEFT HALF BRACKET (U+2E22, Ps): ⸢
- TOP RIGHT HALF BRACKET (U+2E23, Pe): ⸣
- BOTTOM LEFT HALF BRACKET (U+2E24, Ps): ⸤
- BOTTOM RIGHT HALF BRACKET (U+2E25, Pe): ⸥
- LEFT SIDEWAYS U BRACKET (U+2E26, Ps): ⸦
- RIGHT SIDEWAYS U BRACKET (U+2E27, Pe): ⸧
- LEFT DOUBLE PARENTHESIS (U+2E28, Ps): ⸨
- RIGHT DOUBLE PARENTHESIS (U+2E29, Pe): ⸩
- LEFT ANGLE BRACKET (U+3008, Ps): 〈
- RIGHT ANGLE BRACKET (U+3009, Pe): 〉
- LEFT DOUBLE ANGLE BRACKET (U+300A, Ps): 《
- RIGHT DOUBLE ANGLE BRACKET (U+300B, Pe): 》
- LEFT CORNER BRACKET (U+300C, Ps): 「
- RIGHT CORNER BRACKET (U+300D, Pe): 」
- LEFT WHITE CORNER BRACKET (U+300E, Ps): 『
- RIGHT WHITE CORNER BRACKET (U+300F, Pe): 』
- LEFT BLACK LENTICULAR BRACKET (U+3010, Ps): 【
- RIGHT BLACK LENTICULAR BRACKET (U+3011, Pe): 】
- LEFT TORTOISE SHELL BRACKET (U+3014, Ps): 〔
- RIGHT TORTOISE SHELL BRACKET (U+3015, Pe): 〕
- LEFT WHITE LENTICULAR BRACKET (U+3016, Ps): 〖
- RIGHT WHITE LENTICULAR BRACKET (U+3017, Pe): 〗
- LEFT WHITE TORTOISE SHELL BRACKET (U+3018, Ps): 〘
- RIGHT WHITE TORTOISE SHELL BRACKET (U+3019, Pe): 〙
- LEFT WHITE SQUARE BRACKET (U+301A, Ps): 〚
- RIGHT WHITE SQUARE BRACKET (U+301B, Pe): 〛
- REVERSED DOUBLE PRIME QUOTATION MARK (U+301D, Ps): 〝
- DOUBLE PRIME QUOTATION MARK (U+301E, Pe): 〞
- LOW DOUBLE PRIME QUOTATION MARK (U+301F, Pe): 〟
- ORNATE LEFT PARENTHESIS (U+FD3E, Ps): ﴾
- ORNATE RIGHT PARENTHESIS (U+FD3F, Pe): ﴿
- PRESENTATION FORM FOR VERTICAL LEFT WHITE LENTICULAR BRACKET (U+FE17, Ps): ︗
- PRESENTATION FORM FOR VERTICAL RIGHT WHITE LENTICULAR BRAKCET (U+FE18, Pe): ︘
- PRESENTATION FORM FOR VERTICAL LEFT PARENTHESIS (U+FE35, Ps): ︵
- PRESENTATION FORM FOR VERTICAL RIGHT PARENTHESIS (U+FE36, Pe): ︶
- PRESENTATION FORM FOR VERTICAL LEFT CURLY BRACKET (U+FE37, Ps): ︷
- PRESENTATION FORM FOR VERTICAL RIGHT CURLY BRACKET (U+FE38, Pe): ︸
- PRESENTATION FORM FOR VERTICAL LEFT TORTOISE SHELL BRACKET (U+FE39, Ps): ︹
- PRESENTATION FORM FOR VERTICAL RIGHT TORTOISE SHELL BRACKET (U+FE3A, Pe): ︺
- PRESENTATION FORM FOR VERTICAL LEFT BLACK LENTICULAR BRACKET (U+FE3B, Ps): ︻
- PRESENTATION FORM FOR VERTICAL RIGHT BLACK LENTICULAR BRACKET (U+FE3C, Pe): ︼
- PRESENTATION FORM FOR VERTICAL LEFT DOUBLE ANGLE BRACKET (U+FE3D, Ps): ︽
- PRESENTATION FORM FOR VERTICAL RIGHT DOUBLE ANGLE BRACKET (U+FE3E, Pe): ︾
- PRESENTATION FORM FOR VERTICAL LEFT ANGLE BRACKET (U+FE3F, Ps): ︿
- PRESENTATION FORM FOR VERTICAL RIGHT ANGLE BRACKET (U+FE40, Pe): ﹀
- PRESENTATION FORM FOR VERTICAL LEFT CORNER BRACKET (U+FE41, Ps): ﹁
- PRESENTATION FORM FOR VERTICAL RIGHT CORNER BRACKET (U+FE42, Pe): ﹂
- PRESENTATION FORM FOR VERTICAL LEFT WHITE CORNER BRACKET (U+FE43, Ps): ﹃
- PRESENTATION FORM FOR VERTICAL RIGHT WHITE CORNER BRACKET (U+FE44, Pe): ﹄
- PRESENTATION FORM FOR VERTICAL LEFT SQUARE BRACKET (U+FE47, Ps): ﹇
- PRESENTATION FORM FOR VERTICAL RIGHT SQUARE BRACKET (U+FE48, Pe): ﹈
- SMALL LEFT PARENTHESIS (U+FE59, Ps): ﹙
- SMALL RIGHT PARENTHESIS (U+FE5A, Pe): ﹚
- SMALL LEFT CURLY BRACKET (U+FE5B, Ps): ﹛
- SMALL RIGHT CURLY BRACKET (U+FE5C, Pe): ﹜
- SMALL LEFT TORTOISE SHELL BRACKET (U+FE5D, Ps): ﹝
- SMALL RIGHT TORTOISE SHELL BRACKET (U+FE5E, Pe): ﹞
- FULLWIDTH LEFT PARENTHESIS (U+FF08, Ps): （
- FULLWIDTH RIGHT PARENTHESIS (U+FF09, Pe): ）
- FULLWIDTH LEFT SQUARE BRACKET (U+FF3B, Ps): ［
- FULLWIDTH RIGHT SQUARE BRACKET (U+FF3D, Pe): ］
- FULLWIDTH LEFT CURLY BRACKET (U+FF5B, Ps): ｛
- FULLWIDTH RIGHT CURLY BRACKET (U+FF5D, Pe): ｝
- FULLWIDTH LEFT WHITE PARENTHESIS (U+FF5F, Ps): ｟
- FULLWIDTH RIGHT WHITE PARENTHESIS (U+FF60, Pe): ｠
- HALFWIDTH LEFT CORNER BRACKET (U+FF62, Ps): ｢
- HALFWIDTH RIGHT CORNER BRACKET (U+FF63, Pe): ｣
