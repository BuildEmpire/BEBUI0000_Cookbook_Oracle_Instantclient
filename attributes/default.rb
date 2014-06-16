default['cookbook_oracle_instantclient']['basic_rpm'] = 'oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64.rpm'
default['cookbook_oracle_instantclient']['basic_zip'] = 'instantclient-basic-linux.x64-12.1.0.1.0.zip'
default['cookbook_oracle_instantclient']['sdk_zip'] = 'instantclient-sdk-linux.x64-12.1.0.1.0.zip'
default['cookbook_oracle_instantclient']['folder_name'] = 'instantclient_12_1'
default['cookbook_oracle_instantclient']['version'] = default['cookbook_oracle_instantclient']['basic_rpm'].split('-')[1].sub(/instantclient/, '')