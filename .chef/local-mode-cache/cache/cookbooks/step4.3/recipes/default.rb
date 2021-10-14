#
# Cookbook:: step4.3
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.


package "update yum" do 
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'yum'
    action:upgrade
  end
end
package "Install ntp" do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'ntp'
    action:install
  end
end
system "ntpd" do
  case node[:platform]
  when 'redhat', 'centos'
    service_name 'ntpd'
    action:start
  end
end
