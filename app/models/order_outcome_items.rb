class OrderOutcomeItems < ActiveRecord::Base

  belongs_to :item
  belongs_to :outcome, class_name: 'OrderOutcome'

end
