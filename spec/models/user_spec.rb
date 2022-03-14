require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'given all 5 validation fields' do
      it 'should save successfully' do
       @user = User.new(first_name: "Joe", last_name: "Dirt", email:"joe@dirt.com", password: "dirtisking", password_confirmation: "dirtisking")
        expect(@user.first_name).to be_present
        expect(@user.last_name).to be_present
        expect(@user.email).to be_present
        expect(@user.password).to be_present
        expect(@user.password_confirmation).to be_present
        expect(@user.password).to match(@user.password_confirmation)
        @user.save 
        expect(@user.errors.full_messages).to eql([])
      end
    end

    context 'if the first_name field is missing' do
      it 'should not save' do
        @user = User.new(last_name: "Dirt", email:"joe@dirt.com", password: "dirtisking", password_confirmation: "dirtisking")
        @user.save 
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end

    context 'if the last_name field is missing' do
      it 'should not save' do
        @user = User.new(first_name: "Joe", email:"joe@dirt.com", password: "dirtisking", password_confirmation: "dirtisking")
        @user.save 
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    context 'if the email field is missing' do
      it 'should not save' do
        @user = User.new(first_name: "Joe", last_name: "Dirt", password: "dirtisking", password_confirmation: "dirtisking")
        @user.save 
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context 'if the password field is missing' do
      it 'should not save' do
        @user = User.new(first_name: "Joe", last_name: "Dirt", email:"joe@dirt.com", password_confirmation: "dirtisking")
        @user.save 
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    end

    context 'if the password confirmation is missing' do
      it 'should not save' do
        @user = User.new(first_name: "Joe", last_name: "Dirt", email:"joe@dirt.com", password: "dirtisking")
        @user.save 
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end

    context 'if the password/password_confirmation do not match' do
      it 'should not save' do
        @user = User.new(first_name: "Joe", last_name: "Dirt", email:"joe@dirt.com", password: "dirtisking", password_confirmation: "mrclean")
        @user.save 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'if the password/password_confirmation does not meet minimum character requirement (5)' do
      it 'should not save' do
        @user = User.new(first_name: "Joe", last_name: "Dirt", email:"joe@dirt.com", password: "pass", password_confirmation: "pass")
        @user.save 
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)", "Password confirmation is too short (minimum is 5 characters)")
      end
    end

    context 'emails must be unique' do
      it 'should not save if the email already exists (regardless of case)' do
        @user = User.new(first_name: "Mark", last_name: "Wahlberg", email:"test@test.com", password: "markymark", password_confirmation: "markymark")
        @user.save
        @user = User.new(first_name: "Jack", last_name: "Reacher", email:"TEST@TEST.COM", password: "jackyjack", password_confirmation: "jackyjack")
        @user.save
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
    end

  end



end
