require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録機能' do
    before do
      @user = FactoryBot.build(:user)
    end
  
    context 'ユーザー登録できる時' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが６文字以上であれば登録できること' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end
      it 'パスワードは大文字でも登録できること' do
        @user.password = 'ABCDEF'
        @user.password_confirmation = 'ABCDEF'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'ニックネームが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'Eメールが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'パスワードが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが５文字以下だと登録できないこと' do
        @user.password ='12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '567890'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードが全角入力だと登録できないこと' do
        @user.password = '１２３４５６'
        @user.password_confirmation = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数を入力してください")
      end
      it '重複したEメールが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
    end
  end
end
