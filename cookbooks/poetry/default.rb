execute 'Install poetry' do
  user node[:user]
  command 'curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python'
  not_if 'test -e ~/.poetry'
end

shell_rc_block 'export PATH=~/.poetry/bin:$PATH'

execute 'Enable poetry command completion' do
  user node[:user]
  command '~/.poetry/bin/poetry completions zsh > ~/.zfunc/_poetry'
end