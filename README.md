# github to ebub using pandoc

## Technical Overview

This project provides a containerized solution for converting GitHub repositories into EPUB documents. It processes:
- Repository README.md
- Wiki pages (if available)

### Components
- Container: Based on pandoc/latex:3.1.5.2
- Dependencies: git curl bash dos2unix
- Security: Runs as non-root user (appuser)

### Process Flow
1. Container build (`podman_build.bsh`)
   - Creates image with necessary tools
   - Sets up secure environment

2. Execution (`podman_run.bsh <GitHub_URL>`)
   - Spins up container
   - Processes repository content
   - Extracts resulting EPUB
   - Copies conversion logs
   - Cleans up container

### Output Files
- `<repo-name>.epub` - The converted document
- `<timestamp>_convert_github_to_epub.log` - Conversion log
- `<timestamp>_podman_run.log` - Container execution log
- `<timestamp>_podman_build.log` - Container build log

### Requirements
- Podman installed
- Internet access for GitHub repository cloning

## Usage Example

```bash
./podman_build.bsh
./podman_run.bsh <GitHub Repository URL> [mode]
```

The GitHub repository URL can be in either format:
- `https://github.com/user/repo` 
- `https://github.com/user/repo.git`

### Available Modes
- `all` (default) - Processes both README.md and wiki pages
- `readme` - Processes only the README.md file
- `wiki` - Processes only the wiki pages

#### Examples
```bash
# Convert both README and wiki
./podman_run.bsh https://github.com/user/repo

# Convert only README
./podman_run.bsh https://github.com/user/repo readme

# Convert only wiki
./podman_run.bsh https://github.com/user/repo wiki
```

## License

This project consists of two parts with different licenses:

### Project Code
The code in this project is licensed under "The Unlicense" - released to the public domain. See the [LICENSE](LICENSE) file for details.

### Pandoc
This project uses [Pandoc](https://pandoc.org/), which is licensed under GPL-2.0-or-later. Pandoc's licensing information:
- [Pandoc Copyright](https://github.com/jgm/pandoc/blob/main/COPYRIGHT)
- [Pandoc License](https://github.com/jgm/pandoc/blob/main/COPYING.md)

By using this project, you agree to comply with the terms of both licenses.
