require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      click_on ('新規登録')
      expect(current_path).to eq new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録ができない時' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on ('新規登録')
      expect(current_path).to eq new_user_registration_path
      fill_in 'ニックネーム', with: ""
      fill_in 'Eメール', with: ""
      fill_in 'パスワード', with: ""
      fill_in 'パスワード（確認用）', with: ""
      expect{
        find('input[name="commit"]').click
    }.to change { User.count }.by(0)
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができる時' do
    it '保存されているユーザーの情報が合致すればログインができる' do
    visit root_path
    expect(page).to have_content('ログイン')
    click_on ('ログイン')
    expect(current_path).to eq new_user_session_path
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができない時' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
    visit root_path
    expect(page).to have_content('ログイン')
    click_on ('ログイン')
    expect(current_path).to eq new_user_session_path
    fill_in 'Eメール', with: ""
    fill_in 'パスワード', with: ""
    find('input[name="commit"]').click
    expect(current_path).to eq new_user_session_path
    end
  end
end