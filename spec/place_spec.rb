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
        its(:country) { should == :de }
        its(:postal_code) { should == '12053' }
        its(:state_code) { should == 'BE' }
      end

      context 'default_country' do
        subject { Place.find_by_postal_code('12053') }
        its(:country) { should == :de }

        context 'when changed' do
          before { Locus.default_country = :ch }
          after { Locus.default_country = :de }
          it { should be_nil }
          it { Place.find_by_postal_code('4243').state_code.should == 'BL' }
        end
      end
    end
  end
end
