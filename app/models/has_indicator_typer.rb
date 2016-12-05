class HasIndicatorTyper < ActiveRecord::Base
  belongs_to :stock
  belongs_to :indicator_type
end
