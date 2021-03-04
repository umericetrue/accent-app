require 'rails_helper'

RSpec.describe "尾高型投票機能(いいね機能)", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @accent = FactoryBot.create(:accent)
  end

  context '投票できるとき' do
    it 'ログインしたユーザーはアクセント詳細ページで尾高型の投票機能を使うことができる' do
      basic_pass root_path
      sign_in(@user)
      visit accent_path(@accent)
      expect {
        click_link '尾高型'
      }.to change { Odaka.count }.by(1)
      expect(current_path).to eq accent_path(@accent)
    end
  end
  context '投票できない時' do
    it 'ログインしていないユーザーはアクセント詳細ページで尾高型の投票機能を使うことができない' do
      basic_pass root_path
      visit accent_path(@accent)
      expect(page).to have_no_link '尾高型'
    end
  end
end