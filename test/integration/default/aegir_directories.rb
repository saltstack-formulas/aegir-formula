# Taken from http://docs.aegirproject.org/en/3.x/install/#manual-installation, checkpoint 6
current_aegir_version = '7.x-3.151'

dirs = [
  "/var/aegir/hostmaster-#{current_aegir_version}/",
  "/var/aegir/hostmaster-#{current_aegir_version}/profiles/hostmaster/",
  "/var/aegir/hostmaster-#{current_aegir_version}/profiles/hostmaster/modules/contrib/admin_menu/",
  "/var/aegir/hostmaster-#{current_aegir_version}/profiles/hostmaster/modules/contrib/views/",
  "/var/aegir/hostmaster-#{current_aegir_version}/profiles/hostmaster/modules/aegir/hosting/",
  "/var/aegir/hostmaster-#{current_aegir_version}/profiles/hostmaster/modules/aegir/hosting_git/",
  "/var/aegir/hostmaster-#{current_aegir_version}/profiles/hostmaster/themes/aegir/",
  "/var/aegir/hostmaster-#{current_aegir_version}/sites/localhost/",
  "/var/aegir/config/server_master/apache.conf",
  "/var/aegir/config/server_master/apache/vhost.d/",
  "/var/aegir/config/server_master/apache/platform.d/",
  "/var/aegir/backups/",
  "/var/aegir/.drush/"
]

control 'Installation directories' do
  title 'should exist and have proper ownership'

  dirs.each do |d|
    describe directory(d) do
      its('owner') { should cmp 'aegir' }
      its('group') { should cmp 'aegir' }
    end
  end
end
