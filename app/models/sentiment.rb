class Sentiment < ActiveRecord::Base
  belongs_to :sentimentable, polymorphic: true
  belongs_to :relation_object
  belongs_to :document
  belongs_to :entity
end
