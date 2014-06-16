package "libaio1" do
  action :install
end

cookbook_file node['cookbook_oracle_instantclient']['basic_zip'] do
  path File.join(Chef::Config[:file_cache_path], node['cookbook_oracle_instantclient']['basic_zip'])
  action :create_if_missing
end

cookbook_file node['cookbook_oracle_instantclient']['sdk_zip'] do
  path File.join(Chef::Config[:file_cache_path], node['cookbook_oracle_instantclient']['sdk_zip'])
  action :create_if_missing
end

directory "/usr/lib/oracle/#{node['cookbook_oracle_instantclient']['version']}/client64" do
  action :create
  recursive true
end

execute "Unzip basic into directory" do
  command "unzip -o #{File.join(Chef::Config[:file_cache_path], node['cookbook_oracle_instantclient']['basic_zip'])} -d /tmp"
end

execute "Unzip sdk into directory" do
  command "unzip -o #{File.join(Chef::Config[:file_cache_path], node['cookbook_oracle_instantclient']['sdk_zip'])} -d /tmp"
end

execute "Move the files" do
  command "mv /tmp/#{node['cookbook_oracle_instantclient']['folder_name']} /usr/lib/oracle/#{node['cookbook_oracle_instantclient']['version']}/client64/lib"
  not_if do FileTest.directory?("/usr/lib/oracle/#{node['cookbook_oracle_instantclient']['version']}/client64/lib") end
end

link "/usr/lib/oracle/#{node['cookbook_oracle_instantclient']['version']}/client64/lib/libclntsh.so" do
  to "/usr/lib/oracle/#{node['cookbook_oracle_instantclient']['version']}/client64/lib/libclntsh.so.#{node['cookbook_oracle_instantclient']['version']}"
end