require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートの保存' do
      it "画像とテキストがあればツイートは保存される" do
        expect(@tweet).to be_valid
      end
      it "テキストのみであればツイートは保存される" do
        @tweet.image = ""
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが保存出来ない場合' do
      it "テキストがないとツイートは保存出来ない" do
        @tweet.text = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it "ユーザーが紐付いていないとツイートは保存出来ない" do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
  end
end
