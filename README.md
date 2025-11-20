# docker-fedora-latex

This Dockerfile sets up a TeXlive installation on basis of Fedora.

Overall, an image based on Fedora's is acually smaller than some other compared *nix distros.

Furthermore, Python tools pip and virtualenv are included for enhanced processing.

Pull from [docker hub](https://hub.docker.com/r/steinweb/fedora-latex):
```sh
docker pull steinweb/fedora-latex
```

## Building manually

```sh
docker build -t your_tag .
```
