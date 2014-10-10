require 'edmunds_spec_helper'
require 'edmunds/vehicle/specification/engine_and_transmission'

describe Edmunds::Vehicle::Specification::EngineAndTransmission do
  include_context 'core_context'

  describe '#transmission_id(id)' do
    let(:meth) { 'transmission_id' }
    let(:args) { ['200478100'] }
    let(:expected_path) { '/api/vehicle/v2/transmissions/200478100' }

    include_context 'default_spec'
  end

  describe '#transmissions_by_style(style_id)' do
    let(:meth) { 'transmissions_by_style' }
    let(:args) { ['200477947'] }
    let(:expected_path) { '/api/vehicle/v2/styles/200477947/transmissions' }
    let(:name) { '5A'}

    include_context 'default_spec'
    include_context 'availability_spec'
    include_context 'name_spec'
  end

  describe '#engine_id(id)' do
    let(:meth) { 'engine_id' }
    let(:args) { ['200478098'] }
    let(:expected_path) { '/api/vehicle/v2/engines/200478098' }

    include_context 'default_spec'
  end

  describe '#engines_by_style(style_id)' do
    let(:meth) { 'engines_by_style' }
    let(:args) { ['200477947'] }
    let(:expected_path) { '/api/vehicle/v2/styles/200477947/engines' }
    let(:name) { 'EZH' }

    include_context 'default_spec'
    include_context 'availability_spec'
    include_context 'name_spec'
  end
end
