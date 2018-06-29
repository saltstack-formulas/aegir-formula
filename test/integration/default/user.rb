control 'AEgir user' do
  title 'should exist'

  describe user('aegir') do
    it { should exist }
    its('groups') { should eq [ 'aegir', 'www-data'] }
    its('home') { should eq '/var/aegir' }
    its('shell') { should eq '/bin/false' }
  end

  describe file('/var/aegir') do
    its('type') { should cmp 'directory' }
    its('mode') { should cmp '0755' }
  end
end
