require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "emailが空では登録できない" do
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "passwordが空だと登録できない" do
      @user.password = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "encrypted_passwordが空だと登録できない" do
      @user.encrypted_password = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Encrypted password can't be blank"
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "birth_dateが空では登録できない" do
      @user.birth_date = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end

  end
end
