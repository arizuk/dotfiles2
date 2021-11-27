node.reverse_merge!(
  os: run_command('uname').stdout.strip.downcase,
  bin_dir: "#{ENV['HOME']}/bin",
  shell_rc_file: "#{ENV['HOME']}/.zshrc.local",
  setting_dir: File.expand_path('../../../settings', __FILE__)
)

directory "#{ENV['HOME']}/bin" do
  owner node[:user]
end

define :executable_link, bin_name: nil do
  path = params[:name]
  bin_name = params[:bin_name] || File.basename(path)
  link File.join(node[:bin_dir], bin_name) do
    to path
    user node[:user]
  end
end

define :shell_rc_block do
  cmd = params[:name]
  file node[:shell_rc_file] do
    action :edit
    block do |content|
      content << "\n" + cmd unless content.include?(cmd)
    end
  end
end

define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], '.' + params[:name]) do
    to File.expand_path("../../../dotfiles/#{source}", __FILE__)
    user node[:user]
  end
end

define :github_binary, version: nil, repository: nil, archive: nil, binary_path: nil do
  cmd = params[:name]
  bin_path = "#{ENV['HOME']}/bin/#{cmd}@#{params[:version]}"
  bin_link_path = "#{ENV['HOME']}/bin/#{cmd}"
  archive = params[:archive]
  url = "https://github.com/#{params[:repository]}/releases/download/#{params[:version]}/#{archive}"

  if archive.end_with?('.zip')
    extract = 'unzip -o'
  elsif archive.end_with?('.tar.gz')
    extract = 'tar xvzf'
  else
    raise "unexpected ext archive: #{archive}"
  end

  execute "curl -fSL -o /tmp/#{archive} #{url}" do
    not_if "test -f #{bin_path}"
    user node[:user]
  end
  execute "#{extract} /tmp/#{archive}" do
    not_if "test -f #{bin_path}"
    cwd '/tmp'
    user node[:user]
  end
  execute "mv /tmp/#{params[:binary_path] || cmd} #{bin_path} && chmod +x #{bin_path}" do
    not_if "test -f #{bin_path}"
    user node[:user]
  end
  link bin_link_path do
    to bin_path
    user node[:user]
  end
end
