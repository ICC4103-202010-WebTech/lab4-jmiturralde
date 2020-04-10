class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type
  after_create :update_stats
  after_destroy :update_statss
  before_create :check_space

  private
    def update_stats
      es = self.ticket_type.event.event_stat
      es.increment(:tickets_sold,1)
      es.increment(:attendance,1)
      es.save!
    end
  private
  def update_statss
    es = self.ticket_type.event.event_stat
    es.decrement(:tickets_sold,1)
    es.decrement(:attendance,1)
    es.save!
  end
  private
  def check_space
    es =self.ticket_type.event.event_stat.tickets_sold
    ef =self.ticket_type.event.event_venue.capacity
    raise "Event is full" if es>=ef
  end
end
