require 'rails_helper'
RSpec.describe User, type: :model do
  
  describe 'ユーザー新規登録' do

   before do
    @user = FactoryBot.build(:user)
   end

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
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


    it "passwordが英字のみでは登録できない" do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password must be a combination of letters and numbers"
    end

    it "passwordが数字のみでは登録できない" do
      @user.password = '0000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password must be a combination of letters and numbers"
    end

    it "passwordが全角文字を含む場合は登録できない" do
      @user.password = 'aaa０00' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password must be a combination of letters and numbers"
    end

    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
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
end
