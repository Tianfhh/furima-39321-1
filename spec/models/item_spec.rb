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

    end
   


  end


end