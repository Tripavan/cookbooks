#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.


package "Install Apache" do 
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
  action:install
end

file "/var/www/html/index.html" do
  content "<html>
  <h1>Hai!!! welcome to web page</h1>
  <html>"
end

service "start apache" do
  case node[:platform] 
  when 'redhat', 'centos'
    service_name 'httpd'
  when 'ubuntu', 'debian'
    service_name 'apache2'
  end
  action:start
end
