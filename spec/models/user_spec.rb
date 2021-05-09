require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、first_nameとsecond_name、first＿knameとsecond＿kname、birthday、passwordとpassword＿confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword＿confirmationが半角英数字混合で6文字以上あれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'second_nameが空では登録できない' do
        @user.second_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name can't be blank")
      end

      it 'first_knameが空では登録できない' do
        @user.first_kname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kname can't be blank")
      end

      it 'second_knameが空では登録できない' do
        @user.second_kname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second kname can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが英語だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'ユーザーの名前は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'eigo'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'ユーザーの苗字は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.second_name = 'eigo'
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name is invalid")
      end

      it 'ユーザーの名前のフリガナは、全角（カタカナ）でなければ登録できない' do
        @user.first_kname = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kname is invalid")
      end

      it 'ユーザーの苗字のフリガナは、全角（カタカナ）でなければ登録できない' do
        @user.second_kname = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Second kname is invalid")
      end
    end
  end
end