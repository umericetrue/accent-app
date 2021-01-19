require 'rails_helper'

RSpec.describe Accent, type: :model do
  describe 'アクセント登録機能' do
    before do
      @accent = FactoryBot.build(:accent)
    end
  
    context 'アクセントが登録できる時' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@accent).to be_valid
      end
      it '単語が20文字以内だと登録できること' do
        @accent.word = "あ" * 20
        expect(@accent).to be_valid
      end
      it '単語（フリガナ）が20文字以内だと登録できること' do
        @accent.word_kana = "ア" * 20
        expect(@accent).to be_valid
      end
      it '情報源が400文字以内だと登録できること' do
        @accent.info = "あ" * 400
        expect(@accent).to be_valid
      end
    end

    context 'アクセントが登録できない時' do
      it '単語が空だと登録できないこと' do
        @accent.word = nil
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語を入力してください")
      end
      it '単語が登録済みだと登録できないこと' do
        @accent.save
        another_accent = FactoryBot.build(:accent, word: @accent.word)
        another_accent.valid?
        expect(another_accent.errors.full_messages).to include("単語はすでに存在します")
      end
      it '単語が21文字以上だと登録できないこと' do
        @accent.word = "あ" * 21
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語は20文字以内で入力してください")
      end
      it '単語（フリガナ）が空だと登録できない' do
        @accent.word_kana = nil
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語（フリガナ）を入力してください")
      end
      it '単語（フリガナ）が半角カタカナだと登録できないこと' do
        @accent.word_kana = "ｱ"
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語（フリガナ）は全角カタカナを入力してください")
      end
      it '単語（フリガナ）が平仮名だと登録できないこと' do
        @accent.word_kana = "あ"
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語（フリガナ）は全角カタカナを入力してください")
      end
      it '単語（フリガナ）が全角英字だと登録できないこと' do
        @accent.word_kana = 'A'
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語（フリガナ）は全角カタカナを入力してください")
      end
      it '単語（フリガナ）が半角英数字だと登録できないこと' do
        @accent.word_kana = 'abc123'
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語（フリガナ）は全角カタカナを入力してください")
      end
      it '単語（フリガナ）が全角数字だと登録できないこと' do
        @accent.word_kana = '１'
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語（フリガナ）は全角カタカナを入力してください")
      end
      it '単語（フリガナ）が21文字以上だと登録できないこと' do
        @accent.word_kana = "ア" * 21
        @accent.valid?
        expect(@accent.errors.full_messages).to include("単語（フリガナ）は20文字以内で入力してください")
      end
      it '単語の品詞を選択しないと登録できないこと' do
        @accent.part_of_speech_id = 1
        @accent.valid?
        expect(@accent.errors.full_messages).to include("品詞を選択してください")
      end
      it 'アクセントの型を選択しないと登録できないこと' do
        @accent.accent_pattern_id = 1
        @accent.valid?
        expect(@accent.errors.full_messages).to include("アクセントの型を選択してください")
      end
      it '情報源が空だと登録できないこと' do
        @accent.info = nil
        @accent.valid?
        expect(@accent.errors.full_messages).to include("情報源を入力してください")
      end
      it '情報源が401文字以上だと登録できないこと' do
        @accent.info = "あ" * 401
        @accent.valid?
        expect(@accent.errors.full_messages).to include("情報源は400文字以内で入力してください")
      end
    end
  end
end
