;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     javascript
     emacs-lisp
     git
     markdown
     syntax-checking
     version-control

     ;; stuff I've added!
     emoji

     (scala :variables
            ;; type-at-point is too slow to use on cursor movement.
            ;; Access it explicitly with ',-h-t' instead
            scala-enable-eldoc nil
            scala-auto-insert-asterisk-in-comments t
            scala-use-unicode-arrows t
            scala-indent:step 4)

     php

     ;; tabbar
     geben      ;; remote debugging for PHP (had to clone geben layer into ~/.emacs.d/private/geben
     ;; gtags    ;; apparently enhances the PHP layer (requires GNU Global installed)
     python
     nixos
     shell-scripts

     ;; fancy eshell and stuff
     (shell :variables
            shell-default-term-shell "fish")
     java ;; on the develop branch, this uses meghanada by default
     ;; themes-megapack

     (ruby :variables
           ruby-enable-enh-ruby-mode t)

     perl5
     perl6

     yaml
     slack

     fasd
     docker

     colors
     ;; (colors :variables
     ;;         colors-enable-nyan-cat-progress-bar nil)

     ;; this looks better for terminal emacsclients
     ;; vim-powerline

     games

     github

     selectric
     html  ;; web-mode and html highlighting

     latex

     (org :variables
          org-enable-github-support t
          org-enable-org-journal-support t
          org-journal-dir "~/Documents/Time/Journal"
          org-projectile-file "TODOs.org")

     xkcd

     ;; I think something will have to be added for Google authentication for this :-()
     confluence ;; Atlassian wiki

     restclient

     spell-checking

     ;; fancier filesystem tree
     treemacs

     (sql :variables
          sql-capitalize-keywords t)

     ;; add undohist (my 'own' layer-- thanks razzius!)
     ;; https://github.com/razzius/.spacemacs.d/blob/9696f99b6d782d01aa03be6a356a181d3aab3946/layers/razziundohist/packages.el
     ;; undohist ;; TODO: make this unfuck magit, figure out some magit shit for dropping a single commit in a rebase

     ;; dactyl-mode: vim and vimperrator config highlighting
     vimscript

     ;; not yet merged. Thanks, JDormit!
     epub

     tmux ;; like tmux-navigator for vim

     c-c++
     ansible
     rust
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ag dtrt-indent ox-twbs ox-confluence magit-gerrit)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; dotspacemacs-themes '(spacemacs-dark
   ;;                       spacemacs-light)
   dotspacemacs-themes '(
                         lush
                         ;; deeper-blue
                         ;; obsidian ;; bad in terminal
                         material
                         ;; alect-black
                         ;; darkburn
                         ;; gruber-darker
                         misterioso
                         ;; ample-zen
                         ;; naquadah
                         ;; mustang
                         ;; reverse
                         ;; sanityinc-tomorrow-bright
                         ;; sanityinc-tomorrow-eighties
                         ;; sanityinc-tomorrow-blue
                         ;; spolsky
                         ;; twilight-anti-bright
                         ;; wheatgrass
                         ;; wombat
                         ;; zenburn
                         ;; zonokai-blue
                         ;; dracula ;; kinda bad in terminal
                         sanityinc-tomorrow-night ;; pretty good
                         )
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               "SauceCodePro Nerd Font"
                               :size 16
                               :weight normal
                               :width normal
                               )

   ;; if the font above is set correctly or we have fallbacks, we should see the
   ;; following display correctly
   ;;   master    

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs t))

