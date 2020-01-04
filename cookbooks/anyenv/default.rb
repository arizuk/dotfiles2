git "#{ENV['HOME']}/.anyenv" do
  user node[:user]
  repository 'https://github.com/anyenv/anyenv'
end

shell_rc_block 'export PATH="$HOME/.anyenv/bin:$PATH"'
shell_rc_block 'eval "$(anyenv init -)"'
