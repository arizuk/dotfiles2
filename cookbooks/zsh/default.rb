package "zsh"

git "#{ENV['HOME']}/.oh-my-zsh" do
    repository "https://github.com/ohmyzsh/ohmyzsh.git"
end

git "#{ENV['HOME']}/.zsh-completions" do
    repository "https://github.com/zsh-users/zsh-completions"
end


if darwin?
    package 'starship'
    package 'sk'
    package 'bat'
else
    raise NotImplementedError
end


dotfile "zshrc"
file "#{ENV['HOME']}/.zshrc.local" do 
    owner node[:user]
end


include_cookbook "skim"