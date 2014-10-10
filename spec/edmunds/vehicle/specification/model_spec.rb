require 'edmunds_spec_helper'
require 'edmunds/vehicle/specification/model'

describe Edmunds::Vehicle::Specification::Model do
  include_context 'core_context'

  describe '#list_of_models(make)' do
    let(:meth) { 'list_of_models' }
    let(:args) {['bmw']}
    let(:expected_path) { '/api/vehicle/v2/bmw/models' }

    include_context 'default_spec'
    include_context 'submodel_spec'
    include_context 'category_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end

  describe '#model_details(make,model)' do
    let(:meth) { 'model_details' }
    let(:args) {['bmw', '3-series']}
    let(:expected_path) { '/api/vehicle/v2/bmw/3-series' }

    include_context 'default_spec'
    include_context 'submodel_spec'
    include_context 'category_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end

  describe '#models_count(make)' do
    let(:meth) { 'models_count' }
    let(:args) {['bmw']}
    let(:expected_path) { '/api/vehicle/v2/bmw/models/count' }

    include_context 'default_spec'
    include_context 'submodel_spec'
    include_context 'category_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end
end
