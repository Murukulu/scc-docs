# SCC Documentation

Home of design docs for the [SCC Compiler](https://github.com/Murukulu/scc-compiler).

## Contributing

### Configuring Dev Environment

#### Using Nix

```shell
nix develop
```

You might encounter issues if you're not using zsh. Edit the shell hook in the `flake.nix` to call `exec $SHELL` instead of the zsh-specific stuff in there now. You will lose aliases, syntax highlighting, etc. If you fix it, make a PR.

#### Not using Nix

Set up a Python [venv](https://docs.python.org/3/library/venv.html) and `pip install mkdocs`.

### Adding Docs

Run `mkdocs serve` to serve docs on localhost in browser.

Add markdown files to sensible places in `docs/`. If adding a major section, consider [updating the nav bar](https://squidfunk.github.io/mkdocs-material/setup/setting-up-navigation/).
