require 'rails_helper'

RSpec.describe "コメント投稿機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @accent = FactoryBot.create(:accent)
    @comment = FactoryBot.build(:comment)
  end

  it 'ログインしたユーザーはアクセント詳細ページでコメント投稿できる' do
    sign_in(@user)
    visit accent_path(@accent)
    fill_in 'comment[comment]', with: @comment
    expect{
      click_on ('コメントする')
    }.to change { Comment.count }.by(1)
    expect(current_path).to eq accent_path(@accent)
    expect(page).to have_content @comment
  end
end
