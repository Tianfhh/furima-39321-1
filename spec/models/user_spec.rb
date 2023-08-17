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

    it "passwordが英数字混合でないと登録できない" do
      @user.password = '123456' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password must be a combination of letters and numbers"
    end

    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).not_to include "Password confirmation can't be blank"
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'last_nameが全角日本語でないと保存できないこと' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it "last_name_kanaが全角カタカナでないと登録できない" do
      @user.last_name_kana = '田中' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters."
    end


    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "first_name_kanaが全角カタカナでないと登録できない" do
      @user.first_name_kana = '田中' 
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters."
    end


    it "birth_dateが空では登録できない" do
      @user.birth_date = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end

  end
end
