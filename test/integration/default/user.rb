control 'AEgir user' do
  title 'should exist'

  describe user('aegir') do
    it { should exist }
    its('group') { should eq 'aegir' }
    its('home') { should eq '/var/aegir' }
    its('shell') { should eq '/bin/false' }
  end
end
