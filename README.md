# docker-fedora-latex

This Dockerfile sets up a TeXlive installation on basis of Fedora.

Fedora's DNF package manager per default includes all required dependencies (i.e. no need to manually specify JRE for arara to work, …)

Furthermore, Python tools pip and virtualenv are included for enhanced processing.

Pull from [docker hub](https://hub.docker.com/r/steinweb/fedora-latex):
```sh
docker pull steinweb/fedora-latex
```

## Building manually

```sh
docker build -t your_tag .
```
