# frozen_string_literal: true
class Redirect < ActiveRecord::Base
  validates :src, :dst, :site, presence: true
  validates :src, uniqueness: true

  enum site: [:portal, :pro]
end
