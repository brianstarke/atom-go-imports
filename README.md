# go-imports package

# NOTE!
In the latest builds of Atom, this no longer works so I've unpublished it until such time that I can fix it.  I highly recommend the excellent [go-plus](https://atom.io/packages/go-plus) package as a replacement.

Runs [goimports](http://godoc.org/code.google.com/p/go.tools/cmd/goimports) on file save.

![A screenshot of your spankin' package](http://cl.ly/image/2p0m432d280M/out.gif)

`goimports` also executes `go fmt`, so you don't need to do both.

You must have `goimports` already installed for this to work.

```
$ go get code.google.com/p/go.tools/cmd/goimports
```

See [goimports](http://godoc.org/code.google.com/p/go.tools/cmd/goimports) for more information.

### NOTE

You may have to set the full path to **goimports** in the settings.

```
$ which goimports
/Users/brianstarke/go/bin/goimports
```

Definite hat tip to **lsegal**'s [atom-go-format](https://github.com/lsegal/atom-go-format) for inspiration, I used his project as a jumping off point.
