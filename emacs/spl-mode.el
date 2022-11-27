;;; spl-mode.el --- Simple Programming Language

;;; Commentary:
; .sl files contain Simple Programming Language codes

;;; Code:

(require 'font-lock)
(require 'sclang-mode)

(defun spl-netcat-cmd (cmd key value)
  "Send CMD with the parameter KEY = VALUE to the Spl server."
  (shell-command
   (format
    "echo '{\"command\": \"%s\", \"%s\": %s}' | netcat -C -q 0 -u 127.0.0.1 3010"
    cmd key (json-encode-string value))))

(defun spl-get-selection ()
  "Get the currently selected text as a string."
  (buffer-substring-no-properties (region-beginning) (region-end)))

(defun spl-eval-region ()
  "Evaluate region at Spl server."
  (interactive)
  (spl-netcat-cmd "evalText" "text" (spl-get-selection)))

(defun spl-play-region ()
  "Play region at Spl server."
  (interactive)
  (spl-netcat-cmd "playText" "text" (spl-get-selection)))

(defun spl-play-current-file ()
  "Play current file at Spl server."
  (interactive)
  (spl-netcat-cmd "playFile" "fileName" buffer-file-name))

(defun spl-clear-system-clock ()
  (interactive)
  (spl-netcat-cmd "evalText" "text" "system::clock.clear"))

(defun spl-reset-scsynth ()
  (interactive)
  (spl-netcat-cmd "evalText" "text" "globalScsynth().reset"))

(defun spl-stop ()
  (interactive)
  (spl-clear-system-clock)
  (spl-reset-scsynth))

(defvar spl-mode-hook
  nil
  "Hook to run on entering spl-mode.")

(defconst spl-font-lock-keywords
  (list
   `(,(regexp-opt '("var" ":=") 'symbols) . font-lock-keyword-face)
   `(,(regexp-opt '("false" "inf" "nil" "pi" "true") 'symbols) . font-lock-builtin-face)
   `(,(regexp-opt '("do" "if" "kr" "timesRepeat" "while") 'symbols) . font-lock-function-name-face)
   `(,(regexp-opt '("error" "warn") 'symbols) . font-lock-warning-face)
   '("\\<\\([A-Z][a-zA-Z0-9]*\\)\\>" . font-lock-type-face)
   '(":\\<\\([a-z][a-zA-Z0-9]*\\)\\>" . 'font-lock-variable-name-face))
  "Spl font-lock rules.")

(defun spl-fill-syntax-table (st)
  "Modify the syntax table ST for Spl."
  (modify-syntax-entry ?\( ". 1" st)
  (modify-syntax-entry ?\) ". 4" st)
  (modify-syntax-entry ?* ". 23" st)
  (modify-syntax-entry ?; ". 12b" st)
  (modify-syntax-entry ?\n "> b" st)
  st)

(defvar spl-mode-syntax-table
  (spl-fill-syntax-table (make-syntax-table))
  "Syntax table for spl-mode")

(defun spl-fill-mode-map (map)
  "Install Spl keybindings into MAP."
  (define-key map (kbd "C-c C-a") 'spl-play-region)
  (define-key map (kbd "C-c C-e") 'spl-eval-region)
  (define-key map (kbd "C-c C-k") 'spl-reset-scsynth)
  (define-key map (kbd "C-c C-s") 'spl-stop)
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
  (set (make-local-variable 'comment-start) ";; ")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'font-lock-defaults) '(spl-font-lock-keywords))
  nil)

(define-derived-mode spl-mode prog-mode "Spl"
  "Major mode for editing Simple Programming Language files."
  :group 'spl
  :syntax-table spl-mode-syntax-table
  (spl-mode-set-local-variables))

(add-to-list 'auto-mode-alist '("\\.sl$" . spl-mode))
(add-to-list 'auto-mode-alist '("\\.help.sl$" . spl-mode))
(add-to-list 'auto-mode-alist '("\\.stc$" . spl-mode))

(provide 'spl-mode)

;;; spl.el ends here
