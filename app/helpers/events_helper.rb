module EventsHelper
  def day_and_time(event)
    event.starts_at.strftime("%d %B %Y at %I:%M %P")
  end

  def price(event)
    if event.free?
      "FREE"
    else
      number_to_currency(event.price, precision: 0 )
    end
  end
end
