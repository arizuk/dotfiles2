execute "Install rustup" do
  command "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
  not_if "test -f #{ENV['HOME']}/.cargo/bin/rustup"
  user node[:user]
end

define :cargo_install, bin_name: nil do
  bin_name = params[:bin_name] || params[:name]
  execute "Cargo install #{params[:name]}" do
    command "#{ENV['HOME']}/.cargo/bin/cargo install #{params[:name]}"
    not_if "test -f #{ENV['HOME']}/.cargo/bin/#{bin_name}"
    user node[:user]
  end
end