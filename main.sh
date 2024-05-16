
function main {
    prepare_directories
    prepare_install_packages
    install_packages
    install_pip
    get_gits
    prepare_emacs
    print_end

}

function prepare_directories {
    mkdir ~/kaliprep-main
    mkdir ~/kaliprep-main/git
    mkdir ~/kaliprep-main/binaries
    mkdir ~/TOOLS

}

function prepare_install_packages {
    dpkg --add-architecture i386
    apt-get update
}

function install_packages {
    apt -y install \
	xclip \
	kali-linux-everything \
	strongswan \
	libreoffice \
	mingw-w64 \
	shellter \
	peass \
	wine32:i386 \
	mongo-tools \
	flameshot \
	python3-wsgidav \
	sshuttle \
	emacs
}

function install_pip {
    pip3 install ldapdomaindump
    
}

function get_gits {
    cd ~/kaliprep-main/git/
    git clone https://github.com/Neohapsis/creddump7.git
    git clone https://github.com/haseebT/mRemoteNG-Decrypt.git
    git clone https://github.com/jeroennijhof/vncpwd.git
    git clone https://github.com/The-Z-Labs/linux-exploit-suggester.git
    git clone https://github.com/SecuProject/ADenum.git
    cd -
}

function prepare_emacs {
    cd ~/kaliprep-main/git/
    git clone https://github.com/jojojames/dired-sidebar
    git clone https://github.com/Fuco1/dired-hacks

    cat <<EOF >>~/.emacs
(require 'org)
(require 'package)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "STUCK(s)" "WIP(w)" "|" "ABANDONED(a)" "DONE(d)")))

(setq org-todo-keyword-faces
  '(("NEXT" :foreground "#B26818" :weight bold)
    ("STUCK"     :foreground "#B26818" :weight bold)
    ("WIP"     :foreground "#B26818" :weight bold)
    ("DONE"     :foreground "#3F9E1D" :weight bold)
    ("ABANDONED"     :foreground "#7A7A7A" :weight bold)
    ("TODO"     :foreground "#FF0000" :weight bold)))

;;keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)

;;scroll window up/down by one line
(global-set-key (kbd "M-<down>") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-<up>") (kbd "C-u 1 M-v"))

;; switch between two latest buffers
(global-set-key (kbd "M-o")  'mode-line-other-buffer)

;; hook pro highlightovani XXX tak jako je ve vim-u
(add-hook 'find-file-hook 'highlight-xxx)
(defun highlight-xxx ()
  (highlight-regexp "XXX" 'hi-yellow))

(add-to-list 'load-path "/home/kali/kaliprep-main/git/dired-sidebar/")
(add-to-list 'load-path "/home/kali/kaliprep-main/git/dired-hacks")
(require 'dired-sidebar)
EOF
    cd -
}

function print_end {
    echo "[+] set flameshot as screenshoting tool"
    echo "[+] change hotkeys in terminal to ctrl+tab and ctrl+shift+tab for tab movement"
    echo "[+] sudo neo4j start; then open localhost:7474 and set it up"
    echo "[+] set up pyenv with https://www.kali.org/docs/general-use/using-eol-python-versions/"

    echo "[-] emacs - M-x dired-sidebar-show"
}


