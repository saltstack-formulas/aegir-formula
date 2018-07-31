# Taken from http://docs.aegirproject.org/en/3.x/install/#manual-installation, checkpoint 6
git_downloaded_modules = %w( 
  hosting_external
  hosting_apache_https
  hosting_certificate
  hosting_clone
  hosting_http_basic_auth
  hosting_https
)

control 'Git-downloaded modules' do
  title 'should be installed and enabled'

  git_downloaded_modules.each do |m|
    describe command("sudo su - aegir -s /bin/bash -c 'drush @hostmaster pm-info --fields=status #{m}'") do
      its('stdout') { should match /Status   :  enabled/ }
    end
  end

  describe file('/var/aegir/.drush/provision_extra_sync/README.md') do
    it { should exist }
    it { should be_file }
  end
end
