require 'edmunds_spec_helper'
require 'edmunds/vehicle/specification/model_year'

describe Edmunds::Vehicle::Specification::ModelYear do
  include_context 'core_context'

  describe '#list_of_years(make,model)' do
    let(:meth) { 'list_of_years' }
    let(:args) {['bmw', '3-series']}
    let(:expected_path) { '/api/vehicle/v2/bmw/3-series/years' }

    include_context 'default_spec'
    include_context 'submodel_spec'
    include_context 'category_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end

  describe '#year_details(make,model,year)' do
    let(:meth) { 'year_details' }
    let(:args) {['bmw', '3-series', '1990']}
    let(:expected_path) { '/api/vehicle/v2/bmw/3-series/1990' }

    include_context 'default_spec'
    include_context 'submodel_spec'
    include_context 'category_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end

  describe '#years_count(make,model)' do
    let(:meth) { 'years_count' }
    let(:args) {['bmw', '3-series']}
    let(:expected_path) { '/api/vehicle/v2/bmw/3-series/years/count' }

    include_context 'default_spec'
    include_context 'submodel_spec'
    include_context 'category_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end
end
