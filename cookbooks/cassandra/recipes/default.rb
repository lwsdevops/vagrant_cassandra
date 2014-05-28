include_recipe "cassandra-apt-repo"

# update package index
execute "update-package-index" do
  command "apt-get update"
  user "root"
end.run_action(:run)

# install cassandra
apt_package "cassandra" do
  action :install
end

# start cassandra
service "cassandra" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
