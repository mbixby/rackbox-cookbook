#
# Cookbook Name:: rackbox
# Recipe:: static
#
# Setup static apps
#

::Chef::Recipe.send(:include, Rackbox::Helpers)

Array(node["rackbox"]["apps"]["static"]).each_with_index do |app, index|
  app_dir      = ::File.join(node["appbox"]["apps_dir"], app["appname"], 'current')
  setup_nginx_site(app, app_dir)
end

