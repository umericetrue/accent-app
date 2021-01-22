module SignInSupport
  def sign_in(user)
    visit root_path
    click_on('ログイン')
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_on('ログイン')
    expect(current_path).to eq root_path
  end
end
