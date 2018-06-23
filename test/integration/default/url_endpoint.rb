control 'The aegir frontend' do
  title 'should exist and respond'

  describe http('http://localhost') do
    its('status') { should eq 302 }
  end
  describe http('http://localhost/user/login?destination=hosting/sites') do
    its('status') { should eq 200 }
    its('body') { should match /content="Drupal 7/ }
    its('body') { should match /Login/ }
    its('body') { should match /Forgot your password/ }
  end
end
