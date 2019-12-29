package "zsh"

git "#{ENV['HOME']}/.repos/oh-my-zsh" do
    repository "https://github.com/ohmyzsh/ohmyzsh.git"
end

git "#{ENV['HOME']}/.repos/zsh-completions" do
    repository "https://github.com/zsh-users/zsh-completions"
end

if darwin?
    package 'starship'
else
    raise NotImplementedError
end


dotfile "zshrc"

include_cookbook "skim"