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

(defcustom spl-buffer "*spl*"
  "The name of the spl process buffer."
  :type 'string)

(defcustom spl-interpreter (list "spl" "sc" "tcpServer" "--port=3010")
  "The name of the spl interpreter."
  :type '(repeat string))

(defvar spl-directory nil
  "The Spl directory (default=nil).")

(defun spl-start-interpeter ()
  "Start the spl process.

If `spl-interpreter' is not already a subprocess it is
started and a new window is created to display the results of
evaluating spl expressions.  Input and output is via `spl-buffer'."
  (interactive)
  (if (comint-check-proc spl-buffer)
      (spl-see-spl)
    (apply
     'make-comint
     "spl"
     (car spl-interpreter)
     nil
     (cdr spl-interpreter))
    (spl-see-spl)))

(defun spl-see-spl ()
 "Show spl output."
 (interactive)
  (if (not (comint-check-proc spl-buffer))
      (spl-start-interpeter)
   (delete-other-windows)
   (split-window-vertically)
   (with-current-buffer spl-buffer
     (let ((window (display-buffer (current-buffer))))
       (goto-char (point-max))
       (save-selected-window
         (set-window-point window (point-max)))))))

(defun spl-find-files (dir rgx)
  "Find files at DIR matching RGX."
  (mapc (lambda (filename)
          (find-file-other-window filename))
        (find-lisp-find-files dir rgx)))

(defun spl-help ()
  "Lookup up the name at point in the Spl help files."
  (interactive)
  (let ((rgx (concat "^" (thing-at-point 'symbol) "\\.help\\.sl$")))
    (spl-find-files (concat spl-directory "help/") rgx)))

(defun spl-write-text-file (filename text)
  "Write TEXT to FILENAME"
  (write-region text nil filename))

(defun spl-netcat-cmd (cmd key value)
  "Send command CMD with the parameter KEY = VALUE to the Spl server."
  (let ((filename "/tmp/spl-netcat.json")
	(text (json-encode `((command . ,cmd) (,key . ,value)))))
    (spl-write-text-file filename text)
    (shell-command (format "ncat 127.0.0.1 3010 < %s" filename)))) ; netcat -q 0 -C

(defun spl-eval-current-file ()
  "Evaluate current file."
  (interactive)
  (spl-netcat-cmd 'evalFile 'fileName buffer-file-name))

(defun spl-delete-markdown-code-fences (str)
  "Remove Mardown code fences from the string STR if present."
  (replace-regexp-in-string "^```" "" str))

(defun spl-set-region-to-paragraph ()
  "Set the mark at the start and point at the end of the current paragraph."
  (interactive)
  (backward-paragraph)
  (push-mark nil t t)
  (forward-paragraph))

(defun spl-get-text (start end)
  "Get the text from start to end as a string, with code fences deleted."
  (spl-delete-markdown-code-fences
   (buffer-substring-no-properties start end)))

(defun spl-get-paragraph ()
  "Get the current paragraph as a string, with code fences deleted."
  (spl-set-region-to-paragraph)
  (spl-get-text (region-beginning) (region-end)))

(defun spl-get-line ()
  "Get the current line as a string."
  (buffer-substring-no-properties
   (line-beginning-position)
   (line-end-position)))

(defun spl-get-region ()
  "Get the current region as a string."
  (spl-get-text
   (region-beginning)
   (region-end)))

(defun spl-eval-string (STR)
  "Evaluate string."
  (spl-netcat-cmd 'evalText 'text STR))

(defun spl-eval-paragraph ()
  "Evaluate paragraph."
  (interactive)
  (spl-eval-string (spl-get-paragraph)))

(defun spl-eval-line ()
  "Evaluate line."
  (interactive)
  (spl-eval-string (spl-get-line))
  (if (/= (line-end-position) (point-max))
      (forward-line 1)))

(defun spl-eval-region ()
  "Evaluate the region."
  (interactive)
  (spl-eval-string (spl-get-region)))

(defun spl-eval-region-or-line ()
  "Evaluate region if selected, else current line."
  (interactive)
  (if (and transient-mark-mode mark-active)
      (spl-eval-region)
    (spl-eval-line)))

(defun spl-play-paragraph ()
  "Play Ugen graph of current paragraph."
  (interactive)
  (spl-eval-string (format "{ %s }.value.play" (spl-get-paragraph))))

(defun spl-draw-paragraph ()
  "Draw Ugen graph of current paragraph."
  (interactive)
  (spl-eval-string (format "{ %s }.value.draw" (spl-get-paragraph))))

(defun spl-plot-paragraph ()
  "Plot Ugen graph of current paragraph."
  (interactive)
  (spl-eval-string (format "{ %s }.value.plot(0.1)" (spl-get-paragraph))))

(defun spl-print-paragraph ()
  "Print Ugen graph of current paragraph."
  (interactive)
  (spl-eval-string (format "{ %s }.value.print" (spl-get-paragraph))))

(defun spl-play-current-file ()
  "Play current file at Spl server."
  (interactive)
  (spl-netcat-cmd 'playFile 'fileName buffer-file-name))

(defun spl-indent-paragraph ()
  "Indent current paragraph one TAB stop to the right."
  (interactive)
  (spl-set-region-to-paragraph)
  (indent-rigidly-right-to-tab-stop (region-beginning) (region-end)))

(defun spl-unindent-paragraph ()
  "Indent current paragraph one TAB stop to the left."
  (interactive)
  (spl-set-region-to-paragraph)
  (indent-rigidly-left-to-tab-stop (region-beginning) (region-end)))

(defun spl-clear-clock ()
  (interactive)
  (spl-eval-string "system.clock.removeAll"))

(defun spl-reset-scsynth ()
  (interactive)
  (spl-eval-string "system.scSynth.reset"))

(defun spl-stop ()
  (interactive)
  (spl-clear-clock)
  (spl-reset-scsynth))

(defun spl-exit ()
  (interactive)
  (spl-eval-string "system.exit(0)"))

(defun spl-insert-non-local-return ()
  (interactive)
  (insert "valueWithReturn { :return:/1 |"))

(defvar spl-mode-hook
  nil
  "Hook to run on entering spl-mode.")

(defvar spl-imenu-generic-expression
  (list
   (list nil "^\\({- .* -}\\)$" 1) ; Region Comment
   (list nil "^\\(-- .*\\)$" 1) ; Line Comment
   (list nil "^\\(#+ .*\\)$" 1) ; Heading
   (list nil "^\\(\+?@?\[?[A-Z][, A-Za-z0-9]+[A-Za-z0-9]\]?\\).* {\\( |\\|$\\)" 1)
   (list nil "^\\(\t[*&|~+/%><=?!^a-zA-Z0-9-]+\\) {" 1))
  "Value for `imenu-generic-expression' in Spl mode.")

(defconst spl-font-lock-keywords
  (list
   `(,(regexp-opt '("let") 'symbols) . font-lock-keyword-face)
   `(,(regexp-opt '("false" "inf" "nil" "pi" "true") 'symbols) . font-lock-builtin-face)
   `(,(regexp-opt '("do" "if" "ifEmpty" "ifFalse" "ifNil" "ifNotNil" "ifTrue" "kr" "timesRepeat" "whileFalse" "whileTrue") 'symbols) . font-lock-function-name-face)
   `(,(regexp-opt '("error" "warn") 'symbols) . font-lock-warning-face)
   '("\\<[A-Z][a-zA-Z0-9]*\\>" . font-lock-type-face)
   '(":[a-z][a-zA-Z0-9]*" . 'font-lock-variable-name-face)
   '("primitive:" . 'font-lock-warning-face))
  "Spl font-lock rules.")

(defun spl-fill-syntax-table (st)
  "Modify the syntax table ST for Spl."
  (modify-syntax-entry ?\  " " st) ; whitespace
  (modify-syntax-entry ?\t " " st) ; whitespace
  (modify-syntax-entry ?\( "()" st) ; open parenthesis
  (modify-syntax-entry ?\) ")(" st) ; close parenthesis
  (modify-syntax-entry ?\[ "(]" st) ; open parenthesis
  (modify-syntax-entry ?\] ")[" st) ; close parenthesis
  (modify-syntax-entry ?\{ "(}1" st) ; open parenthesis & comment start
  (modify-syntax-entry ?\} "){4" st) ; close parenthesis & comment end
  (modify-syntax-entry ?- ". 123" st) ; punctuation & comment
  (modify-syntax-entry ?\n ">" st) ; comment end
  (modify-syntax-entry ?' "\"" st) ; string quote
  (modify-syntax-entry ?\" "\"" st) ; string quote
  (modify-syntax-entry ?\` "\"" st) ; string quote
  (mapc (lambda (x)
          (modify-syntax-entry x "." st)) ; punctuation
        "!#$%&*+./:<=>?@^|~,;\\")
  st)

(defvar spl-mode-syntax-table
  (spl-fill-syntax-table (make-syntax-table))
  "Syntax table for spl-mode")

(defun spl-prettier ()
  "Unicode symbols"
  (setq
   prettify-symbols-alist
   '(
     ("!!" . ?‼) ; U+203C ‼ Double Exclamation Mark
     ("!~" . ?≉) ; U+2249 ≉ Not Almost Equal To ; ≁
     ("*" . ?×) ; U+00D7 × Multiplication Sign
     ("**" . ?⇈) ; U+21C8 ⇈ Upwards Paired Arrows
     ("*.x" . ?⊗) ; U+2297 ⊗ Circled Times
     ("++" . ?⧺) ; U+29FA ⧺ Double plus
     ("+++" . ?⧻) ; U+29FB ⧻ Triple Plus
     ("-" . ?−) ; U+2212 − Minus Sign
     ("--" .?⍝) ; U+235D ⍝ APL Functional Symbol Up Shoe Jot ; U+2014 — Em Dash
     ("-<" . ?⤙) ; U+2919 ⤙ Leftwards Arrow-Tail
     ("->" . ?→) ; U+2190 → Rightwards Arrow
     (".." .?…) ; U+2026 … Horizontal Ellipsis; U+2025 ‥ Two Dot Leader
     ("/" . ?÷) ; U+00F7 ÷ Division Sign
     (":." . ?‣) ; U+2023 ‣ Triangular Bullet
     (":/" . ?⧸) ; U+00B0 ⧸ Big Solidus
     (":/1" .?₁) ; U+2081 ₁ Subscript One
     (":/2" .?₂) ; U+2082 ₂ Subscript Two
     (":/3" .?₃) ; U+2083 ₃ Subscript Three
     (":/4" .?₄) ; U+2084 ₄ Subscript Four
     ("::" . ?·) ; U+00B7 · Middle Dot ; ∷
     (":=" . ?←) ; U+2190 ← Leftwards Arrow (U+2254 ≔ Colon Equals)
     (":?" .?⍰) ; U+2370 ⍰ Apl Functional Symbol Quad Question ; U+291D ⤝ Leftwards arrow to black diamond
     (":@" . ?⋄) ; U+22C4 ⋄ Diamond Operator
     ("<=" . ?≤) ; U+2264 ≤ Less-than or equal to
     ("<~" . ?⪅) ; U+2A85 ⪅ Less-Than or Approximate ; ⪝
     ("==" . ?≡) ; U+2261 ≡ Identical To
     ("=>" . ?⇒) ; U+21D2 ⇒ Rightwards Double Arrow
     (">=" . ?≥) ; U+2265 ≥ Greater-than or equal to
     (">~" . ?⪆) ; U+2A86 ⪆ Greater-Than or Approximate ; ⪞
     ("Phi" . ?ϕ) ; U+03D5 ϕ Greek Phi Symbol
     ("Sqrt" . ?√) ; U+221A √ Square Root
     ("Sum" . ?∑) ; U+03A3 Σ Greek Capital Letter Sigma ; U+2211 ∑ N-Ary Summation
     ("^" . ?ˆ) ; U+02C6 ˆ Modifier Letter Circumflex Accent ; U+2191 ↑ Upwards Arrow
     ("alpha" . ?α) ; U+03B1 α Greek Small Letter Alpha
     ("and" . ?∧) ; U+2227 ∧ Logical and
     ("beta" . ?β) ; U+03B2 β Greek Small Letter Beta
     ("cancelFlat" . ?♮) ; U+266E ♮ Music Natural Sign
     ("cancelSharp" . ?♮) ; U+266E ♮ Music Natural Sign
     ("compose" .?∘) ;  U+2218 ∘ Ring Operator
     ("concatenation" .?⧻) ; U+29FB ⧻ Triple Plus
     ("crossedMultiply" . ?⊗) ; U+2297 ⊗ Circled Times
     ("delta" .?δ) ; U+03B4 δ Greek Small Letter Delta
     ("doesNotInclude" . ?∌) ; Unicode: U+220C ∌ Does not contain as member
     ("duplicate" .?!)
     ("each" . ?⍵) ; U+2375 ⍵ APL Functional Symbol Omega
     ("epsilon" . ?ε) ; U+03B5 ε Greek Small Letter Epsilon
     ("false" . ?⊥) ; U+22A5 ⊥ Up tack
     ("first" .?₁) ; U+2081 ₁ Subscript One
     ("flat" . ?♭) ; U+266D ♭ Music Flat Sign
     ("fourth" .?₄) ; U+2084 ₄ Subscript Four
     ("includes" . ?∋) ; U+220B ∋ Contains as Member
     ("inf" .?∞) ; U+221E ∞ Infinity
     ("intersection" . ?∩) ; U+2229 ∩ Intersection
     ("lambda" .?λ) ; U+03BB λ Greek Small Letter Lamda
     ("mu" .?μ) ; U+03BC μ Greek Small Letter Mu
     ("natural" . ?♮) ; U+266E ♮ Music Natural Sign
     ("not" . ?¬) ; U+00AC ¬ Not sign
     ("or" . ?∨) ; ∨ U+2228 Logical Or
     ("phi" .?φ) ; U+03C6 φ Greek Small Letter Phi
     ("pi" . ?π) ; U+03C0 π Greek Small Letter Pi
     ("product" . ?Π) ; U+03A0 Π Greek Capital Letter Pi
     ("quarterToneFlat" .?𝄳) ; U+1D133 𝄳 Musical Symbol Quarter Tone Flat
     ("quarterToneSharp" .?𝄲) ; U+1D132 𝄲 Musical Symbol Quarter Tone Sharp
     ("r" .?𝑟) ; U+1D45F 𝑟 Mathematical Italic Small R
     ("return" . ?↑) ; U+2191 ↑ Upwards Arrow
     ("return:/1" . ?↑) ; U+2191 ↑ Upwards Arrow
     ("reversed" .?ᴙ) ; U+1D19 ᴙ Latin Letter Small Capital Reversed R
     ("rho" .?ρ) ; U+03C1 ρ Greek Small Letter Rho
     ("second" .?₂) ; U+2082 ₂ Subscript Two
     ("sharp" . ?♯) ; U+266F ♯ Music Sharp Sign
     ("sqrt" . ?√) ; “√” U+221A Square Root
     ("squared" .?²) ; U+00B2 ² Superscript Two
     ("sum" . ?Σ) ; U+03A3 Σ Greek Capital Letter Sigma ; U+2211 ∑ N-Ary Summation
     ("theta" .?θ) ; U+03B8 θ Greek Small Letter Theta
     ("third" .?₃) ; U+2083 ₃ Subscript Three
     ("transposed" .?ᵀ) ; U+1D40 ᵀ Modifier Letter Capital T
     ("true" . ?⊤) ; U+22A4 ⊤ Down Tack
     ("undefined" . ?⊥) ; U+22A5 ⊥ Up tack
     ("union" . ?∪) ; U+222A ∪ Union
     ("valueWithReturn" . ?↓) ; U+2193 ↓ Downwards Arrow
     ("||" .?‖) ; U+2016 ‖ Double Vertical Line
     ("~" . ?≈) ; U+2248 ≈ Almost Equal To
     ("~=" . ?≠) ; U+2260 ≠ Not equal to
     ("~>" . ?⇝) ; U+21DD ⇝ Rightwards Squiggle Arrow
     ("~~" . ?≢) ; U+2262 ≢ Not Identical To
     ;; (")|" . ?⦈) ; U+2988 ⦈ Z Notation Right Image Bracket ; ⦄ ; ⸡
     ;; ("-}" . ?⦄) ; U+2984 ⦄ Right White Curly Bracket
     ;; ("..." .?‥) ; U+2026 … Horizontal Ellipsis; U+22ef ⋯ Midline Horizontal Ellipsis
     ;; (";;" . ?⋯)
     ;; ("e" . ?𝑒)
     ;; ("{-" . ?⦃) ; U+2983 ⦃ Left White Curly Bracket
     ;; ("|(" . ?⦇) ; U+2989 ⦇ Z Notation Left Image Bracket
     )))

(defun spl-fill-mode-map (map)
  "Install Spl keybindings into MAP."
  (define-key map (kbd "C-c >") 'spl-see-spl)
  (define-key map (kbd "C-c C-h") 'spl-help)
  (define-key map (kbd "C-c C-a") 'spl-play-paragraph)
  (define-key map (kbd "C-c C-g") 'spl-draw-paragraph)
  (define-key map (kbd "C-c C-e") 'spl-eval-paragraph)
  (define-key map (kbd "C-c C-c") 'spl-eval-region-or-line)
  (define-key map (kbd "C-c C-k") 'spl-reset-scsynth)
  (define-key map (kbd "C-c C-s") 'spl-stop)
  (define-key map (kbd "C-c C-r") 'spl-insert-non-local-return)
  (define-key map (kbd "C-c C-i") 'spl-indent-paragraph)
  (define-key map (kbd "C-c C-q") 'spl-exit)
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
  (set (make-local-variable 'comment-start) "{\\- ")
  (set (make-local-variable 'comment-end) " \\-}")
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
