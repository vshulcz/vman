# vman

`vman` is a utility for managing Python virtual environments. It allows you to create and activate virtual environments in a specified directory easily.

## Features

- Create and activate a virtual environment with a default or custom name.
- Automatically add the virtual environment directory to `.gitignore`.
- Easily activate the virtual environment in your current shell session.

## Installation

To install `vman` globally, clone this repository and run the installation script:

```bash
git clone https://github.com/vshulcz/vman.git
cd vman
sudo ./install.sh
```

## Usage
Create and activate a virtual environment with the default name
```bash
vman
```

Create and activate a virtual environment with a custom name
```bash
vman -n my_custom_venv
```

Create and activate a virtual environment without modifying .gitignore
```bash
vman -g
```

Update (recreate) a virtual environment
```bash
vman -u
```

Remove a virtual environment
```bash
vman -r
```

Deactivate the currently activated virtual environment
```bash
vman -d
```

## Example of usage
```bash
$ vman -n myenv
Virtual environment 'myenv' not found. Creating a new one...
Virtual environment 'myenv' created.
Created .gitignore and added 'myenv/'.
Virtual environment 'myenv' activated.
```

```bash
$ vman
Virtual environment 'venv' already exists. Activating...
Virtual environment 'venv' activated.
```

## License
This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## Issues
If you encounter any issues, please open an issue on GitHub.