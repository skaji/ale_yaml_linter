# ale yaml linter

This is a yaml linter for ale.

# Install

```vim
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'skaji/ale_yaml_linter'
call plug#end()

let g:ale_linters = { 'yaml': ['yaml_linter'] }
```

# Author

Shoichi Kaji

# License

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

`yaml_linter` script embeds [YAML-PP](https://metacpan.org/release/YAML-PP) distribution.
