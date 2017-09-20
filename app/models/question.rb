class Question < ApplicationRecord
  belongs_to :subgenre
  has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :audio
	validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\z/
end
