require 'spec_helper'

describe FuelSDK::Targeting do

  subject { Class.new.new.extend(FuelSDK::Targeting) }

  it { should respond_to(:endpoint) }
  it { should respond_to(:endpoint=) }
  it { should respond_to(:determine_stack) }
  it { should respond_to(:get) }
  it { should respond_to(:post) }
  it { should respond_to(:patch) }
  it { should respond_to(:delete) }
  it { should respond_to(:auth_token) }

  let(:response) {
    rsp = double(FuelSDK::HTTPResponse)
    allow(rsp).to receive(:success?).and_return(true)
    allow(rsp).to receive(:[]).with('url').and_return('S#.authentication.target')
    rsp
  }

  let(:client) {
    Class.new.new.extend(FuelSDK::Targeting)
  }

  describe '#determine_stack' do
    describe 'without auth_token' do
      it 'calls refresh' do
        allow(client).to receive(:refresh) {
          client.instance_variable_set('@auth_token', 'open_sesame')
        }
        allow(client).to receive(:get)
          .with('https://www.exacttargetapis.com/platform/v1/endpoints/soap',
            {'params'=>{'access_token'=>'open_sesame'}})
          .and_return(response)
      end
    end

    describe 'with valid auth_token' do
      before :each do
        expect(client).to receive(:auth_token).twice.and_return('open_sesame')
      end

      it 'when successful returns endpoint' do
        allow(client).to receive(:get)
          .with('https://www.exacttargetapis.com/platform/v1/endpoints/soap',
            {'params'=>{'access_token'=>'open_sesame'}})
          .and_return(response)
        expect(client.send(:determine_stack)).to eq 'S#.authentication.target'
      end

      it 'raises error on unsuccessful responses' do
        allow(client).to receive(:get) {
          rsp = double(FuelSDK::HTTPResponse)
          allow(rsp).to receive(:success?).and_return(false)
          rsp
        }
        expect{ client.send(:determine_stack) }.to raise_error 'Unable to determine stack'
      end
    end
  end

  describe '#endpoint' do
    it 'calls determine_stack to find target' do
      expect(client).to receive(:determine_stack).and_return('S#.authentication.target')
      expect(client.endpoint).to eq 'S#.authentication.target'
    end
  end
end
