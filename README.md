# herneri's Shell Scripts

This is my directory of scripts that I've written for command line application
with POSIX-compliant shells, specifically on Unix-like systems. There are no
PowerShell/Windows scripts since I do not use those technologies.

I wrote these for my needs, which therefore means that they are not intended and
may not be sufficient for general use. Despite that, I published these in the
event that they may be helpful for others to use or modify.

Automation and task execution for various programs like docker, the GNU
coreutils, and others can be found here.

---

## Script Organization

Scripts are organized into directories based on which commands they use.
The three categories are:

- **core**: Use the essential Unix system utilities like sha256sum, mkfs, mkdir, and others
- **distro**: Use commands that are specific to a particular Unix-like system, such as package managers or other programs
- **tool**: Use tools like git, docker, make, and others
