# xubuntuDesktopConfig

Just an ansible version of the setup.
Mostly doing this for pratice

## instructions

1. Create a directory
2. Clone the repo
3. Install ansible
4. Run the site all yaml

***MODIFY GIT_NAME AND GIT_EMAIL for your username and email***
Remove some packages that I don't use to speed some things up.
You need apt-get for remove.

```
mkdir -p zzz/xubuntuDesktopConfig && cd zzz/xubuntuDesktopConfig && sudo apt update && sudo apt-get -y remove --purge libreoffice* thunderbird && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --ask-become-pass prod/initialSetup/site-all.yaml
```

If you wnat to run a specific playbook, just modify site.yaml and change it to the playbook you want to run.
```
ansible-playbook -v --ask-become-pass prod/initialSetup/site.yaml
```