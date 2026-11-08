# mac-setup

Reproducible macOS development environment.

### Prerequisite: Xcode Command Line Tools

On a fresh macOS installation:
xcode-select --install

### Keyboard

- Open System Settings → Keyboard → Text Input → Edit.
- Add Russian (standard layout).
- Keep ABC as the English input source.

### 1Password

1. Sign in to the 1Password desktop app.
2. Open **Settings → Browser**.
3. Install the browser extension in Zen using the link from 1Password.
4. Select **Add Browser** and authorize Zen.
5. Verify browser autofill.
6. Open **Settings → Developer → SSH Agent** and enable the agent.
7. Verify SSH access:
   ssh -T git@github.com

Expected: `Hi tentharmy! You've successfully authenticated...`

On first connection, verify GitHub's official SSH host fingerprint before accepting it.


### GitHub CLI

Run `gh auth login`.

Select:
- **GitHub.com**
- **Login with a web browser**
- **SSH** as the Git protocol
- **Generate a new SSH key → No**

Complete authentication in the browser.

Verify with `gh auth status`.

Expected account: `tentharmy`.

**Note:** SSH keys are managed by 1Password SSH Agent. Do not generate additional keys through GitHub CLI.
