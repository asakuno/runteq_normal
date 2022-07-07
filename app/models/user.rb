class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :first_name, length: { maximum: 255 }, presence: true
  validates :last_name, length: { maximum: 255 }, presence: true

  def own?(object)
    self.id == object.user_id  
  end

  def bookmark?(board)
    bookmark_boards.include?(board)
  end

  def bookmark(board)
    bookmark_boards << board
  end

  def unbookmark(board)
    bookmark_boards.destroy(board)
  end
end
