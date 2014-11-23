pandocr-docker
==============

Docker image for pandocr (pandoc as a service)

Usage
-----

Server:

```sh
$ docker run -d -p 8585:8585 aldanor/pandocr
```

Client (install [pandocr](https://github.com/aldanor/pandocr) package first):

```sh
$ export PANDOC_HOST=127.0.0.1  # or whichever host the pandocr server runs on
$ export PANDOC_PORT=8585
$ pandocr -f markdown -t html -o foo.html foo.md
```
