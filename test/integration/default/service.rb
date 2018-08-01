control 'AEgir services' do
  title 'should be runnning'

  describe service('hosting-queued') do
      it { should be_running }
      it { should be_enabled }
  end
end

