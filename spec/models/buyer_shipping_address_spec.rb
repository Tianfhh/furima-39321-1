require 'rails_helper'

RSpec.describe BuyerShippingAddress, type: :model do
  describe '購入情報の保存' do
   before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_shipping_address = FactoryBot.build(:buyer_shipping_address, user_id: @user.id, item_id: @item.id, token: Faker::Alphanumeric.alphanumeric(number: 16))
   end

   context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_shipping_address).to be_valid
    end

    it 'building_nameは空でも保存できること' do
      @buyer_shipping_address.building_name = ''
      expect(@buyer_shipping_address).to be_valid
    end

   end

   context '内容に問題ある場合' do

    it 'postal_codeが空だと保存できないこと' do
      @buyer_shipping_address.postal_code = ''
      @buyer_shipping_address.valid?
      expect(@buyer_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buyer_shipping_address.postal_code = '1234567'
      @buyer_shipping_address.valid?
      expect(@buyer_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idを選択していないと保存できないこと' do
      @buyer_shipping_address.prefecture_id = 0
      @buyer_shipping_address.valid?
      expect(@buyer_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @buyer_shipping_address.city = ''
      @buyer_shipping_address.valid?
      expect(@buyer_shipping_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと保存できないこと' do
      @buyer_shipping_address.house_number = ''
      @buyer_shipping_address.valid?
      expect(@buyer_shipping_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @buyer_shipping_address.phone_number = ''
      @buyer_shipping_address.valid?
      expect(@buyer_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end

   end
  end
end