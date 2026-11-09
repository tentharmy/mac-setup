# mac-setup

Reproducible macOS development setup for Apple silicon.

## Bootstrap

On a fresh Mac, run `xcode-select --install` and wait for the Command Line Tools to finish installing. Then run:

```sh
mkdir -p ~/Dev
git clone https://github.com/tentharmy/mac-setup.git ~/Dev/mac-setup
cd ~/Dev/mac-setup
./bootstrap.sh
```

Bootstrap installs the Brewfile packages, symlinks the dotfiles, and applies macOS preferences. If it stops at an existing dotfile, review and back up or merge that file before rerunning. Keep the checkout in place because the symlinks point into it.

> The initial HTTPS clone needs no credentials. Bootstrap switches `origin` to SSH, so enable the 1Password SSH Agent before pushing.

## Manual setup

### Keyboard

In **System Settings → Keyboard → Text Input → Edit**, keep **ABC** and add **Russian** (standard layout).

### 1Password in Zen

1. In the 1Password desktop app, open **Settings → Browser** and use the extension link to install 1Password in Zen.
2. In the same pane, select **Add Browser** and choose Zen from **Applications** to connect the extension to the desktop app.

[1Password trusted browser setup](https://support.1password.com/additional-browsers/)

### 1Password AutoFill

1. Open **1Password → Settings → AutoFill** and enable macOS AutoFill.
2. In **System Settings → General → AutoFill & Passwords**, select 1Password as the password provider.
3. In **System Settings → Privacy & Security → Device Control and Data Access**, grant 1Password the required permission for Universal AutoFill.
4. Verify AutoFill in a native macOS application.

### FileVault

1. Enable FileVault in **System Settings → Privacy & Security → FileVault**.
2. Save the **FileVault Recovery Key** as a secure item in 1Password.
3. Verify the recovery key is accessible from another device before relying on it.

**Important:** Never store the recovery key in the `mac-setup` repository.

### SSH and GitHub CLI

In 1Password, enable **Settings → Developer → SSH Agent**, then test with `ssh -T git@github.com`. On first connection, compare the prompt with [GitHub’s SSH host fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints) before accepting it.

In `gh auth login`, choose **SSH** as the Git protocol and answer **No** if asked to generate a new SSH key. Git uses the key managed by 1Password.
