# Clear existing data to avoid conflicts
Categorization.delete_all
Like.delete_all
Registration.delete_all
Event.delete_all
User.delete_all
Category.delete_all

# Create Categories
categories = Category.create!([
  { name: 'Development' },
  { name: 'Design' },
  { name: 'Business' },
  { name: 'Networking' },
  { name: 'Education' }
])

# Create Users (1 admin + 4 regular users)
admin = User.create!(
  name: 'Moe',
  email: 'moe@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

regular_users = User.create!([
  {
    name: 'John Doe',
    email: 'john@example.com',
    password: 'password123',
    password_confirmation: 'password123',
    admin: false
  },
  {
    name: 'Jane Smith',
    email: 'jane@example.com',
    password: 'password123',
    password_confirmation: 'password123',
    admin: false
  },
  {
    name: 'Bob Johnson',
    email: 'bob@example.com',
    password: 'password123',
    password_confirmation: 'password123',
    admin: false
  },
  {
    name: 'Alice Williams',
    email: 'alice@example.com',
    password: 'password123',
    password_confirmation: 'password123',
    admin: false
  }
])

# Create Events
events = Event.create!([
  {
    name: 'BugSmash',
    location: 'Denver, CO',
    price: 0.00,
    starts_at: 30.days.from_now,
    capacity: 50,
    description: %{
      Join us for a fun evening of bug smashing! It's a great
      way to get involved in open source projects whether you're
      reporting bugs, fixing bugs, or even creating
      a few bugs!
    }.squish,
    image_file_name: 'bugsmash.png'
  },
  {
    name: 'Hackathon',
    location: 'Austin, TX',
    price: 15.00,
    starts_at: 45.days.from_now,
    capacity: 100,
    description: %{
      Got an awesome app idea you've been itching to work on? Hunker
      down and hack away! This is an intense, focused day of hacking
      on anything you want. The entry fee goes toward a bounty of cash
      and prizes for winners in a variety of categories.
    }.squish,
    image_file_name: 'hackathon.png'
  },
  {
    name: 'Kata Camp',
    location: 'Dallas, TX',
    price: 75.00,
    starts_at: 65.days.from_now,
    capacity: 30,
    description: %{
      Kata Camp is where developers go to practice their craft without interruptions. Skip the status reports and stand-up meetings of a typical project. Just get 'er done! Price includes a buffet lunch and a leather-bound journal to record your kata achievements.
    }.squish,
    image_file_name: 'katacamp.png'
  },
  {
    name: "Coffee 'n Code",
    location: 'Portland, OR',
    price: 0.00,
    starts_at: 20.days.ago,
    capacity: 40,
    description: %{
      Start your day off right with a good cup of Joe while you sling some code with other local developers. By the time you hit the office, you'll be in the groove!
    }.squish,
    image_file_name: 'coffee-code.png'
  },
  {
    name: 'Rails User Group',
    location: 'Reston, VA',
    price: 0.00,
    starts_at: 2.days.ago,
    capacity: 60,
    description: %{
      Come enjoy a technical talk and meet local Rails developers! This week's topic is a comparison of editors, templating systems, and whether to use tabs or spaces.
    }.squish,
    image_file_name: 'rails-user-group.png'
  },
  {
    name: 'Ruby User Group',
    location: 'Chicago, IL',
    price: 0.00,
    starts_at: 5.days.ago,
    capacity: 55,
    description: %{
      Do you heart Ruby? So do we! Every week a local developer presents
      a new Ruby-related topic to help you keep on top of your game.
    }.squish,
    image_file_name: 'ruby-user-group.png'
  },
  {
    name: '5-Minute Lightning Talks',
    location: 'Kansas City, MO',
    price: 15.00,
    starts_at: 10.days.ago,
    capacity: 75,
    description: %{
      Got a newfangled trick? A handy new tool? A just-released library? Here's your chance to share it! But you only get 5 minutes to present your must-know tip, so keep it snappy. Price includes an open ice cream and root beer float bar.
    }.squish,
    image_file_name: 'lightning.png'
  },
  {
    name: 'Drone Zone',
    location: 'Minneapolis, MN',
    price: 0.00,
    starts_at: 90.days.from_now,
    capacity: 45,
    description: %{
      What happens when software and hardware geeks get together?
      Things spin, whirl, and (possibly) collide! Everyone is welcome, whether you're new to hacking with drones and drone software, or have experience that reaches to the sky.
    }.squish,
    image_file_name: 'drone-zone.png'
  },
  {
    name: 'Coding Ninjas',
    location: 'San Diego, CA',
    price: 25.00,
    starts_at: 10.days.from_now,
    capacity: 35,
    description: %{
      Why ninjas? We have no idea, but the icon is cool. Don't miss this opportunity to show off your ninja moves.
    }.squish,
    image_file_name: 'ninjas.png'
  }
])

# Associate events with categories
events[0].categories << [categories[0]]  # BugSmash - Development
events[1].categories << [categories[0]]  # Hackathon - Development
events[2].categories << [categories[0], categories[2]]  # Kata Camp - Development, Business
events[3].categories << [categories[0], categories[3]]  # Coffee 'n Code - Development, Networking
events[4].categories << [categories[0], categories[3]]  # Rails User Group - Development, Networking
events[5].categories << [categories[0], categories[3]]  # Ruby User Group - Development, Networking
events[6].categories << [categories[0], categories[3]]  # Lightning Talks - Development, Networking
events[7].categories << [categories[0]]  # Drone Zone - Development
events[8].categories << [categories[0], categories[2]]  # Coding Ninjas - Development, Business

# Create some registrations
Registration.create!(user: regular_users[0], event: events[0], how_heard: 'Friend/Coworker')
Registration.create!(user: regular_users[1], event: events[1], how_heard: 'Twitter')
Registration.create!(user: regular_users[2], event: events[2], how_heard: 'Blog Post')
Registration.create!(user: regular_users[3], event: events[3], how_heard: 'News Letter')
Registration.create!(user: regular_users[0], event: events[4], how_heard: 'Web Search')

# Create some likes
Like.create!(user: regular_users[0], event: events[1])
Like.create!(user: regular_users[1], event: events[2])
Like.create!(user: regular_users[2], event: events[0])
Like.create!(user: regular_users[3], event: events[5])

puts "Seeded database with:"
puts "- #{Category.count} categories"
puts "- #{User.count} users (#{User.where(admin: true).count} admin)"
puts "- #{Event.count} events"
puts "- #{Registration.count} registrations"
puts "- #{Like.count} likes"