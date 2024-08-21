Fully automated development environment forked and adjusted from [TechDufus](https://www.twitch.tv/TechDufus).

## Goals

Provide fully automated `Ubuntu` development environment that is easy to set up and maintain.

### Why Ansible?

Ansible replicates what we would do to set up a development environment pretty well. There are many automation solutions out there - I happen to enjoy using Ansible.

## Install

### 1 System Upgrade

Verify your `Ubuntu` installation has all latest packages installed before running the playbook. curl needs to be installed.

```bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install curl git
```

> NOTE: This will take some time.

### 2 vault.secret

The `vault.secret` file allows you to encrypt values with `Ansible vault` and store them securely in source control. Create a file located at `~/.config/dotfiles/vault.secret` with a secure password in it.

```bash
mkdir ~/.ansible-vault
vi ~/.ansible-vault/vault.secret
```

### 3 Install Dotfiles

This playbook includes a custom shell script located at `bin/dotfiles`. This script is added to your $PATH after installation and can be run multiple times while making sure any Ansible dependencies are installed and updated.

This shell script is also used to initialize your environment after installing `Ubuntu` and performing a full system upgrade as mentioned above.

> NOTE: You must follow required steps before running this command or things may become unusable until fixed.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ballmendcc/dotfiles/main/bin/dotfiles)"
```


### Update

This repository is continuously updated with new features and settings which become available to you when updating.

To update your environment run the `dotfiles` command in your shell:

```bash
dotfiles
```

This will handle the following tasks:

- Verify Ansible is up-to-date
- Generate SSH keys and add to `~/.ssh/authorized_keys`
- Clone this repository locally to `~/.dotfiles`
- Verify any `ansible-galaxy` plugins are updated
- Run this playbook with the values in `~/.config/dotfiles/group_vars/all.yaml`

This `dotfiles` command is available to you after the first use of this repo, as it adds this repo's `bin` directory to your path, allowing you to call `dotfiles` from anywhere.

Any flags or arguments you pass to the `dotfiles` command are passed as-is to the `ansible-playbook` command.

For Example: Running the tmux tag with verbosity
```bash
dotfiles -t tmux -vvv
```

### Hint
To then encrypt values with your vault password use the following:

```bash
$ ansible-vault encrypt_string --vault-password-file $HOME/.ansible-vault/vault.secret "mynewsecret" --name "MY_SECRET_VAR"
$ cat myfile.conf | ansible-vault encrypt_string --vault-password-file $HOME/.ansible-vault/vault.secret --stdin-name "myfile"
```

> NOTE: This file will automatically be detected by the playbook when running `dotfiles` command to decrypt values. Read more on Ansible Vault [here](https://docs.ansible.com/ansible/latest/user_guide/vault.html).

If you want to run only a specific role, you can specify the following bash command:
```bash
curl -fsSL https://raw.githubusercontent.com/TechDufus/dotfiles/main/bin/dotfiles | bash -s -- --tags comma,seperated,tags
```