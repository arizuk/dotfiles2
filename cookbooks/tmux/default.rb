package 'tmux'

dotfile 'tmux.conf'

file "#{ENV['HOME']}/.tmux.conf.local" do 
    owner node[:user]
end
