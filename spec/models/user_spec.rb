require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new({
      :first_name => 'Aeri',
      :last_name => 'Kim',
      :email => 'giselle@gmail.com',
      :password => 'aespa1',
      :password_confirmation => 'aespa1' 
    })
  end

  describe 'Validations' do
    it 'should save with a valid user account' do
      @user.save
      expect(@user).to be_present
    end

    it 'should check for a first name' do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should check for a last name' do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should check for a email name' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should check for both a password and password confirmation' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should check for matching password and password confirmation' do
      @user.password_confirmation = 'aespa2'
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should check for unique emails' do
      @user.save
      @user1 = User.new({
        :first_name => 'Giselle',
        :last_name => 'Kim',
        :email => 'giselle@gmail.com',
        :password => 'aespa1',
        :password_confirmation => 'aespa1337' 
      })
      @user1.save
      expect(@user1.errors.full_messages).to include("Email has already been taken")
      end 
  
  end
end
