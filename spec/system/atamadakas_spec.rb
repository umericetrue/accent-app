require 'rails_helper'

RSpec.describe "頭高型投票機能(いいね機能)", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @accent = FactoryBot.create(:accent)
  end

  context '投票できるとき' do
    it 'ログインしたユーザーはアクセント詳細ページで頭高型の投票機能を使うことができる' do
      basic_pass root_path
      sign_in(@user)
      visit accent_path(@accent)
      expect {
        click_link '頭高型'
      }.to change { Atamadaka.count }.by(1)
      expect(current_path).to eq accent_path(@accent)
    end
  end
end