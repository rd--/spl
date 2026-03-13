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
  (let ((case-fold-search nil))
    (mapc (lambda (filename)
            (find-file-other-window filename))
          (find-lisp-find-files dir rgx))))

(defun spl-help ()
  "Lookup up the name at point in the Spl help files."
  (interactive)
  (let ((rgx (concat "^" (thing-at-point 'symbol) "\\.help\\.sl$")))
    (spl-find-files (concat spl-directory "Help/") rgx)))


(defvar spl-help-url-prefix "http://localhost/rd/index.cgi"
  "The Spl help browser Url prefix.")

(defun spl-browse-help ()
  "Lookup up the name at point in the Spl help files."
  (interactive)
  (let ((topic (thing-at-point 'symbol)))
    (browse-url
     (format "%s?t=spl&e=Help/Reference/%s.help.sl" spl-help-url-prefix topic))))

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

(defun spl-trim-leading-whitespace (str)
  "Remove whitespace at the beginning of STR."
  (save-match-data
    (if (string-match "\\`[ \t\n\r]+" str)
        (replace-match "" t t str)
      str)))

(defun spl-delete-markdown-code-fences (str)
  "Remove Mardown code fences from the string STR if present.

Delete any leading whitespace this creates."
  (spl-trim-leading-whitespace
   (replace-regexp-in-string "^```.*$\\|~~~.*$" "" str)))

(defun spl-delete-doctest-prefixes (str)
  "Remove Doctest prefixes from the string STR if present.

If the string begins with a doctest, also delete all non doctest lines."
  (if (char-equal (string-to-char str) ?>)
      (setq str (replace-regexp-in-string "^[^>].*" "" str)))
  (replace-regexp-in-string "^[> ]*" "" str))

(defun spl-set-region-to-paragraph ()
  "Set the mark at the start and point at the end of the current paragraph."
  (interactive)
  (backward-paragraph)
  (push-mark nil t t)
  (forward-paragraph))

(defun spl-get-text (start end)
  "Get the text from start to end as a string, with code fences deleted."
  (spl-delete-doctest-prefixes
   (spl-delete-markdown-code-fences
    (buffer-substring-no-properties start end))))

(defun spl-get-paragraph ()
  "Get the current paragraph as a string, with code fences deleted."
  (spl-set-region-to-paragraph)
  (spl-get-text (region-beginning) (region-end)))

(defun spl-uncomment (s)
  "Remove initial comment and Bird-literate markers from the string S if present."
   (replace-regexp-in-string "^[- ]*[> ]*" "" s))

(defun spl-get-line ()
  "Get the current line as a string."
  (spl-get-text
   (line-beginning-position)
   (line-end-position)))

(defun spl-get-region ()
  "Get the current region as a string."
  (spl-get-text
   (region-beginning)
   (region-end)))

(defun spl-eval-string (str)
  "Evaluate string STR."
  (spl-netcat-cmd 'evalText 'text str))

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
  "Draw current paragraph."
  (interactive)
  (spl-eval-string (format "{ %s }.value.drawing.show" (spl-get-paragraph))))

(defun spl-print-promise ()
  "Print Promise of current paragraph when it resolves."
  (interactive)
  (spl-eval-string (format "{ %s }.value.then { :answer | answer.postLine }" (spl-get-paragraph))))

(defun spl-plot-paragraph ()
  "Plot Ugen graph of current paragraph."
  (interactive)
  (spl-eval-string (format "{ %s }.value.soundPlot(0.1)" (spl-get-paragraph))))

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
   (list nil "^\\(/\\* .* \\*/\\)$" 1) ; Region Comment (C)
   ;; (list nil "^\\(-- .*\\)$" 1) ; Line Comment
   (list nil "^\\(#+ .*\\)$" 1) ; Heading
   (list nil "^\\(\+?@?\[?@?[A-Z][, A-Za-z0-9@]+[A-Za-z0-9]\]?\\).* {\\( |\\|$\\)" 1)
   (list nil "^\\(\t\[?[, *&@|~+/%><=?!#^a-zA-Z0-9-]+\]?\\) {" 1))
  "Value for `imenu-generic-expression' in Spl mode.")

(defconst spl-font-lock-keywords
  (list
   `(,(regexp-opt '("let" "var") 'symbols) . font-lock-keyword-face)
   `(,(regexp-opt '("false" "nil" "true" "system") 'symbols) . font-lock-builtin-face)
   `(,(regexp-opt '("do" "doWhileFalse" "doWhileTrue" "if" "ifTrue" "ifFalse" "ifEmpty" "ifNotEmpty" "ifNil" "ifNotNil" "kr" "timesRepeat" "whileFalse" "whileTrue" "withIndexDo") 'symbols) . font-lock-function-name-face)
   `(,(regexp-opt '("error" "warning") 'symbols) . font-lock-warning-face)
   '("\\<[A-Z][a-zA-Z0-9]*\\>" . font-lock-type-face)
   '(" :[a-z][a-zA-Z0-9]*" . 'font-lock-variable-name-face)
   ;'("`[a-zA-Z]*`" . 'font-lock-constant-face)
   '("primitive:" . 'font-lock-warning-face))
  "Spl font-lock rules.")

;(defun spl-font-lock-syntactic-face (state)
;  (cond ((eq (nth 3 state) ?') 'font-lock-string-face)
;	((nth 3 state) 'font-lock-constant-face)
;	((nth 4 state) 'font-lock-comment-face)))

(defun spl-fill-syntax-table (st)
  "Modify the syntax table ST for Spl."
  (modify-syntax-entry ?\  " " st) ; whitespace
  (modify-syntax-entry ?\t " " st) ; whitespace
  (modify-syntax-entry ?\( "()" st) ; open parenthesis
  (modify-syntax-entry ?\) ")(" st) ; close parenthesis
  (modify-syntax-entry ?\[ "(]" st) ; open parenthesis
  (modify-syntax-entry ?\] ")[" st) ; close parenthesis
  (modify-syntax-entry ?\{ "(}" st) ; open parenthesis
  (modify-syntax-entry ?\} "){" st) ; close parenthesis
  (modify-syntax-entry ?* ". 23n" st) ; punctuation & comment
  (modify-syntax-entry ?/ ". 14b" st) ; punctuation & comment
  ;; (modify-syntax-entry ?\n ">" st) ; comment end
  (modify-syntax-entry ?\' "\"" st) ; string quote
  ;; (modify-syntax-entry ?\" "\"" st) ; string quote
  ;; (modify-syntax-entry ?\` "\"" st) ; string (symbol) quote (interacts badly with code fences)
  (modify-syntax-entry ?\\ "\\" st) ; escape
  (mapc (lambda (x)
          (modify-syntax-entry x "." st)) ; punctuation only
        "!#$%&+-.:<=>?@^|~,;\\")
  st)

(defvar spl-mode-syntax-table
  (spl-fill-syntax-table (make-syntax-table))
  "Syntax table for spl-mode")

(defun spl-prettier ()
  "Unicode symbols"
  (setq prettify-symbols-compose-predicate
	(lambda (start end match)
	  (if (string-match-p "\\[\\|\\]\\|{\\|}"  match)
	      t
	    (prettify-symbols-default-compose-p start end match))))
  (setq
   prettify-symbols-alist
   '(
     ("[]" . ?⍬) ; Apl ; U+236C ⍬ APL Functional Symbol Zilde
     ("ceiling" . ?⌈) ; Apl
     ("doubleFactorial" . ?‼) ; U+203C ‼ Double Exclamation Mark
     ("factorial" . ?!) ; Apl
     ("floor" . ?⌊) ; Apl
     ("gradeDown" . ?⍒) ; Apl
     ("gradeUp" . ?⍋) ; Apl
     ("identity" . ?⊣) ; Apl ; U+22A3 ⊣ Left Tack
     ("innerProduct" . ?‧) ; Apl ; U+2027 ‧ Hyphenation Point ; U+25AA ▪ Black Small Square
     ("iota" . ?⍳) ; Apl ; U+2373 ⍳ APL Functional Symbol Iota
     ("leftIdentity" . ?⊣) ; Apl ; U+22A3 ⊣ Left Tack
     ("log" . ?⍟) ; Apl ; U+235F ⍟ Apl Functional Symbol Circle Star
     ("max" . ?⌈) ; Apl ; U+2308 ⌈ Left Ceiling
     ("min" . ?⌊) ; Apl ; U+230A ⌊ Left Floor
     ("negate" . ?-) ; Apl
     ("nthRoot" . ?√) ; Apl
     ("over" . ?⍥) ; Apl
     ("reciprocal" . ?÷) ; Apl
     ("reshape" . ?⍴) ; Apl
     ("rightIdentity" . ?⊢) ; Apl ; U+22A2 ⊢ Right Tack
     ("rotateLeft" . ?⌽) ; Apl
     ("shape" . ?⍴) ; Apl ; U+2374 ⍴ Apl Functional Symbol Rho
     ("swap" . ?⍨) ; Apl ; U+2368 ⍨ APL Functional Symbol Tilde Diaeresis
     ;("bind" . ?∘) ; Apl
     ;("conjugate" . ?+) ; Apl & J
     ;("constant" . ?⍨) ; Apl
     ;("drop" . ?↓) ; Apl
     ;("enclose" . ?⊂) ; Apl
     ;("exp" . ?*) ; Apl (Not ×, C.f. sign, J=^)
     ;("expand" . ?\\) ; Apl
     ;("find" . ?⍷) ; Apl
     ;("foldRight" . ?/) ; Apl
     ;("nest" . ?⊆) ; Apl
     ;("nubSieve" . ?≠) ; Apl
     ;("partition" . ?⊆) ; Apl
     ;("power" . ?*) ; Apl
     ;("reduce" . ?/) ; Apl
     ;("replicateEach" . ?/) ; Apl
     ;("sign" . ?×) ; Apl (Not *, C.f. exp, J=*)
     ;("take" . ?↑) ; Apl
     ;("tally" . ?≢) ; Apl
     ;("unique" . ?∪) ; Apl ; U+2191 ↑ Upwards Arrow; U+222A ∪ Union
     ;("windowedReduce" . ?/) ; Apl
     ("!!" . ?‼) ; U+203C ‼ Double Exclamation Mark
     ("!~" . ?≉) ; U+2249 ≉ Not Almost Equal To ; ≁
     ("*" . ?×) ; U+00D7 × Multiplication Sign
     ("**" . ?⇈) ; U+21C8 ⇈ Upwards Paired Arrows
     ("*.x" . ?⊗) ; U+2297 ⊗ Circled Times
     ("//" . ?⫽) ; U+02AFD ⫽ Double Solidus Operator
     ("\\\\" . ?⑊) ; U+244A ⑊ OCR Double Backslash
     ("+-" . ?±) ; U+00B1 ± Plus-Minus Sign
     ("++" . ?⧺) ; U+29FA ⧺ Double plus
     ("+++" . ?⧻) ; U+29FB ⧻ Triple Plus
     ("-" . ?−) ; U+2212 − Minus Sign
     ("-<" . ?⤙) ; U+2919 ⤙ Leftwards Arrow-Tail
     ("->" . ?→) ; U+2190 → Rightwards Arrow
     ("->>" . ?↠) ; U+21A0 ↠ Rightwards Two Headed Arrow
     ("--" . ?—) ; U+2014 — Em Dash; U+02013 – En Dash
     ("---" . ?⸺) ; U+02E3A ⸺ Two-Em Dash
     ("-->" . ?⟶) ; U+027F6 ⟶ Long Rightwards Arrow
     (".." . ?…) ; U+2026 … Horizontal Ellipsis; U+2025 ‥ Two Dot Leader
     ("/" . ?÷) ; U+00F7 ÷ Division Sign
     (":." . ?‣) ; U+2023 ‣ Triangular Bullet
     (":/" . ?⧸) ; U+00B0 ⧸ Big Solidus
     (":/0" . ?₀) ; U+2080 ₀ Subscript Zero
     (":/1" . ?₁) ; U+2081 ₁ Subscript One
     (":/2" . ?₂) ; U+2082 ₂ Subscript Two
     (":/3" . ?₃) ; U+2083 ₃ Subscript Three
     (":/4" . ?₄) ; U+2084 ₄ Subscript Four
     (":/5" . ?₅) ; U+2085 ₅ Subscript Five
     (":/6" . ?₆) ; U+2086 ₆ Subscript Six
     (":/7" . ?₇) ; U+2087 ₇ Subscript Seven
     (":/8" . ?₈) ; U+2088 ₈ Subscript Eight
     (":/9" . ?₉) ; U+2089 ₉ Subscript Nine
     ("::" . ?·) ; U+00B7 · Middle Dot ; ∷
     (":=" . ?←) ; U+2190 ← Leftwards Arrow (U+2254 ≔ Colon Equals)
     (":?" . ?⍰) ; U+2370 ⍰ Apl Functional Symbol Quad Question ; U+291D ⤝ Leftwards arrow to black diamond
     (":@" . ?⋄) ; U+22C4 ⋄ Diamond Operator
     ("<-" . ?←) ; U+2190 ← Leftwards Arrow
     ("<=" . ?≤) ; U+2264 ≤ Less-than or equal to
     ("<|" . ?≺) ; U+227a ≺ Precedes ; U+25C1 ◁ White Left-Pointing Triangle
     ("<=|" . ?≼) ; U+227c ≼ Precedes Or Equal To
     ("<~" . ?⪅) ; U+2A85 ⪅ Less-Than or Approximate ; ⪝
     ("<<" . ?≪) ; U+226A ≪ Much Less-Than ; U+00AB « Left-Pointing Double Angle Quotation Mark
     ("<<<" . ?⋘) ; U+22D8 ⋘ Very Much Less-Than Unicode Character
     ("==" . ?≡) ; U+2261 ≡ Identical To
     ("=>" . ?⇒) ; U+21D2 ⇒ Rightwards Double Arrow
     (">=" . ?≥) ; U+2265 ≥ Greater-than or equal to
     (">~" . ?⪆) ; U+2A86 ⪆ Greater-Than or Approximate ; ⪞
     (">>" . ?≫) ; U+226B ≫ Much Greater-Than ; U+00BB » Right-Pointing Double Angle Quotation Mark
     (">>>" . ?⋙) ; U+22D9 ⋙ Very Much Greater-Than
     ("|>" . ?≻) ; U+227B ≻ Succeeds ; U+25B7 ▷ White Right-Pointing Triangle
     ("|>=" . ?≽) ; U+227D ≽ Succeeds or Equal To
     ;("/*" . ?«) ; U+000AB « Left-Pointing Double Angle Quotation Mark
     ;("*/" . ?») ; U+000BB » Right-Pointing Double Angle Quotation Mark
     ("Phi" . ?ϕ) ; U+03D5 ϕ Greek Phi Symbol
     ("Psi" . ?Ψ) ; U+03A8 Ψ Greek Capital Letter Psi
     ("Sqrt" . ?√) ; U+221A √ Square Root
     ("Sum" . ?∑) ; U+03A3 Σ Greek Capital Letter Sigma ; U+2211 ∑ N-Ary Summation
     ("^" . ?ˆ) ; U+02C6 ˆ Modifier Letter Circumflex Accent ; U+2191 ↑ Upwards Arrow
     ("alpha" . ?α) ; U+03B1 α Greek Small Letter Alpha
     ("and" . ?∧) ; U+2227 ∧ Logical and
     ("beta" . ?β) ; U+03B2 β Greek Small Letter Beta
     ("cancelFlat" . ?♮) ; U+266E ♮ Music Natural Sign
     ("cancelSharp" . ?♮) ; U+266E ♮ Music Natural Sign
     ("complement" . ?∁) ; U+2201 ∁ Complement
     ("compose" . ?∘) ;  U+2218 ∘ Ring Operator
     ("catenate" . ?⧺) ; U+29FA ⧺ Double plus, U+29FB ⧻ Triple Plus
     ("concatenation" . ?⧺) ; U+29FA ⧺ Double plus
     ("Chi" . ?Χ) ; U+03A7 Χ Greek Capital Letter Chi
     ("chi" . ?χ) ; U+03C7 χ Greek Small Letter Chi
     ("crossedMultiply" . ?⊗) ; U+2297 ⊗ Circled Times
     ("degree" . ?°) ; U+00b0 ° Degree Sign
     ("delta" . ?δ) ; U+03B4 δ Greek Small Letter Delta
     ("difference" . ?∖) ; U+2216 ∖ Set Minus
     ("doesNotInclude" . ?∌) ; Unicode: U+220C ∌ Does not contain as member
     ("duplicate" . ?!)
     ("each" . ?⍵) ; U+2375 ⍵ APL Functional Symbol Omega
     ("epsilon" . ?ε) ; U+03B5 ε Greek Small Letter Epsilon
     ("false" . ?⊥) ; U+22A5 ⊥ Up tack
     ("first" . ?₁) ; U+2081 ₁ Subscript One
     ("flat" . ?♭) ; U+266D ♭ Music Flat Sign
     ("fourth" . ?₄) ; U+2084 ₄ Subscript Four
     ("gamma" . ?γ) ; U+03B3 γ Greek Small Letter Gamma ; U+1D6FE 𝛾 Mathematical Italic Small Gamma
     ("Gamma" . ?Γ) ; U+0393 Γ Greek Capital Letter Gamma
     ("i" . ?𝒊) ; U+1D48A 𝒊 Mathematical Italic Small I
     ("includes" . ?∋) ; U+220B ∋ Contains as Member
     ("index" . ?ⅈ) ; U+02148 ⅈ Double-Struck Italic Small I
     ("infinity" . ?∞) ; U+221E ∞ Infinity
     ("Infinity" . ?∞) ; U+221E ∞ Infinity
     ("intersection" . ?∩) ; U+2229 ∩ Intersection
     ("j" . ?𝑗) ; U+1D457 𝑗 Mathematical Italic Small J
     ("kappa" .?κ) ; U+003BA κ Greek Small Letter Kappa
     ("lambda" . ?λ) ; U+03BB λ Greek Small Letter Lamda
     ("Lambda" . ?Λ) ; U+039B Λ Greek Capital Letter Lamda
     ("mu" . ?μ) ; U+03BC μ Greek Small Letter Mu
     ("micro" . ?μ) ; U+03BC μ Greek Small Letter Mu
     ("natural" . ?♮) ; U+266E ♮ Music Natural Sign
     ("not" . ?¬) ; U+00AC ¬ Not sign
     ("nu" . ?ν) ; U+003BD ν Greek Small Letter Nu
     ("omega" . ?ω) ; U+03C9 ω Greek Small Letter Omega
     ("Omega" . ?Ω) ; U+03A9 Ω Greek Capital Letter Omega
     ("or" . ?∨) ; ∨ U+2228 Logical Or
     ("percent" . ?%) ; Unicode: U+0025 % Percent Sign
     ("phi" . ?φ) ; U+03C6 φ Greek Small Letter Phi
     ("psi" . ?ψ) ; U+03C8 ψ Greek Small Letter Psi
     ("pi" . ?π) ; U+03C0 π Greek Small Letter Pi
     ("Pi" . ?Π) ; U+003A0 Π Greek Capital Letter Pi
     ("precedes" . ?≺) ; U+227a ≺ Precedes
     ("precedesOrEqualTo" . ?≼) ; U+227c ≼ Precedes Or Equal To
     ("succeeds" . ?≻) ; U+227B ≻ Succeeds
     ("succeedsOrEqualTo" . ?≽) ; U+227D ≽ Succeeds or Equal To ; U+2AB0 ⪰ Succeeds Above Single-Line Equals Sign
     ("product" . ?Π) ; U+03A0 Π Greek Capital Letter Pi
     ("quarterToneFlat" . ?𝄳) ; U+1D133 𝄳 Musical Symbol Quarter Tone Flat
     ("quarterToneSharp" . ?𝄲) ; U+1D132 𝄲 Musical Symbol Quarter Tone Sharp
     ("r" . ?𝑟) ; U+1D45F 𝑟 Mathematical Italic Small R
     ("return" . ?↑) ; U+2191 ↑ Upwards Arrow
     ("return:/1" . ?↑) ; U+2191 ↑ Upwards Arrow
     ("reverse" . ?ᴙ) ; U+1D19 ᴙ Latin Letter Small Capital Reversed R ; U+233D ⌽ APL Functional Symbol Circle Stile
     ("rotateLeft" . ?⌽) ; U+233D ⌽ APL Functional Symbol Circle Stile
     ("rho" . ?ρ) ; U+03C1 ρ Greek Small Letter Rho
     ("second" . ?₂) ; U+2082 ₂ Subscript Two
     ("sharp" . ?♯) ; U+266F ♯ Music Sharp Sign
     ("sigma" . ?σ) ; U+03C3 σ Greek Small Letter Sigma
     ("Sigma" . ?Σ) ; U+03A3 Σ Greek Capital Letter Sigma
     ("sqrt" . ?√) ; “√” U+221A Square Root
     ("squareRoot" . ?√) ; “√” U+221A Square Root
     ("square" . ?²) ; U+00B2 ² Superscript Two
     ("cube" . ?³) ; U+00B3 ³ Superscript Three
     ("sum" . ?Σ) ; U+03A3 Σ Greek Capital Letter Sigma ; U+2211 ∑ N-Ary Summation
     ("Tau" . ?Τ) ; U+03A4 Τ Greek Capital Letter Tau
     ("tau" . ?τ) ; U+03C4 τ Greek Small Letter Tau
     ("theta" . ?θ) ; U+03B8 θ Greek Small Letter Theta
     ("Theta" . ?Θ) ; U+0398 Θ Greek Capital Letter Theta
     ("third" . ?₃) ; U+2083 ₃ Subscript Three
     ("transpose" . ?ᵀ) ; U+1D40 ᵀ Modifier Letter Capital T ; U+2349 ⍉ APL Functional Symbol Circle Backslash
     ("true" . ?⊤) ; U+22A4 ⊤ Down Tack
     ("u" . ?𝑢) ; U+1D462 𝑢 Mathematical Italic Small U
     ("undefined" . ?⊥) ; U+22A5 ⊥ Up tack
     ("union" . ?∪) ; U+222A ∪ Union
     ("valueWithReturn" . ?↓) ; U+2193 ↓ Downwards Arrow
     ("xi" . ?ξ) ; U+03BE ξ Greek Small Letter Xi
     ("Xi" . ?Ξ) ; U+039E Ξ Greek Capital Letter Xi
     ("Zeta" . ?Ζ) ; U+0396 Ζ Greek Capital Letter Zeta
     ("zeta" . ?ζ) ; U+03B6 ζ Greek Small Letter Zeta
     ("||" . ?‖) ; U+2016 ‖ Double Vertical Line
     ("~" . ?≈) ; U+2248 ≈ Almost Equal To
     ("!=" . ?≠) ; U+2260 ≠ Not equal to
     ("~>" . ?⇝) ; U+21DD ⇝ Rightwards Squiggle Arrow
     ("!==" . ?≢) ; U+2262 ≢ Not Identical To
     (":;" . ?↲) ; U+21B2 ↲ Downwards Arrow With Tip Leftwards
     ("Sha" . ?Ш) ; U+0428 Ш Cyrillic Capital Letter Sha
     ("sha" . ?ш) ; U+0448 ш Cyrillic Small Letter Sha
     ("halve" . ?½) ; U+00BD ½ Vulgar Fraction One Half

     ("[|" . ?⟦) ; U+27E6 ⟦ Mathematical Left White Square Bracket
     ("|]" . ?⟧) ; U+27E7 ⟧ Mathematical Right White Square Bracket

     ("{|" . ?⦃) ; U+2983 ⦃ Left White Curly Bracket
     ("|}" . ?⦄) ; U+2984 ⦄ Right White Curly Bracket

     ;; ("--" . ?⍝) ; U+235D ⍝ APL Functional Symbol Up Shoe Jot ; U+2014 — Em Dash
     ;; (")|" . ?⦈) ; U+2988 ⦈ Z Notation Right Image Bracket ; ⦄ ; ⸡
     ;; ("..." . ?‥) ; U+2026 … Horizontal Ellipsis; U+22ef ⋯ Midline Horizontal Ellipsis
     ;; ("e" . ?𝑒)
     ;; ("|(" . ?⦇) ; U+2989 ⦇ Z Notation Left Image Bracket
     )))

(defun spl-fill-mode-map (map)
  "Install Spl keybindings into MAP."
  (define-key map (kbd "C-c >") 'spl-see-spl)
  (define-key map (kbd "C-c C-h") 'spl-help)
  (define-key map (kbd "C-c C-H") 'spl-browse-help)
  (define-key map (kbd "C-c C-a") 'spl-play-paragraph)
  (define-key map (kbd "C-c C-g") 'spl-draw-paragraph)
  (define-key map (kbd "C-c C-p") 'spl-print-promise)
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
  (set (make-local-variable 'comment-start) "/* ")
  (set (make-local-variable 'comment-end) " */")
  ;(set (make-local-variable 'font-lock-syntactic-face-function) 'spl-font-lock-syntactic-face)
  (set (make-local-variable 'font-lock-defaults) '(spl-font-lock-keywords))
  (setq-local imenu-sort-function 'imenu--sort-by-name)
  (setq-local imenu-generic-expression spl-imenu-generic-expression))

(define-derived-mode spl-mode prog-mode "Spl"
  "Major mode for editing Simple Programming Language files."
  :group 'spl
  :syntax-table spl-mode-syntax-table
  (spl-mode-set-local-variables))

(add-to-list 'auto-mode-alist '("\\.sl$" . spl-mode))
(add-to-list 'auto-mode-alist '("\\.sp$" . spl-mode))
(add-to-list 'auto-mode-alist '("\\.help.sl$" . spl-mode))
(add-to-list 'auto-mode-alist '("\\.help.pre$" . spl-mode))

(defun spl-indent-region ()
  "Run spl-indent on region."
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "spl-indent" nil t))

(defun spl-fix-category ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "/home/rohan/sw/spl/hs/fixCategory" t t))

(defun spl-to-doctest ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "/home/rohan/sw/spl/hs/toDoctest" t t))

(define-skeleton spl-mathematica-reference-skeleton
  "Insert a Mathematica reference."
  "Ref: "
  "References:\n"
  "_Mathematica_\n"
  "[1](https://mathworld.wolfram.com/" str | " *** Ref *** " ".html)\n")

(define-skeleton spl-supercollider-reference-skeleton
  "Insert a SuperCollider reference."
  "Ref: "
  "References:\n"
  "_SuperCollider_\n"
  "[1](https://doc.sccode.org/Classes/" str | " *** Ref *** " ".html)\n")

(define-skeleton spl-haskell-reference-skeleton
  "Insert a Haskell Prelude reference."
  "Ref: "
  "References:\n"
  "_Haskell_\n"
  "[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:" str | " *** Ref *** " ")\n")

(define-skeleton spl-image-reference-skeleton
  "Insert an image reference."
  "Ref: "
  "![](sw/spl/Help/Image/" str ".svg)\n")

(provide 'spl-mode)

;;; spl.el ends here
