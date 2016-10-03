require 'spec_helper'

describe FuelSDK::DescribeError do
  let (:triggering) { FuelSDK::SoapResponse.new }
  subject { FuelSDK::DescribeError.new(triggering, 'i am an error message') }

  it { should respond_to(:response) }

  it 'has passed message as error' do
    expect(subject.message).to eq 'i am an error message'
  end

  it 'triggering response is available' do
    expect(subject.response).to eq triggering
  end

  it 'sets message on response' do
    expect(triggering.message).to be_nil
    expect(subject.message).to eq 'i am an error message'
  end

end
