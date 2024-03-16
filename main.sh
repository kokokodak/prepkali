


function prepare_directories {
    mkdir ~/kaliprep-main
    mkdir ~/kaliprep-main/git
    mkdir ~/kaliprep-main/

}


function prepare_install_packages {
    dpkg --add-architecture i386
    apt-get update
}

function install_packages {
    apt -y install \
	strongswan \
	libreoffice \
	mingw-w64 \
	shellter \
	peass \
	wine32:i386 \
	mongo-tools \
	flameshot \
	python3-wsgidav

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

}

