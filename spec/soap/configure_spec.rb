require 'spec_helper'

describe FuelSDK::Soap do

  let(:client) { FuelSDK::Client.new }
  subject {client}

  it 'has inflector support' do
    expect('Configurations'.singularize).to eq 'Configuration'
  end

  describe '#soap_configure' do
    it 'makes a soap configure request with message' do
      expect(subject).to receive(:create_action_message).with('Configurations', 'Subscriber', [], 'Do it').and_return({})
      expect(subject).to receive(:soap_request).with(:configure, {})
      subject.soap_configure 'Subscriber', [], 'Do it'
    end
  end
end
