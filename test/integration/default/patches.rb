patched_files = {
  letsencrypt_context: [
    '/var/aegir/hostmaster-7.x-3.151/profiles/hostmaster/modules/aegir/hosting_https/submodules/letsencrypt/drush/Provision/Service/Certificate/LetsEncrypt.php',
    '21faeacdc0d84c011d7d77a4730ffd6f48f49a27695de784e98640f81e654e97'
  ],
  letsencrypt_permissions: [
    '/var/aegir/hostmaster-7.x-3.151/profiles/hostmaster/modules/aegir/hosting_https/submodules/letsencrypt/drush/Provision/Service/Certificate/LetsEncrypt.php',
    '21faeacdc0d84c011d7d77a4730ffd6f48f49a27695de784e98640f81e654e97'
  ],
  provision_drupal_settings_6: [
    '/usr/share/drush/commands/provision/Provision/Config/Drupal/provision_drupal_settings_6.tpl.php',
    '5f6a45bab4d8ec97d113734fb65bd654ad2a177d23f72ecc9f6cb91ab991e9c0'
  ],
  provision_drupal_settings_7: [
    '/usr/share/drush/commands/provision/Provision/Config/Drupal/provision_drupal_settings_7.tpl.php',
    '4c5a0f2c59ba43ac49d60c1872e69824806a9aca61af33620923458a929f7082'
  ]
}

control 'Patched files' do
  title 'should have correct hashes'

  patched_files.each do |p|
    describe file(p[1]) do
      its('sha256sum') { should eq p[2] }
    end
  end
end
