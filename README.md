# Node.js DevContainer Template

This project is a DevContainer template for Node.js development environments.
You can easily build a consistent development environment using VS Code DevContainers.

## 🚀 Features

- **Node.js 22.16.0 LTS** - Latest stable version of Node.js
- **VS Code DevContainers** - Consistent development environment
- **Zsh shell environment** - Automatic installation and configuration of zsh-related tools via dotfiles
- **Dotfiles support** - Automatic installation and configuration of custom dotfiles

## 📋 Prerequisites

- [Docker](https://www.docker.com/) must be installed
- [VS Code](https://code.visualstudio.com/) must be installed
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) must be installed

## 🛠️ Setup

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd devcontainer_templete_node
   ```

2. Open the project in VS Code:
   ```bash
   code .
   ```

3. When VS Code suggests using DevContainer, click "Reopen in Container".

4. Alternatively, open the command palette (`Cmd+Shift+P` / `Ctrl+Shift+P`) and select "Dev Containers: Reopen in Container".

## 🔧 Dotfiles Configuration

This DevContainer supports automatic installation and configuration of custom dotfiles.
**It is designed with the assumption that zsh-related tools will be installed via dotfiles and the terminal will use zsh.**

### How to Configure Dotfiles

Specify the dotfiles repository in VS Code settings (.vscode/setting.json)

```json
{
    // dotfiles
    "dotfiles.repository": "https://github.com/[username]/dotfiles.git", // NOTE: Set this to your dotfiles repository URL
    "dotfiles.targetPath": "~/dotfiles", // ex: ~/dotfiles
    "dotfiles.installCommand": "install.sh" // ex: install.sh
}
```

### Dotfiles Behavior

1. **Automatic Installation**: Dotfiles are automatically installed when the container starts
2. **Zsh Environment Setup**: Zsh-related tools are configured via dotfiles
3. **Completion Wait**: `postStartCommand.sh` waits for dotfiles installation to complete
4. **Zsh Switch**: After installation is complete, it automatically switches to Zsh shell (may take a few seconds on first container startup)

### Important Notes

- **This DevContainer is designed with zsh as a prerequisite**
- Zsh-related tools are installed via dotfiles, and the terminal uses zsh
- The terminal will not automatically switch to Zsh until dotfiles installation is complete
- It waits until the `~/.dotfiles-installed` file is created
- Even if you don't use custom dotfiles, you can start development with the default terminal environment

## 📄 License

This project is published under the MIT License. 