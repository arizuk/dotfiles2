setting_dir = File.join(node[:setting_dir], 'karabiner')


if darwin?

    remote_file "#{ENV['HOME']}/.config/karabiner/karabiner.json" do
        owner node[:user]
        mode "600"
        source File.join(setting_dir, 'karabiner.json')
    end

    remote_directory "#{ENV['HOME']}/.config/karabiner/assets" do
        owner node[:user]
        mode "700"
        # XXX: remote_directory do not accept absolute path specification.
        # source File.join(setting_dir, 'assets')
        source File.join('../../settings/karabiner', 'assets')
    end
else
    raise NotImplementedError 
end

