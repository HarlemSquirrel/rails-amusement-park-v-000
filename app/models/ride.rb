class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    current_user ||= User.all.first
    #binding.pry
    messages = ["Sorry."]
    if current_user.tickets < self.attraction.tickets
      messages << "You do not have enough tickets the #{self.attraction.name}."
    end
    if current_user.height < self.attraction.min_height
      messages << "You are not tall enough to ride the #{self.attraction.name}."
    end

    if messages[1].nil?
      #binding.pry
      current_user.tickets -= self.attraction.tickets
      current_user.nausea += self.attraction.nausea_rating
      current_user.happiness += self.attraction.happiness_rating
      current_user.save
    else
      messages.join(" ")
    end
  end
end
