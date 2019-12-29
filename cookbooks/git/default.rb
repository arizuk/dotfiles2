package 'git'

dotfile "gitconfig"

file "#{ENV['HOME']}/.gitignore_global" do 
    owner node[:user]
end

if darwin?
    home_bin_link '/usr/local/share/git-core/contrib/diff-highlight/diff-highlight'
else
    raise NotImplementedError
end

# vimdiff dependency
include_cookbook 'vim'