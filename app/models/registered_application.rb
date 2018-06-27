class RegisteredApplication < ApplicationRecord
  belongs_to :user

  validates(:name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false})

  validates(:url, presence: true, length: {minimum: 3}, uniqueness: {case_sensitive: false})
end
