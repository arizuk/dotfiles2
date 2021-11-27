unless darwin?
  raise NotImplementedError
end

execute 'Install Homebrew' do
  user node[:user]
  command 'yes "" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  not_if 'test $(which /usr/local/bin/brew)'
end

define :homebrew_cask do
  name = params[:name]
  execute "brew install --cask #{name}" do
    not_if "brew list --cask #{name}"
  end
end