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
    
        it 'カテゴリが1の場合は無効であること' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
    
        it '商品状態が1の場合は無効であること' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
    
        it '配送料が1の場合は無効であること' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
        end
    
        it '都道府県が1の場合は無効であること' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
    
        it '配送日数が1の場合は無効であること' do
          @item.shipping_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
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

        it '価格が299以下では無効であること' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it '価格が10_000_000以上では無効であること' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it '画像が空では無効であること' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

      end
   
  end


end