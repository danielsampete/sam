# == Schema Information
#
# Table name: favrelationships
#
#  id         :integer          not null, primary key
#  favmp_id   :integer
#  favby_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favrelationship < ActiveRecord::Base
  attr_accessible :favby_id, :favmp_id
  belongs_to :favmp, class_name: "Micropost"
  belongs_to :favby, class_name: "User"
  validates :favmp_id, presence: true
  validates :favby_id, presence: true
end
