require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:item) { create(:item) }

  it "有効な状態であること" do
    expect(item).to be_valid
  end
end
