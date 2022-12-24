#!/bin/bash
#Author: Anurag Kumar
sudo apt-get -y update

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
					sudo tar -xvf go1.19.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
					echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi

#install GF-Pattern
echo "Installing GF-Patterns"
echo " please wait...."
go install github.com/tomnomnom/waybackurls@latest
go install github.com/tomnomnom/gf@latest
cd $HOME
mkdir .gf
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/Gf-Patterns/*.json ~/.gf
sleep 1

#install reconftw
echo "Installing ReconFTW"
echo "Please wait....." 
git clone https://github.com/six2dez/reconftw
cd reconftw/
./install.sh
cd $HOME
sleep 1
echo "Done"


#install "Subdomain Enumeration tools"
echo " Installing assetfinder,subfinder,github-subdomains, httpx"
echo "Please wait....." 
sudo apt-get install assetfinder subfinder
go install github.com/gwen001/github-subdomains@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "Done"



echo "Installing FFUF, dirsearch, gobuster"
echo "Please wait....." 
go install github.com/ffuf/ffuf@latest
sudo apt-get install dirsearch
sudo apt-get install gobuster
sleep 1
echo "Done"



#installing Wordlists
echo " Installing Wordlists"
echo "Please wait....."
mkdir wordlists
cd wordlists
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
unzip SecList.zip
rm -f SecList.zip
git clone https://github.com/orwagodfather/WordList
wget https://github.com/orwagodfather/My-Cool-WordList-For-Fuzz-and-Bugs/blob/main/fuzz.txt?raw=true
git clone https://github.com/orwagodfather/My-WordLISTs
wget https://gist.githubusercontent.com/jhaddix/f64c97d0863a78454e44c2f7119c2a6a/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt
wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt
cd
echo "Done"
sleep 1


#Installing Arjun, X8, Paramspider
echo "Installing Arjun, X8, Paramspider..."
echo"Please wait....."
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt
cd
echo
pip install arjun
git clone https://github.com/Sh1Yo/x8
cd x8
cargo build --release
sleep 1
echo "Done"


#Installing Nuclei
echo "Installing Nuclei"
echo"Please wait....."
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei -update-templates
sleep 1
echo "Done"

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up


