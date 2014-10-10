require 'edmunds_spec_helper'
require 'edmunds/vehicle/specification/make'

describe Edmunds::Vehicle::Specification::Make do
  include_context 'core_context'

  describe '#list_of_makes' do
    let(:meth) { 'list_of_makes' }
    let(:expected_path) { '/api/vehicle/v2/makes' }

    include_context 'default_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end

  describe '#make_details(make)' do
    let(:meth) { 'make_details' }
    let(:args) {['bmw']}
    let(:expected_path) { '/api/vehicle/v2/bmw' }

    include_context 'default_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end

  describe '#makes_count' do
    let(:meth) { 'makes_count' }
    let(:expected_path) { '/api/vehicle/v2/makes/count' }

    include_context 'default_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end
end
