# pandoc-mermaid container

Container to generate pdf from markdown document with embedded mermaid diagrams.

The markdown file plus supporting files and filters must be provided to the container 
via a mounted volume. Mermaid uses headless chrome and hence must be run as non-root
user. This is achieved by using docker run options '-u' with your userid and granting
SYS_ADMIN privilege.  The generated file is written to the mounted volume.

Example run to convert a markdown and supporting files into a PDF via docker run:

```
$ docker run -ti --rm -u `id -u $USER` --cap-add=SYS_ADMIN -v $PWD:/u pandoc \
  pandoc --pdf-engine=xelatex \
  --filter=pandoc_jnpr_filter.py \
  --template=Jnpr_a4.latex README.md \
  -o Telco_Cloud_Monitoring_Blueprint.pdf

$ ls -l Telco_Cloud_Monitoring_Blueprint.pdf
$ rm -rf mermaid-images
```

