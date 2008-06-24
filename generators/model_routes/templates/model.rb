class ModelRoute < ActiveRecord::Base
  validates_presence_of   :internal_path, :external_path
  validates_uniqueness_of :external_path
end