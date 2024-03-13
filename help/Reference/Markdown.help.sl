# Markdown

- _Markdown(aString)_

`Markdown` is a `Type` representing a text written in _Markdown_.

`asHtml` answers a rendering to an _Html_ `String`:

```
>>> let string = '# H\n\nP1\n\n- L1\n- L2\n\nP2\n';
>>> let markdown = Markdown(string);
>>> (markdown.asMarkdown = string, markdown.asHtml)
(true, '<h1>H</h1>\n<p>P1</p>\n<ul>\n<li>L1</li>\n<li>L2</li>\n</ul>\n<p>P2</p>\n')
```

`Markdown` is `Iterable`,
`do` iterates _depth-first_ over the tree structure of the document,
answering a `Record` value for each node in the parse tree,
and `contents` collects these nodes into a list:

~~~
>>> let m = Markdown('# H\nP `c`\n* * *\n[a](b)\n\n- L **b**\n\nP ![_e_](g)\n');
>>> m.contents.collect { :each |
>>> 	each::type ++ each.includesKey('sourcePosition').if { '*' } { '' }
>>> }
[
	'document*'
	'heading*' 'text'
	'paragraph*' 'text' 'code'
	'thematicBreak*'
	'paragraph*' 'link' 'text'
	'list*' 'listItem*' 'paragraph*' 'text' 'strong' 'text'
	'paragraph*' 'text' 'image' 'emphasis' 'text'
]
~~~

For each parse tree node there is
a _type_ field (as shown above),
and an _id_ field giving a unique `Integer` identifier (assigned in traversal order from `one`).
For all but the first node (of type _document_) a _parent_ field gives the _id_ of the parent node.
Container nodes will have child nodes that point to them,
leaf nodes that hold text will have a _literal_ field holding a `String`.
_Block_ nodes have a _sourcePosition_ field given start and end line and column numbers.

The `asTree` method answers a `Tree` of the parse tree:

~~~
>>> let m = Markdown('# H\nP `c`\n* * *\n[a](b)\n\n- L **b**\n\nP ![_e_](g)\n');
>>> m.asTree.leafIndices
[1 1; 2 1; 2 2; 3; 4 1 1; 5 1 1 1; 5 1 1 2 1; 6 1; 6 2 1 1]
~~~

The `codeBlocks` method answers a `List` of each of the code block elements:

```
>>> let m = Markdown('# H\n\n```\na\n```\n\n\tb\n');
>>> m.codeBlocks
['a\n' 'b\n']
```

* * *

See also: asTree, contents, do, markdownToHtml, Tree

Categories: Text, Type
