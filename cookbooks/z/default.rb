git "#{ENV['HOME']}/.z.sh" do
  user node[:user]
  repository 'https://github.com/rupa/z.git'
end
