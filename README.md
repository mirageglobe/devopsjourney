
![GitHub](https://img.shields.io/github/license/mirageglobe/devopsjourney.svg)

# a mob book

![heroimage](https://github.com/mirageglobe/devopsjourney/blob/master/heroimage.png)

DevOps Journey : DevHackThorsDay - is an opinionated journey of DEVelopment and OPerationS helping you learn, wade thru mud and coming out the other end; this mob book consists of questions and tutorials around the topics of DEVOPS methology (continous learning and improvement). There are no answers, however solutions are posted throughout github and linked from the sections in this book.

The key sections that this mob book focuses on are : docker; buildpipes; infrastructure via aws; kubernetes. you may find topics on terraform, packer, heck even ruby.

you can freely download and distribute this book according to the licence terms here :

- pdf version : https://github.com/mirageglobe/devopsjourney/blob/master/dist/book.pdf
- epub version : https://github.com/mirageglobe/devopsjourney/blob/master/dist/book.epub

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

generating documents

- the final document is lives at dist/book.pdf
- the source document for PRs lives at src/book.md
- document writing follows Pandocs markdown ( https://pandoc.org/MANUAL.html and https://daringfireball.net/projects/markdown/syntax )
- font for build is FiraCode Nerd patched font (aka furacode-nerd-font https://nerdfonts.com/ ); can be installed using brew cask install font-firacode-nerd-font
- need latex (pandoc depends on it); fastest way is using brew cask install basictex; and next point...
- update latex package manager; sudo tlmgr update --all; sudo tlmgr install collection-fontsrecommended; sudo tlmgr install lualatex-math; sudo tlmgr install fontspec; which will install minimal requirements to build the project


# license

see LICENSE file. TLDR; CC licensed. Also currently considering of applying to WTFPL (https://en.wikipedia.org/wiki/WTFPL)
