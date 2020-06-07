# xubuntuDesktopConfig

Just an ansible version of the setup.
Mostly doing this for pratice

## instructions

1. Create a directory
2. Clone the repo
3. Install ansible
4. Run the site all yaml

Single command test
```
mkdir -p zzz/xubuntuDesktopConfig && cd zzz/xubuntuDesktopConfig && sudo apt update && sudo apt-get remove --purge libreoffice* && sudo apt -y upgrade && sudo apt autoclean && sudo apt autoremove && sudo apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git ansible-playbook -v --ask-become-pass prod/initialSetup/site-all.yaml
```