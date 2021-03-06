# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  module Status
    NOT_STARTED = 0
    STARTED = 1
    FINISHED = 2
  end

  scope :not_started, -> {where(status: Status::NOT_STARTED)}
  scope :started,     -> {where(status: Status::STARTED)}
  scope :finished,    -> {where(status: Status::FINISHED)}

  validates :title, presence: true

  def not_started?
    self.status == Status::NOT_STARTED
  end

  def started?
    self.status == Status::STARTED
  end
end
