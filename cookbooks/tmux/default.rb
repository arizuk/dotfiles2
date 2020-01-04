package 'tmux'

dotfile 'tmux.conf'

file "#{ENV['HOME']}/.tmux.conf.local" do
  owner node[:user]
end

git "#{ENV['HOME']}/.tmux/plugins/tpm" do
  user node[:user]
  repository 'https://github.com/tmux-plugins/tpm'
end
