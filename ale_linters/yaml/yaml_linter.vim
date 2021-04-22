function! ale_linters#yaml#yaml_linter#GetMatches(lines) abort
  let l:pattern = '\v^([a-zA-Z]?:?[^:]+):(\d+):?(\d+)?:? (.+)$'
  return ale#util#GetMatches(a:lines, l:pattern)
endfunction

function! ale_linters#yaml#yaml_linter#Handler(buffer, lines) abort
  let l:dir = expand('#' . a:buffer . ':p:h')
  let l:output = []

  for l:match in ale_linters#yaml#yaml_linter#GetMatches(a:lines)
    call add(l:output, {
    \   'filename': ale#path#GetAbsPath(l:dir, l:match[1]),
    \   'lnum': l:match[2] + 0,
    \   'col': l:match[3] + 0,
    \   'text': l:match[4],
    \   'type': 'E',
    \})
  endfor
  return l:output
endfunction

call ale#linter#Define('yaml', {
\   'name': 'yaml_linter',
\   'executable': '/usr/bin/perl',
\   'output_stream': 'both',
\   'command': '/usr/bin/perl ' . g:plug_home . '/ale_yaml_linter/yaml_linter %t',
\   'callback': 'ale_linters#yaml#yaml_linter#Handler',
\})
