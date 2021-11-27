package 'zsh'

# Install dependent binaries
if darwin?
  package 'starship'
  package 'sk'
  package 'bat'
else
  include_cookbook 'rustup'
  cargo_install :starship
  cargo_install :skim do
    bin_name 'sk'
  end
  package 'bat'
  executable_link '/usr/bin/batcat' do
    bin_name 'bat'
  end
end

git "#{ENV['HOME']}/.oh-my-zsh" do
  user node[:user]
  repository 'https://github.com/ohmyzsh/ohmyzsh.git'
end

git "#{ENV['HOME']}/.zsh-completions" do
  user node[:user]
  repository 'https://github.com/zsh-users/zsh-completions'
end


remote_file "#{node[:bin_dir]}/preview.sh" do
  owner node[:user]
  mode '755'
  source 'files/preview.sh'
end

dotfile 'zshrc'
dotfile 'zshrc.d'

file "#{ENV['HOME']}/.zshrc.local" do
  owner node[:user]
end
