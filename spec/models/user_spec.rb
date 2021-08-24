require 'rails_helper'

RSpec.describe User, type: :model do
  # before do
  #   @user = User.new({
  #     :first_name => 'Aeri',
  #     :last_name => 'Kim',
  #     :email => 'giselle@gmail.com',
  #     :password => 'aespa1',
  #     :password_confirmation => 'aespa1' 
  #   })
  # end

  describe 'Validations' do
    it 'should save with a valid user account' do
      @user = User.new({
        :first_name => 'Aeri',
        :last_name => 'Kim',
        :email => 'giselle@gmail.com',
        :password => 'aespa1',
        :password_confirmation => 'aespa1' 
      })
      @user.save
      expect(@user).to be_present
    end
  end



end
