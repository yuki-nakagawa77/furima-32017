require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_hurigana、first_name_hurigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '@がないとemailが登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角でなければ登録できない' do
        @user.last_name = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_huriganaが空では登録できない' do
        @user.last_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hurigana can't be blank")
      end
      it 'last_name_huriganaが全角でカナでなければ登録できない' do
        @user.last_name_hurigana = 'ふりがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name hurigana is invalid')
      end
      it 'first_name_huriganaが空では登録できない' do
        @user.first_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana can't be blank")
      end
      it 'first_name_huriganaが全角でカナでなければ登録できない' do
        @user.first_name_hurigana = 'ふりがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name hurigana is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
