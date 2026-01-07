# Dill

[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)
[![GitHub release](https://img.shields.io/github/release/Pickles-Linux/dill.svg)](https://GitHub.com/Pickles-Linux/dill/releases/)
[![GitHub issues](https://img.shields.io/github/issues/Pickles-Linux/dill.svg)](https://GitHub.com/Pickles-Linux/dill/issues/)

A system update utility and complete AUR Helper for Arch-based Linux distros.

## Description
Dill is an update helper for Arch based Linux Distros, designed with humor and future growth in mind. It aims to be a complete AUR Helper, eliminating the need for alternatives like Paru or yay. Dill's modular design ensures easy updates and the simple addition of extra scripts. 

Dill Is designed to be user friendly for previous Pacman/AUR users as well as be "Familiar" to apt users.


Rated R for Raunchy Aussie humor.



## Author
*   Stu Pickles - [https://github.com/Stu-Pickles3047](https://github.com/Stu-Pickles3047)
*   Pickles Linux - [https://github.com/Pickles-Linux/](https://github.com/Pickles-Linux/)

## License
This project is licensed under The Unlicense.

## Usage
Dill is the main executable, acting as a dispatcher. It parses user arguments and calls the appropriate sub-script.

```bash
dill <command> <options>
```

### Available Commands:
*   `-Syu` or `update`: Update the system.
*   `-S` or `install`: Install packages.
*   `-R` or `remove`: Remove packages.
*   `-Q` or `search`: Search for packages.

### Examples:
```bash
dill update mirrors
```
