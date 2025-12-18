# gitLabFileUrl

- _gitLabFileUrl(u, p, b, f)_

Answer a file `Url` for the file _f_ at branch _b_ of the project _p_ of the user _u_.

```
>>> let u = 'rd--'.gitLabFileUrl(
>>> 	'spl',
>>> 	'main',
>>> 	'README.md'
>>> );
>>> (
>>> 	u.protocol,
>>> 	u.host,
>>> 	u.directory,
>>> 	u.fileName
>>> )
(
	'https:',
	'gitlab.com',
	'/rd--/spl/-/raw/main',
	'README.md'
)
```

* * *

See also: gitHubFileUrl, Url

Guides: Network Functions