;; Added as a workaround to https://github.com/syl20bnr/spacemacs/issues/6197
;; it requires adding (add-hook 'focus-in-hook #'reset-default-font) to
;; spacemacs/user-init as well
(defun reset-default-font ()
  (interactive)
  (unless (spacemacs/set-default-font dotspacemacs-default-font)
    (spacemacs-buffer/warning
     "Cannot find any of the specified fonts (%s)! Font settings may not be correct."
     (mapconcat 'car dotspacemacs-default-font ", ")))
  (remove-hook 'focus-in-hook #'reset-default-font))


(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))


(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; actually load magit-gerrit!
  (with-eval-after-load 'magit
    (require 'magit-gerrit))

  ;; load my font settings even with daemonized Emacs
  ;; (add-hook 'focus-in-hook #'reset-default-font)

  ;; correct the spaceline font size for daemonized Emacs
  ;; (setq default-frame-alist '((font . "Source Code Pro-14"))) ;; doesn't work


  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (mapcar '(lambda (file)
               (when (and (file-exists-p file) (not (seq-contains org-agenda-files file)))
                 (push file org-agenda-files)))
            (org-projectile-todo-files))
    (when (not (seq-contains org-agenda-files org-journal-dir))
      (push org-journal-dir org-agenda-files))
    (when (not (seq-contains org-agenda-files "~/Documents/Time/TODOs"))
      (push "~/Documents/Time/TODOs" org-agenda-files))))

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; (linum-relative-global-mode)
  ;; (linum-relative-on)

  ;; needed for my show/hide Emacs hotkey
  (require 'frame-cmds)

  ;; works, but is very slow (probably due to my fish config)
  ;; https://lists.gnu.org/archive/html/help-gnu-emacs/2015-11/msg00161.html
  (defun emacs-window-has-focus ()
    (interactive) ; interactive to test, with the line below...
    (sleep-for 3) ; ...so you have time to change the window
    (let ((focused-window-pid
           (string-to-number
            (shell-command-to-string
             "wmctrl -l -p | grep `xprop -root _NET_ACTIVE_WINDOW | cut -d x -f
2` | cut -d ' ' -f 4")
            )))
      (message (if (= (emacs-pid) focused-window-pid) "has" "not so")) ))

  ;; make spacemacs magit usable with emacs as $EDITOR
  (global-git-commit-mode t)

  ;; prettier dividers for terminal emacs
  ;; (set-face-background 'vertical-border "black")
  ;; (set-face-foreground 'vertical-border (face-background 'vertical-border))
  (defun my-change-window-divider ()
    (let ((display-table (or buffer-display-table standard-display-table)))
      (set-display-table-slot display-table 5 ?│)
      (set-window-display-table (selected-window) display-table)))

  (add-hook 'window-configuration-change-hook 'my-change-window-divider)

  ;; disabled because I'm using vim-powerline for consistency betweeen terminal
  ;; and GUI emacs (and better scaling :-\)
  ;; (spacemacs|do-after-display-system-init
  ;;  (setq powerline-default-separator 'utf-8))

  ;; global settings
  (setq dotspacemacs-mode-line-unicode-symbols t
        spaceline-org-clock-p t
        org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'"
        powerline-default-separator 'wave
        dotspacemacs-pretty-docs t
        confluence-url "https://sigfig.atlassian.net/wiki/rpc/xmlrpc"
        ensime-startup-notification nil
        ensime-startup-snapshot-notification nil

        ;; php indentation rules for work (pt. 1)
        php-mode-force-pear t

        ;; omg I need caching! helm projectile is insanely slow on the develop
        ;; branch without it
        projectile-enable-caching t
        ;; evil-emacs-state-cursor '("chartreuse3" (bar . 2))

        ;; I do not want to use Escape followed by <x> to effect M-x!
        evil-esc-delay 0

        ;; is this for truecolor support?
        system-uses-terminfo nil

        whitespace-style '(face tabs spaces trailing space-before-tab newline indentation empty space-after-tab tab-mark)

        ;; don't ask me if I want to follow symlinks when I open them
        vc-follow-symlinks t

        )

  ;; buffer-local settings -- defaults
  (setq-default

   ;; general indentation rules for me
   indent-tabs-mode nil
   tab-width 2
   c-basic-offset 2
   scala-indent:step 4

   ;; magit-gerrit configuration
   magit-gerrit-ssh-creds "pcallahan@gerrit.sigfig.com:2222"
   magit-gerrit-remote "gerrit"
   )




  ;; TODO: review which of these are necessary and which can be moved into the layer configs with :variables
  ;; php indentation rules for work (pt. 2)
  (add-hook 'php-mode-hook
            '(lambda ()
               (setq indent-tabs-mode t
                     tab-width 4
                     c-basic-offset 4)))

  ;; java indentation rules for work
  (add-hook 'java-mode-hook
            '(lambda ()
               (setq indent-tabs-mode t
                     tab-width 4
                     c-basic-offset 4)))

  ;; scala indentation rules for work
  (add-hook 'scala-mode-hook
            '(lambda ()
               (setq tab-width 4
                     c-basic-offset 4)))

  ;; hocon indentation is the same as the rules I prefer in general, so none is
  ;; needed here.

  ;; automatically remove trailing whitespace on save as is expected at work
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; enable rainbow mode by default
  (add-hook 'prog-mode-hook 'rainbow-mode)

  ;; I only ever hit this by accident
  (global-unset-key "\M-t")

  ;; project search
  (spacemacs/set-leader-keys "ps" 'helm-projectile-ag)

  ;; autodetect indentation for open files and configure Spacemacs accordingly
  ;; (add-hook 'prog-mode-hook #'(lambda ()
  ;;                               (dtrt-indent-mode)
  ;;                               (dtrt-indent-adapt)))

  (add-hook 'ruby-mode-hook #'(lambda ()
                                (modify-syntax-entry ?_ "w")))

  ;; (slack-register-team
  ;;  :name "sigfig"
  ;;  :default t
  ;;  :client-id "2403906172.208676316901"
  ;;  :client-secret "9ee8a3c3cfc52f8ed6f2170abd3e09f5"
  ;;  :token "2403906172.209402644966.0c6bbbcd8303afa2340e0eca4a7463aac5cac710058d92c81283fcc5940f9bba"
  ;;  :subscribed-channels '(general ))

  ;; use normal keybindings on Darwin (for GNU Emacs)
  ;; (osx layer appears broken, or doesn't work with GNU Emacs)
  (when (eq system-type 'darwin) ;; mac specific settings
    (setq mac-option-modifier 'alt
          mac-command-modifier 'meta

          ;; fix powerline colors on macOS
          ns-use-srgb-colorspace nil)
    (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
    )

  (defun contextual-menubar (&optional frame)
    "Display the menubar in FRAME (default: selected frame) if on a
    graphical display, but hide it if in terminal."
    (interactive)
    (set-frame-parameter frame 'menu-bar-lines
                         ;; (if (display-graphic-p frame)
                         ;;     1 0)

                         ;; actually just disable the menu bar entirely
                         0))

  ;; actually, screw the menu bar entirely
  (menu-bar-mode -1)


  (add-hook 'after-make-frame-functions 'contextual-menubar)

  ;; org-mode stuff
                                        ; define general org mode keybindings
  (spacemacs/declare-prefix "o" "Org Mode Global")
  (spacemacs/set-leader-keys "oa" 'org-agenda)
  (spacemacs/set-leader-keys "oc" 'org-capture)

                                        ; more general settings
  (setq org-ellipsis "⤵")
  (setq org-src-fontify-natively t)
  (setq org-log-done 'time)
  (setq org-timer-default-timer 30)

                                        ; Load additional org exporter
  ;; (load-library "ox-twbs")
  ;; (load-library "ox-confluence")

  ;; Enable mouse support
  ;; TODO: figure out why when I eval this manually, it does everything I want
  ;; but doesn't actually work on start-up
  ;; (unless window-system
  ;; )
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line)
  (define-key evil-normal-state-map (kbd "<mouse-4>") 'scroll-down-line)
  (define-key evil-normal-state-map (kbd "<mouse-5>") 'scroll-up-line)
  (define-key evil-insert-state-map (kbd "<mouse-4>") 'scroll-down-line)
  (define-key evil-insert-state-map (kbd "<mouse-5>") 'scroll-up-line)

  ;; force loading this on startup, since it will be loaded by the daemon before I see my desktop anyway
  (evil-magit-init)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets winum web-mode vimrc-mode treemacs-projectile toc-org sql-indent slack rspec-mode racer pyvenv pytest pip-requirements persp-mode paradox orgit org-mime org-journal org-download org-brain ob-restclient nov nix-mode mvn meghanada magithub ghub+ live-py-mode impatient-mode htmlize hl-todo highlight-numbers highlight-indentation helm-make groovy-mode google-translate git-timemachine git-link ggtags flyspell-correct-helm flyspell-correct flycheck-rust evil-surround evil-nerd-commenter evil-mc evil-matchit evil-magit evil-goggles evil-escape evil-args editorconfig dumb-jump dtrt-indent dockerfile-mode docker diff-hl counsel-projectile counsel swiper ivy company-php ac-php-core yapfify yaml-mode xterm-color xkcd xcscope ws-butler which-key websocket web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package typit treemacs-evil toml-mode tagedit tablist symon sudoku string-inflection sqlup-mode spinner spaceline-all-the-icons smeargle slim-mode shell-pop selectric-mode seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop robe restclient-helm restart-emacs rbenv rake rainbow-mode rainbow-identifiers rainbow-delimiters pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv phpunit phpcbf php-extras php-auto-yasnippets perl6-mode password-generator parent-mode pacmacs ox-gfm overseer org-projectile org-present org-pomodoro org-bullets open-junk-file ob-http oauth2 noflet nameless multi-term move-text mmm-mode minitest maven-test-mode material-theme markdown-toc magit-svn magit-gitflow magit-gh-pulls magit-gerrit macrostep lush-theme lorem-ipsum livid-mode link-hint json-navigator json-mode js2-refactor js-doc jinja2-mode insert-shebang indent-guide importmagic hungry-delete highlight-parentheses helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-nixos-options helm-mode-manager helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag groovy-imports gradle-mode google-c-style golden-ratio gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-messenger git-gutter-fringe git-gutter-fringe+ gist gh-md geben fuzzy font-lock+ flycheck-rtags flycheck-pos-tip flycheck-perl6 flycheck-bashate flx-ido fish-mode fill-column-indicator fasd fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-org evil-numbers evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-cleverparens evil-anzu eval-sexp-fu esxml eshell-z eshell-prompt-extras esh-help ensime enh-ruby-mode emojify emoji-cheat-sheet-plus emmet-mode elisp-slime-nav drupal-mode dotenv-mode docker-tramp disaster diminish define-word dactyl-mode cython-mode confluence company-web company-tern company-statistics company-shell company-rtags company-restclient company-plsense company-nixos-options company-emoji company-emacs-eclim company-c-headers company-auctex company-ansible company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-identifiers-mode clean-aindent-mode clang-format circe chruby centered-cursor-mode cargo bundler browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apiwrap ansible-doc ansible aggressive-indent ag ace-link ace-jump-helm-line ac-ispell 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
