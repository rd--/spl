;;; spl-mode.el --- Simple Programming Language

;;; Commentary:
;;; .sl files contain Simple Programming Language codes

;;; Code:

(require 'find-lisp)
(require 'font-lock)
(require 'imenu)
(require 'json)
(require 'sclang-mode)
(require 'thingatpt)

(defvar spl-directory nil
  "The Spl directory (default=nil).")

(defvar stsc3-directory nil
  "The StSc3 directory (default=nil).")

(defun spl-find-files (dir rgx)
  "Find files at DIR matching RGX."
  (mapc (lambda (filename)
          (find-file-other-window filename))
        (find-lisp-find-files dir rgx)))

(defun spl-help ()
  "Lookup up the name at point in the Spl help files."
  (interactive)
  (let ((rgx (concat "^" (thing-at-point 'symbol) "\\.help\\.sl$")))
    (spl-find-files (concat spl-directory "help/") rgx)
    (spl-find-files (concat stsc3-directory "help/") rgx)))

(defun spl-write-text-file (filename text)
  "Write TEXT to FILENAME"
  (write-region text nil filename))

(defun spl-netcat-cmd (cmd key value)
  "Send command CMD with the parameter KEY = VALUE to the Spl server."
  (let ((filename "/tmp/spl-netcat.json")
	(text (json-encode `((command . ,cmd) (,key . ,value)))))
    (spl-write-text-file filename text)
    (shell-command (format "ncat 127.0.0.1 3010 < %s" filename)))) ; netcat -q 0 -C

(defun spl-delete-markdown-code-fences (str)
  "Remove Mardown code fences from the string STR if present."
  (replace-regexp-in-string "^```" "" str))

(defun spl-set-region-to-paragraph ()
  "Set the mark at the start and point at the end of the current paragraph."
  (interactive)
  (backward-paragraph)
  ; (recenter t)
  (push-mark nil t t)
  (forward-paragraph))

(defun spl-get-text (start end)
  "Get the text from start to end as a string, with code fences deleted."
  (spl-delete-markdown-code-fences
   (buffer-substring-no-properties start end)))

(defun spl-get-paragraph ()
  "Get the currently paragraph as a string, with code fences deleted."
  (spl-set-region-to-paragraph)
  (spl-get-text (region-beginning) (region-end)))

(defun spl-eval-paragraph ()
  "Evaluate paragraph at Spl server."
  (interactive)
  (spl-netcat-cmd 'evalText 'text (spl-get-paragraph)))

(defun spl-print-ugen-graph-of-paragraph ()
  "Evaluate .printUgenGraph at Spl server."
  (interactive)
  (spl-netcat-cmd 'evalText 'text (format "{ %s }.value.printUgenGraph" (spl-get-paragraph))))

(defun spl-eval-current-file ()
  "Load current file at Spl server."
  (interactive)
  (spl-netcat-cmd 'evalFile 'fileName buffer-file-name))

(defun spl-play-paragraph ()
  "Play Ugen graph of current paragraph."
  (interactive)
  (spl-netcat-cmd 'evalText 'text (format "{ %s }.play" (spl-get-paragraph))))

(defun spl-draw-paragraph ()
  "Draw Ugen graph of current paragraph."
  (interactive)
  (spl-netcat-cmd 'evalText 'text (format "{ %s }.drawUgenGraph" (spl-get-paragraph))))

(defun spl-print-paragraph ()
  "Print Ugen graph of current paragraph."
  (interactive)
  (spl-netcat-cmd 'evalText 'text (format "{ %s }.value.printUgenGraph" (spl-get-paragraph))))

(defun spl-play-current-file ()
  "Play current file at Spl server."
  (interactive)
  (spl-netcat-cmd 'playFile 'fileName buffer-file-name))

(defun spl-clear-clock ()
  (interactive)
  (spl-netcat-cmd 'evalText 'text "system.clock.removeAll"))

(defun spl-reset-scsynth ()
  (interactive)
  (spl-netcat-cmd 'evalText 'text "system.scSynth.reset"))

(defun spl-stop ()
  (interactive)
  (spl-clear-clock)
  (spl-reset-scsynth))

(defun spl-insert-non-local-return ()
  (interactive)
  (insert "valueWithReturn { :return:/1 |"))

(defvar spl-mode-hook
  nil
  "Hook to run on entering spl-mode.")

(defvar spl-imenu-generic-expression
  (list
   (list nil "^\\((\\* .*\\*)\\)$" 1)
   (list nil "^\\(#+ .*\\)$" 1)
   (list nil "^\\(\+?@?\[?[A-Z][, A-Za-z0-9]+[A-Za-z0-9]\]?\\).* {\\( |\\|$\\)" 1)
   (list nil "^\\(\t[*&|~+/%><=?!^a-zA-Z0-9-]+\\) {" 1))
  "Value for `imenu-generic-expression' in Spl mode.")

(defconst spl-font-lock-keywords
  (list
   `(,(regexp-opt '("var") 'symbols) . font-lock-keyword-face)
   `(,(regexp-opt '("false" "inf" "nil" "pi" "e" "epsilon" "true") 'symbols) . font-lock-builtin-face)
   `(,(regexp-opt '("do" "if" "ifEmpty" "ifFalse" "ifNil" "ifNotNil" "ifTrue" "kr" "timesRepeat" "whileFalse" "whileTrue") 'symbols) . font-lock-function-name-face)
   `(,(regexp-opt '("error" "warn") 'symbols) . font-lock-warning-face)
   '("\\<[A-Z][a-zA-Z0-9]*\\>" . font-lock-type-face)
   '(":[a-z][a-zA-Z0-9]*" . 'font-lock-variable-name-face)
   '("primitive:" . 'font-lock-warning-face))
  "Spl font-lock rules.")

(defun spl-fill-syntax-table (st)
  "Modify the syntax table ST for Spl."
  (modify-syntax-entry ?\* ". 23n" st)
  (modify-syntax-entry ?\( "()1" st)
  (modify-syntax-entry ?\) ")(4" st)
  (modify-syntax-entry ?' "\"" st)
  (modify-syntax-entry ?\" "\"" st)
  ;;(modify-syntax-entry ?\; ". 12b" st)
  (modify-syntax-entry ?\n "> b" st)
  st)

(defvar spl-mode-syntax-table
  (spl-fill-syntax-table (make-syntax-table))
  "Syntax table for spl-mode")

(defun spl-prettier ()
  "Unicode symbols"
  (setq
   prettify-symbols-alist
   '(("return:/1" . ?↑) ; U+2191 ↑ Upwards Arrow
     ("return" . ?↑) ; U+2191 ↑ Upwards Arrow
     ("valueWithReturn" . ?↓) ; U+2193 ↓ Downwards Arrow
     ("->" . ?→) ; U+2190 → Rightwards Arrow
     (":=" . ?←) ; U+2190 ← Leftwards Arrow (U+2254 ≔ Colon Equals)
     (":/" . ?⧸) ; U+00B0 ⧸ Big Solidus
     ("::" . ?·) ; U+00B7 · Middle Dot
     (":." . ?‣)
     (":@" . ?⋄) ; U+22C4 ⋄ Diamond Operator
     ("~=" . ?≠) ; U+2260 ≠ Not equal to
     ("==" . ?≡) ; U+2261 ≡ Identical To
     ("~~" . ?≢) ; U+2262 ≢ Not Identical To
     ("<=" . ?≤) ; U+2264 ≤ Less-than or equal to
     (">=" . ?≥) ; U+2265 ≥ Greater-than or equal to
     ("++" . ?⧺) ; U+29FA ⧺ Double plus
     ("concatenation" .?⧻) ; U+29FB ⧻ Triple Plus
     ("transposed" .?ᵀ) ; U+1D40 ᵀ Modifier Letter Capital T
     ("reversed" .?ᴙ) ; U+1D19 ᴙ Latin Letter Small Capital Reversed R
     ("pi" . ?π) ; U+03C0 π Greek Small Letter Pi
     ("epsilon" . ?ε) ; U+03B5 ε Greek Small Letter Epsilon
     ;; ("e" . ?𝑒)
     ("*" . ?×) ; U+00D7 × Multiplication Sign
     ("-" . ?−) ; U+2212 − Minus Sign
     ("^" . ?ˆ) ; U+2191 ↑ Upwards Arrow ; U+02C6 ˆ Modifier Letter Circumflex Accent
     ("**" . ?⇈) ; U+21C8 ⇈ Upwards Paired Arrows
     ("/" . ?÷) ; U+00F7 ÷ Division Sign
     ("true" . ?⊤) ; U+22A4 ⊤ Down Tack
     ("false" . ?⊥) ; U+22A5 ⊥ Up tack
     ("not" . ?¬) ; U+00AC ¬ Not sign
     ("and" . ?∧) ; U+2227 ∧ Logical and
     ("or" . ?∨) ; ∨ U+2228 Logical Or
     ("sum" . ?Σ) ; U+03A3 Σ Greek Capital Letter Sigma ; U+2211 ∑ N-Ary Summation
     ("product" . ?Π) ; U+03A0 Π Greek capital letter pi
     ("crossedMultiply" . ?⊗) ; U+2297 ⊗ Circled Times
     ("*.x" . ?⊗)
     ("Sqrt" . ?√)
     ("sqrt" . ?√) ; “√” U+221A Square Root
     ;;(";;" . ?⋯)
     ("alpha" . ?α)
     ("beta" . ?β)
     ("|(" . ?⦇) ; ⦃ ⸠ ⦇
     (")|" . ?⦈) ; ⦄ ⸡ ⦈
     ("~" . ?≈) ; U+2248 ≈ Almost Equal To
     ("!~" . ?≉) ; ≁
     ("<~" . ?⪅) ; ⪝
     (">~" . ?⪆) ; ⪞
     ("union" . ?∪) ; U+222A ∪ Union
     ("intersection" . ?∩) ; U+2229 ∩ Intersection
     ("includes" . ?∋) ; U+220B ∋ Contains as Member
     ("doesNotInclude" . ?∌) ; Unicode: U+220C ∌ Does not contain as member
     ("flat" . ?♭) ; U+266D ♭ Music Flat Sign
     ("sharp" . ?♯) ; U+266F ♯ Music Sharp Sign
     ("natural" . ?♮) ; U+266E ♮ Music Natural Sign
     ("cancelFlat" . ?♮) ; U+266E ♮ Music Natural Sign
     ("cancelSharp" . ?♮) ; U+266E ♮ Music Natural Sign
     ("quarterToneFlat" .?𝄳) ; U+1D133 𝄳 Musical Symbol Quarter Tone Flat
     ("quarterToneSharp" .?𝄲) ; U+1D132 𝄲 Musical Symbol Quarter Tone Sharp
     (":?" .?⍰) ; U+2370 ⍰ Apl Functional Symbol Quad Question ; U+291D ⤝ Leftwards arrow to black diamond
     ("||" .?‖) ; U+2016 ‖ Double Vertical Line
     (".." .?‥) ; U+2025 ‥ Two Dot Leader
     ;;("..." .?‥) ; U+2026 … Horizontal Ellipsis; U+22ef ⋯ Midline Horizontal Ellipsis
     ("--" .?—) ; U+2014 — Em Dash
     ("duplicate" .?!)
     ("squared" .?²) ; U+00B2 ² Superscript Two
     ("first" .?₁) ; U+2081 ₁ Subscript One
     ("second" .?₂) ; U+2082 ₂ Subscript Two
     ("third" .?₃) ; U+2083 ₃ Subscript Three
     ("fourth" .?₄) ; U+2084 ₄ Subscript Four
     ("rho" .?ρ)
     ("phi" .?φ)
     ("theta" .?θ)
     ("lambda" .?λ) ; U+03BB λ Greek Small Letter Lamda
     ("delta" .?δ) ; U+03B4 δ Greek Small Letter Delta
     ("r" .?𝑟) ; U+1D45F 𝑟 Mathematical Italic Small R
     )))

(defun spl-fill-mode-map (map)
  "Install Spl keybindings into MAP."
  (define-key map (kbd "C-c C-h") 'spl-help)
  (define-key map (kbd "C-c C-a") 'spl-play-paragraph)
  (define-key map (kbd "C-c C-g") 'spl-draw-paragraph)
  (define-key map (kbd "C-c C-e") 'spl-eval-paragraph)
  (define-key map (kbd "C-c C-k") 'spl-reset-scsynth)
  (define-key map (kbd "C-c C-s") 'spl-stop)
  (define-key map (kbd "C-c C-r") 'spl-insert-non-local-return)
  map)

(defvar spl-mode-map
  (spl-fill-mode-map (make-sparse-keymap))
  "Keymap used in Spl mode.")

(defcustom spl-indent-level
  8
  "Indentation for Spl."
  :type '(integer))

(defun spl-mode-set-local-variables ()
  (set (make-local-variable 'indent-tabs-mode) t)
  (set (make-local-variable 'tab-width) spl-indent-level)
  (set (make-local-variable 'sclang-indent-level) spl-indent-level)
  (set (make-local-variable 'indent-line-function) 'sclang-indent-line)
  (set (make-local-variable 'comment-start) "(* ")
  (set (make-local-variable 'comment-end) " *)")
  (set (make-local-variable 'font-lock-defaults) '(spl-font-lock-keywords))
  (setq-local imenu-sort-function 'imenu--sort-by-name)
  (setq-local imenu-generic-expression spl-imenu-generic-expression))

(define-derived-mode spl-mode prog-mode "Spl"
  "Major mode for editing Simple Programming Language files."
  :group 'spl
  :syntax-table spl-mode-syntax-table
  (spl-mode-set-local-variables))

(add-to-list 'auto-mode-alist '("\\.sl$" . spl-mode))
(add-to-list 'auto-mode-alist '("\\.help.sl$" . spl-mode))

(defun spl-indent-region ()
  "Run spl-indent on region."
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "spl-indent" nil t))

(provide 'spl-mode)

;;; spl.el ends here
