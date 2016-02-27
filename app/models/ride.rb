class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    #current_user ||= User.all.first
    #binding.pry
    messages = ["Sorry."]
    if self.user.tickets < self.attraction.tickets
      messages << "You do not have enough tickets the #{self.attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      messages << "You are not tall enough to ride the #{self.attraction.name}."
    end

    if messages[1].nil?
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    else
      messages.join(" ")
    end
  end
end
