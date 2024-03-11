# Markdown

- _Markdown(aString)_

`Markdown` is a `Type` representing a text written in _Markdown_.

The `asHtml` method answers a rendering to _Html_:

```
>>> let string = '# H\n\nP1\n\n- L1\n- L2\n\nP2\n';
>>> let markdown = Markdown(string);
>>> (markdown.asMarkdown = string, markdown.asHtml)
(true, '<h1>H</h1>\n<p>P1</p>\n<ul>\n<li>L1</li>\n<li>L2</li>\n</ul>\n<p>P2</p>\n')
```

The `codeBlocks` method answers a `List` of each of the code block elements:

```
>>> let m = Markdown('# H\n\n```\na\n```\n\n\tb\n');
>>> m.codeBlocks
['a\n' 'b\n']
```

The `do` method iterates over the tree structure of the document,
answering a `Record` value for each node in the tree.
In each case the _type_ field gives the type of the node.
Container nodes have a `Boolean` _begin_ field,
leaf nodes have a `String` _contents_ field:

~~~
let m = Markdown('# H\nP `c`\n* * *\n- L **b**\n\nP _e_\n');
m.do(postLine:/1)
~~~

* * *

See also: markdownToHtml
