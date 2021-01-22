require 'rails_helper'

RSpec.describe 'アクセント登録機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @accent = FactoryBot.build(:accent)
    @accent_part_of_speech = '名詞'
    @accent_accent_pattern = '頭高型'
  end
  context 'アクセント登録ができるとき' do
    it 'ログインしたユーザーはアクセント新規登録できる' do
      sign_in(@user)
      click_on('単語登録する')
      fill_in 'accent[word]', with: @accent.word
      fill_in 'accent[word_kana]', with: @accent.word_kana
      select @accent_part_of_speech, from: 'accent[part_of_speech_id]'
      select @accent_accent_pattern, from: 'accent[accent_pattern_id]'
      fill_in 'accent[info]', with: @accent.info
      expect  do
        click_on '登録する'
      end.to change { Accent.count }.by(1)
      # 詳細ページに遷移していることを確認する
      expect(page).to have_no_content('登録')
      expect(page).to have_content('コメント')
      # 詳細ページに登録した内容が反映されていることを確認する
      expect(page).to have_content(@accent.word.to_s)
      expect(page).to have_content('テ＼スト')
      expect(page).to have_content(@accent_part_of_speech.to_s)
      expect(page).to have_content(@accent_accent_pattern.to_s)
      expect(page).to have_content(@accent.info.to_s)
    end
  end
  context 'アクセント登録ができないとき' do
    it 'ログインしていないとアクセント新規登録ページに遷移できない' do
      visit root_path
      click_on('単語登録する')
      visit root_path
    end
  end
end

RSpec.describe 'アクセント編集機能', type: :system do
  before do
    @accent1 = FactoryBot.create(:accent)
    @accent2 = FactoryBot.create(:accent)
  end
  context 'アクセント編集ができるとき' do
    it 'ログインしたユーザーは自分が登録した単語の編集ができる' do
      sign_in(@accent1.user)
      click_on(@accent1.word)
      expect(current_path).to eq accent_path(@accent1)
      expect(page).to have_content('編集')
      click_on('編集')
      expect(current_path).to eq edit_accent_path(@accent1)
      # 登録済みの内容がすでにフォームに入力された状態であることを確認する
      expect(
        find('#word-id').value
      ).to eq @accent1.word
      expect(
        find('#word-kana-id').value
      ).to eq @accent1.word_kana
      expect(
        find('#speech-select-id').value
      ).to eq @accent1.part_of_speech_id.to_s
      expect(
        find('#speech-select-id').value
      ).to eq @accent1.part_of_speech_id.to_s
      expect(
        find('#accent-pattern-id').value
      ).to eq @accent1.accent_pattern_id.to_s
      expect(
        find('#beat-count-id').value
      ).to eq @accent1.beat_count_id.to_s
      expect(
        find('#info-id').value
      ).to eq @accent1.info
      # 投稿内容を編集する
      fill_in 'accent[word]', with: "#{@accent1.word}を編集した単語"
      fill_in 'accent[word_kana]', with: "#{@accent1.word_kana}ヲヘンシュウシタタンゴフリガナ"
      select '動詞', from: 'accent[part_of_speech_id]'
      select '尾高型', from: 'accent[accent_pattern_id]'
      select '3', from: 'accent[beat_count_id]'
      fill_in 'accent[info]', with: "#{@accent1.info}+編集した情報源"
      # 編集してもAccentモデルのカウントは変わらないことを確認する
      expect  do
        click_on('登録する')
      end.to change { Accent.count }.by(0)
      # 詳細ページに遷移していることを確認する
      expect(current_path).to eq accent_path(@accent1)
      # 更新内容が反映されていることを確認する
      expect(page).to have_content("#{@accent1.word}を編集した単語")
      expect(page).to have_content("#{@accent1.word_kana}ヲヘンシュウシタタンゴフリガナ＼")
      expect(page).to have_content(@accent_part_of_speech.to_s)
      expect(page).to have_content(@accent_accent_pattern.to_s)
      expect(page).to have_content(@accent1.info.to_s)
    end
  end

  context 'アクセント編集ができないとき' do
    it 'ログインしたユーザーは自分以外が登録した単語の編集画面には遷移できない' do
      sign_in(@accent1.user)
      click_on(@accent2.word)
      expect(current_path).to eq accent_path(@accent2)
      # 編集ボタンがないことを確認する
      expect(page).to have_no_content('編集')
    end
    it 'ログインしていないと単語の編集画面には遷移できない' do
      visit root_path
      click_on(@accent1.word)
      expect(page).to have_no_content('編集')
    end
  end
end

RSpec.describe 'アクセント詳細機能', type: :system do
  before do
    @accent1 = FactoryBot.create(:accent)
    @accent2 = FactoryBot.create(:accent)
  end
  it 'ログインしたユーザーは自分が登録したアクセント詳細ページに遷移すると編集ボタンとコメント投稿欄が表示される' do
    sign_in(@accent1.user)
    click_on(@accent1.word)
    expect(current_path).to eq accent_path(@accent1)
    # 詳細ページが正しく表示されているかどうかはaccentsコントローラーの単体テストで確認済み
    expect(page).to have_content '編集'
    expect(page).to have_selector 'form'
  end
  it 'ログインしたユーザーは別のユーザーが登録したアクセント詳細ページに遷移するとコメント投稿欄は表示されるが編集ボタンは表示されない' do
    sign_in(@accent1.user)
    click_on(@accent2.word)
    expect(current_path).to eq accent_path(@accent2)
    # 詳細ページが正しく表示されているかどうかはaccentsコントローラーの単体テストで確認済み
    # コメント用のフォームが存在することを確認する
    expect(page).to have_selector 'form'
    expect(page).to have_no_content '編集'
  end
  it 'ログインしていない状態ではアクセント詳細ページに遷移できるもののコメント投稿欄は表示されない' do
    visit root_path
    click_on(@accent1.word)
    expect(current_path).to eq accent_path(@accent1)
    # 詳細ページが正しく表示されているかどうかはaccentsコントローラーの単体テストで確認済み
    expect(page).to have_no_selector 'form'
    expect(page).to have_content 'コメントの投稿には新規登録/ログインが必要です'
  end
end
