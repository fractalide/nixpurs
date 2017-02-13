Usage
---

building:
``` bash
$ cabal2nix --shell . >shell.nix
$ nix-build shell.nix
```

```bash
$ PACKAGES_URL=https://raw.githubusercontent.com/purescript/package-sets/master/packages.json
$ curl $PACKAGES_URL | ./result/bin/purescript-packages2nix-exe > purescript-packages.nix
```
