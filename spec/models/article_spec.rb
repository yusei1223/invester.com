require 'rails_helper'

RSpec.describe 'Articleモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { ariticle.valid? }

    let(:user) { create(:user) }
    let!(:book) { build(:book, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        ariticle.title = ''
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空欄でないこと' do
        article.body = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Book.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
