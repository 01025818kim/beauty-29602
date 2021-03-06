require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context "新規登録ができる場合" do
      it "全ての項目が正しく入力できていれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できない場合" do
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "nick_nameが空だと登録できない" do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it "メールアドレスが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したメールアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "@を含まないメールアドレスは登録できない" do
        @user.email = "abc.def"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが5文字以下では登録できない" do
        @user.password = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが全角英数字では登録できない" do
        @user.password = "ａａａ１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードが半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードが半角数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "確認用パスワードがパスワードと異なると登録できない" do
        @user.password_confirmation = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
