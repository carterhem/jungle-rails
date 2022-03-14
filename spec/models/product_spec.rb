require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'given all 4 fields' do
      it 'should save successfully' do
      #set all fields to a value but validation field - NA here
      #test that expect error is found within the .errors.full_messages array (include?)
    end
    
    context 'if the name field is missing' do
      it 'should not save' do
        #set all fields to a value but validation field - NA here
      #test that expect error is found within the .errors.full_messages array (include?)

      end

    end
    
    context 'if the price field is missing' do
      it 'should not save' do
        #set all fields to a value but validation field - NA here
        #test that expect error is found within the .errors.full_messages array (include?)

      end

    end

    context 'if the quantity field is missing' do
      it 'should not save' do
        #set all fields to a value but validation field - NA here
      #test that expect error is found within the .errors.full_messages array (include?)

      end

    end

    context 'if the category field is missing' do
      it 'should not save' do
        #set all fields to a value but validation field - NA here
      #test that expect error is found within the .errors.full_messages array (include?)

      end

    end



  end



end
