class Lgtm < ApplicationRecord
  validates :content, presence: true, length: { maximum: 280 }
  validates :content, format: { without: /<script|javascript:/i, message: "Invalid content detected" }
  
  before_save :sanitize_content

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "updated_at"]
  end

  private

  def sanitize_content
    self.content = ActionController::Base.helpers.strip_tags(content) if content.present?
  end
end
