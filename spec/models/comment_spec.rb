require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメント投稿できる時' do
      it 'commentが存在していれば投稿できる' do
        expect(@comment).to be_valid
      end
      it 'commentが200文字以内なら投稿できる' do
        @comment.comment = 'あ' * 200
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できない時' do
      it 'commentが空だと投稿できない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Commentを入力してください')
      end
      it 'commentが201文字以上だと投稿できない' do
        @comment.comment = 'あ' * 201
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Commentは200文字以内で入力してください')
      end
      it 'userが紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'accentが紐づいていないと投稿できない' do
        @comment.accent = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Accentを入力してください')
      end
    end
  end
end
