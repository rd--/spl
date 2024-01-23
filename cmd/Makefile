spl = (cd ../sl ; make update-cache) ; ./spl

spl-repl-core:
	$(spl) replPerLine --strict

spl-repl:
	$(spl) replPerLine --lib=StandardLibrary --strict

spl-repl-non-strict:
	$(spl) replPerLine --lib=StandardLibrary

spl-repl-unsafe:
	$(spl) replPerLine --unsafe

spl-repl-verbose:
	$(spl) replPerLine --lib=StandardLibrary --strict --verbose

spl-repl-bm:
	$(spl) replPerLine --lib=StandardLibrary --lib=BenchmarkLibrary --strict

spl-repl-bm-unsafe:
	$(spl) replPerLine --lib=StandardLibrary --lib=BenchmarkLibrary --unsafe

spl-repl-sc:
	$(spl) replPerLine --lib=StandardLibrary --lib=SuperColliderLibrary --strict

spl-repl-ui:
	$(spl) replPerLine --lib=StandardLibrary --lib=SuperColliderLibrary --lib=SmallKansasLibrary --strict

spl-server:
	$(spl) sc tcpServer --port=3010
