
# a mob book

an opinionated journey of DEVelopment and OPerationS wading thru mud and coming out the other end; is a mob book consisting of questions and tutorials around the topics of DEVOPS methology (continous learning and improvement). the key sections consists of : docker; buildpipes; infrastructure via aws; kubernetes. you may find topics on terraform, packer, heck even ruby.

# guidelines

general writing style

- lower caps always unless absolute necessary
- simple words

# contributing

there is a make file which you can run with the following to see the available options :

```
make
```

there are no general system requirements for contributing. however if you are deploying a pdf or epub, the deployment requirements are as follows :

- pandoc
- nodejs (optional)
- semver

document output

- the final document is lives at dist/book.pdf
- the source document for PRs lives at src/book.md
- document writing follows Pandocs markdown ( https://pandoc.org/MANUAL.html and https://daringfireball.net/projects/markdown/syntax )
- font for build is FiraCode Nerd patched font (aka furacode-nerd-font https://nerdfonts.com/ ); can be installed using brew cask install font-firacode-nerd-font

# license

see LICENSE file. TLDR; CC0 (or public domain) licensed. Also vaguely applying to WTFPL ( https://en.wikipedia.org/wiki/WTFPL )
