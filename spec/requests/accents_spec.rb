require 'rails_helper'

RSpec.describe "Accents", type: :request do
  before do
    @accent = FactoryBot.create(:accent)
  end
  
  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスに登録済みの単語が存在する' do
      get root_path
      expect(response.body).to include @accent.word
    end

    it 'indexアクションにリクエストするとレスポンスに検索フォームが存在する' do
      get root_path
      expect(response.body).to include("調べたい単語を入力")
    end
  end
  
  describe "GET #show" do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get accent_path(@accent)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスに登録済みの単語が存在する' do
      get accent_path(@accent)
      expect(response.body).to include @accent.word
    end

    it 'showアクションにリクエストするとレスポンスに登録済みの単語（フリガナ）が存在する' do
      get accent_path(@accent)
      expect(response.body).to include("テ＼スト")
    end

    it 'showアクションにリクエストするとレスポンスに登録済みの品詞が存在する' do
      get accent_path(@accent)
      expect(response.body).to include @accent.part_of_speech.name
    end
  
    it 'showアクションにリクエストするとレスポンスに登録済みのアクセントの型が存在する' do
      get accent_path(@accent)
      expect(response.body).to include @accent.accent_pattern.name
    end

    it 'showアクションにリクエストするとレスポンスに登録済みの情報源が存在する' do
      get accent_path(@accent)
      expect(response.body).to include @accent.info
    end

    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do
      get accent_path(@accent)
      expect(response.body).to include("コメント")
    end
  end
end
