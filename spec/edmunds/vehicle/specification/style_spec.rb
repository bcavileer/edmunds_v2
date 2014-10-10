require 'edmunds_spec_helper'
require 'edmunds/vehicle/specification/style'

describe Edmunds::Vehicle::Specification::Style do
  include_context 'core_context'

  describe '#by_id(id)' do
    let(:meth) { 'by_id' }
    let(:args) {['101353967']}
    let(:expected_path) { '/api/vehicle/v2/styles/101353967' }

    include_context 'default_spec'
    include_context 'view_spec'
  end

  describe '#by_make_model_year(make,model,year)' do
    let(:meth) { 'by_make_model_year' }
    let(:args) {['bmw', '3-series', '1990']}
    let(:expected_path) { '/api/vehicle/v2/bmw/3-series/1990/styles' }

    include_context 'default_spec'
    include_context 'submodel_spec'
    include_context 'category_spec'
    include_context 'state_spec'
    include_context 'view_spec'
    include_context 'year_spec'
  end

  describe '#chrome(chrome_id)' do
    let(:meth) { 'chrome' }
    let(:args) {['11916']}
    let(:expected_path) { '/api/vehicle/v2/partners/chrome/styles/11916' }

    include_context 'default_spec'
  end

  describe '#count' do
    let(:meth) { 'count' }
    let(:expected_path) { '/api/vehicle/v2/styles/count' }

    include_context 'default_spec'
    include_context 'state_spec'
  end

  describe '#count_by_make(make)' do
    let(:meth) { 'count_by_make' }
    let(:args) { ['bmw'] }
    let(:expected_path) { '/api/vehicle/v2/bmw/styles/count' }

    include_context 'default_spec'
    include_context 'state_spec'
  end

  describe '#count_by_make_model(make,model)' do
    let(:meth) { 'count_by_make_model' }
    let(:args) { ['bmw', '3-series'] }
    let(:expected_path) { '/api/vehicle/v2/bmw/3-series/styles/count' }

    include_context 'default_spec'
    include_context 'state_spec'
  end

  describe '#count_by_make_model_year(make,model,year)' do
    let(:meth) { 'count_by_make_model_year' }
    let(:args) { ['bmw', '3-series', '1990'] }
    let(:expected_path) { '/api/vehicle/v2/bmw/3-series/1990/styles/count' }

    include_context 'default_spec'
    include_context 'state_spec'
  end
end
