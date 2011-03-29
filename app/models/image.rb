# == Schema Information
# Schema version: 20110329004100
#
# Table name: images
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  description        :text
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  created_at         :datetime
#  updated_at         :datetime
#  piece_id           :integer
#

class Image < ActiveRecord::Base
  belongs_to :piece
  validates :piece, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :photo_file_name, :presence => true
  has_attached_file :photo,
    :styles => {
      :thumb=> "50x50#",
      :small  => "100x100>",
      :large =>   "500x500>" }
end

