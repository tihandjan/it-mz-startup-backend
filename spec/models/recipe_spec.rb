require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:porsion) }
  it { should validate_presence_of(:complexity) }
  it { should validate_presence_of(:publish) }
  it { should validate_presence_of(:image) }
  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:title).is_at_most(120) }
  it { should validate_length_of(:summary).is_at_least(5) }
  it { should validate_length_of(:summary).is_at_most(180) }
end
