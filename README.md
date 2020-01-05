# pandoc-mermaid container

Container to generate pdf from markdown document with embedded mermaid diagrams.

The markdown file plus supporting files and filters must be provided to the container 
via a mounted volume. Mermaid uses headless chrome and hence must be run as non-root
user. This is achieved by using docker run options '-u' with your userid and granting
SYS_ADMIN privilege.  The generated file is written to the mounted volume.

Example run to convert a markdown and supporting files into a PDF via docker run:

```
$ docker run -ti --rm -u `id -u $USER` --cap-add=SYS_ADMIN -v $PWD:/u \
  marcelwiget/pandoc-mermaid \
  pandoc --pdf-engine=xelatex \
  --filter=pandoc_filter.py \
  EXAMPLE.md -o example.pdf
Unable to find image 'marcelwiget/pandoc-mermaid:latest' locally
latest: Pulling from marcelwiget/pandoc-mermaid
2746a4a261c9: Pull complete 
4c1d20cdee96: Pull complete 
0d3160e1d0de: Pull complete 
c8e37668deea: Pull complete 
da53c72146f0: Pull complete 
deee032a7485: Pull complete 
58f03f4eaca8: Pull complete 
6d5fe3e4784e: Pull complete 
2df2b2dbbc2a: Pull complete 
b660cbaefe06: Pull complete 
Digest: sha256:d5bcdf339636c9221682d16d42896429557ee5927001ee423353ae90fe778f23
Status: Downloaded newer image for marcelwiget/pandoc-mermaid:latest
Created directory mermaid-images
Created image mermaid-images/b6c0cfb045b80697bae20eef546e4268ab092b60.png
Doc Format  latex

$ ls 
Dockerfile  EXAMPLE.md  example.pdf  LICENSE  mermaid-images  pandoc_filter.py  README.md
```

Generated [example.pdf](example.pdf) file. 

The folder mermaid-images contains the extracted mermaid
markdown code and the generated images. This folder can be deleted after each run.

```
$ ls mermaid-images/
b6c0cfb045b80697bae20eef546e4268ab092b60.mmd  b6c0cfb045b80697bae20eef546e4268ab092b60.png
```
