# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  birthday     :date
#  gender       :integer
#  introduction :text
#  nickname     :string
#  subscribed   :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  belongs_to :user
  enum gender: { male: 0, female: 1, other: 2}
  has_one_attached :avatar

  def age
    if birthday.present?
      years = Time.zone.now.year - birthday.year
      days = Time.zone.now.yday - birthday.yday
      if days < 0
        return  "#{years - 1}歳"
      else
        return  "#{years}歳"
      end
    else
      return '不明'

  
    end
  end

  end
