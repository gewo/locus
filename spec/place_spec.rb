# coding: utf-8
require 'spec_helper'

module Locus
  describe Place do
    describe '#find_by_postal_code' do
      it 'returns nil when postal_code does not exist' do
        Place.find_by_postal_code('12345', :de).should be_nil
      end

      it 'returns nil when given an invalid country' do
        Place.find_by_postal_code('12345', :wunderland).should be_nil
      end

      context 'given valid input' do
        subject { Place.find_by_postal_code('12053', :de) }
        it { should be_a Place }

        it 'country eq :de' do
          expect(subject.country).to eq :de
        end

        it 'postal_code eq "12053"' do
          expect(subject.postal_code).to eq '12053'
        end

        it 'state_code eq "BE"' do
          expect(subject.state_code).to eq 'BE'
        end
      end

      context 'default_country' do
        subject { Place.find_by_postal_code('12053') }

        it 'country eq :de' do
          expect(subject.country).to eq :de
        end

        context 'when changed' do
          before { Locus.default_country = :ch }
          after { Locus.default_country = :de }
          it { should be_nil }
          it { expect(Place.find_by_postal_code('4243').state_code).to eq 'BL' }
        end
      end
    end
  end
end
