require 'rails_helper'

RSpec.describe Item, type: :model do


  describe '商品の情報を入力' do


     before do
        @item = FactoryBot.build(:item)
     end

      context '内容に問題ない場合' do

        it 'すべての情報があれば出品できる' do
            expect(@item).to be_valid
        end

      end
      
  
      context '内容に問題ある場合' do

        it 'ユーザーが紐付いていなければ出品できない' do
             @item.user = nil
             @item.valid?
             expect(@item.errors.full_messages).to include('User must exist')
  
        end

        it '商品名が空の場合は無効であること' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
    
        it '説明が空の場合は無効であること' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
    
        it 'カテゴリが空の場合は無効であること' do
          @item.category = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
    
        it '商品状態が空の場合は無効であること' do
          @item.condition = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
    
        it '配送料が空の場合は無効であること' do
          @item.shipping_fee = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end
    
        it '都道府県が空の場合は無効であること' do
          @item.prefecture = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
    
        it '配送日数が空の場合は無効であること' do
          @item.shipping_date = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank")
        end
    
        it '価格が空の場合は無効であること' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
    
        it '価格が半角数字でないと無効であること' do
          @item.price = '３０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
    

      end
   
  end


end