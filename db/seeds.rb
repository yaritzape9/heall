require 'faker'
Girl.destroy_all
Volunteer.destroy_all
Expertise.destroy_all

languages = ['english', 'spanish', 'portuguese', 'arab']
expert = ['Safe Sex', 'STD\'S', 'Pregnant', 'Puberty', 'Rape Prevention', 'Mental Health']

10.times do
  Girl.create({
    username: Faker::Superhero.name,
    age: Faker::Number.between(1, 10),
    language: languages.sample,
    keyword: Faker::Food.ingredient,
    password: 'password',
    })
end

10.times do
  Volunteer.create({
    username: Faker::StarWars.character,
    language: languages.sample,
    password: 'password',
    })
end

10.times do
  volunteer = Volunteer.all.sample
  volunteer.expertises.create!({
      name: expert.sample
    })
end
