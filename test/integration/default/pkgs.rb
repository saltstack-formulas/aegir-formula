case os[:name]
when 'debian', 'ubuntu'
  os_packages = %w(
    aegir-archive-keyring
    aegir3
    aegir3-hostmaster
    aegir3-provision
  )
end

control 'AEgir packages' do
  title 'should be installed'

  os_packages.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end

