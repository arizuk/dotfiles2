package 'bat'

unless darwin?
  executable_link '/usr/bin/batcat' do
    bin_name 'bat'
  end
end