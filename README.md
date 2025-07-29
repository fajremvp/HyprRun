# HyprRun

HyprRun is a minimal, terminal-based application launcher built specifically for dynamic tiling window managers like Hyprland.

![HyprRun in action](HyprRun.gif)

> Unlike other launchers (such as rofi or wofi), **HyprRun** was designed with **dynamic tiling** in mind: it never overlays windows or spawns floating pop-ups. Instead, it opens inside your terminal and closes instantly after launching the selected app — leaving your workspace clean and consistent.

## ✨ Features

  - ⚡ **Ultra-lightweight:** A single, simple Bash script.
  - 🎯 **Focused:** Uses `fzf` for fast, fuzzy-search-based navigation.
  - 🛠️ **Simple Customization:** Easily add your apps and scripts by editing one array.
  - 🍃 **Non-intrusive:** Runs inside your existing terminal and closes immediately after use.

## 📋 Requirements

  - `bash` (pre-installed on most Linux distributions)
  - `fzf` (a command-line fuzzy finder)

#### Installing fzf

You can install `fzf` using your distribution's package manager.

  - **Debian / Ubuntu:**
    ```sh
    sudo apt update && sudo apt install fzf
    ```
  - **Arch Linux:**
    ```sh
    sudo pacman -S fzf
    ```
  - **Fedora:**
    ```sh
    sudo dnf install fzf
    ```
  - **For other systems,** please refer to the [official fzf installation guide](https://junegunn.github.io/fzf/installation/).

## 🚀 Installation

Follow these 3 simple steps to install HyprRun.

#### 1\. Download the Script

Clone this repository to your machine:

```sh
git clone https://github.com/fajremvp/HyprRun.git
cd HyprRun
```

#### 2\. Make it Executable

Grant execution permissions to the script:

```sh
chmod +x hyprrun.sh
```

## ⌨️ Usage (Keybinding)

The best way to use `HyprRun` is by binding it to a keyboard shortcut. In **Hyprland**, for example, you can add the following to your `~/.config/hyprland/hyprland.conf`:

```ini
# Replace 'kitty' with your preferred terminal emulator (e.g., Alacritty, foot)
bind = $mainMod, R, exec, kitty -e hyprrun.sh
```

With this setup, pressing `Super + R` will launch HyprRun.

## ⚙️ Configuration

All configuration is done directly inside the `hyprrun.sh` file. You can add your own applications and scripts by editing the `apps` array.

```bash
apps=(
  "Firefox:firefox"
  "VSCodium:codium"
  "My Script:~/.local/bin/my-script.sh"
  "Only Office:flatpak run org.onlyoffice.desktopeditors"
  # Add your entries here in "AppName:command" format
)
```

### How to Find an Application's Command?

To add a program, you need to know which command executes it. Here are a few tips for finding those commands:

#### Standard Applications

For most programs, the command is simply the application's name in lowercase.

  - **GIMP** -\> `gimp`
  - **VLC** -\> `vlc`

If you are unsure, you can:

1.  Type the first few letters in your terminal and press the `Tab` key for autocompletion.
2.  Query your distribution's package manager (e.g., `apt search`, `pacman -Ss`).
3.  Inspect the application's `.desktop` file (usually in `/usr/share/applications`) and look for the line starting with `Exec=`.

#### Flatpak Applications

Flatpak applications are executed with a specific command structure.

1.  First, list all your installed Flatpaks to find the **Application ID**:

    ```sh
    flatpak list
    ```

2.  The output will show the name and the ID. For instance: `OnlyOffice Desktop Editors | org.onlyoffice.desktopeditors`.

3.  Use this ID to build the command in the format `flatpak run <Application-ID>`.

    **Example for the `apps` array:**

    ```bash
    "Only Office:flatpak run org.onlyoffice.desktopeditors"
    ```

#### Custom Scripts

You can run any custom script. Just make sure the script is executable (`chmod +x my-script.sh`) and use its full path in the command.

**Example for the `apps` array:**

```bash
"Check Date & Time:~/.local/bin/check_time.sh"
```

## 🤝 Contributing

This is an open-source project, and you are welcome to contribute\! Feel free to:

  - **Fork the repository:** Create your own version and modify it as you see fit.
  - **Suggest improvements:** Open an *Issue* to propose new features or report a bug.
  - **Submit Pull Requests:** If you've implemented a fix or a feature, your pull request is welcome.