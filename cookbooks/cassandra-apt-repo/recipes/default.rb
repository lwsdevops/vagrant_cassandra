# add keys to access cassandra repo
execute "add cassandra repo key 1" do
  command "gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D; gpg --export --armor F758CE318D77295D | sudo apt-key add -"
  action :nothing
  user "root"
end.run_action(:run)
execute "add cassandra repo key 2" do
  command "gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00; gpg --export --armor 2B5C1B00 | sudo apt-key add -"
  action :nothing
  user "root"
end.run_action(:run)

# adds cassandra repo
cookbook_file "/etc/apt/sources.list.d/cassandra.list" do
  source "cassandra.list"
  owner "root"
  group "root"
  mode 0755
  notifies :run, "execute[update-package-index]", :immediately
end

