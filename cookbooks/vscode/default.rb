if darwin?
  cli_bin = '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'
  vscode_setting_dir = "#{ENV['HOME']}/Library/Application Support/Code/User/"
else
  raise NotImplementedError
end

setting_dir = File.join(node[:setting_dir], 'vscode')

# Create a link to code command
executable_link cli_bin

link "#{vscode_setting_dir}/keybindings.json" do
  to File.join(setting_dir, 'Code', 'User', "keybindings.#{node[:os]}.json")
  user node[:user]
end

link "#{vscode_setting_dir}/settings.json" do
  to File.join(setting_dir, 'Code', 'User', 'settings.json')
  user node[:user]
end
