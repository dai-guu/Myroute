require 'rails_helper'

RSpec.describe 'PostImageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_image.valid? }

    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }

    context 'shop_nameカラム' do
      it '空欄でないこと' do
        post_image.shop_name = ''
        is_expected.to eq false
      end
    end

    context 'captionカラム' do
      it '空欄でないこと' do
        post_image.caption = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇' do
        post_image.caption = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        post_image.caption = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostImage.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Recipe.reflect_on_association(:post_comment).macro).to eq :has_many
      end
    end

  end
end
