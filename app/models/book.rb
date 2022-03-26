class Book < ApplicationRecord
  # Userモデルとのアソシエーション設定 N：1（useridの紐付け）
  belongs_to :user

  # バリデーション設定
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }

end
