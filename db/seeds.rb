require 'json'
require 'open-uri'

# puts 'Creating memory...'
# puts 'Creating signs...'
# signs_array = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]

# signs_array.each do |sign|
#   Sign.find_or_create_by!(sign_name: sign)
# end
# puts 'Signs created!'

# puts "Create Brazilian states"

# states_array = ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"]
# states_array.each do |state_br|
#   State.find_or_create_by!(state_name: state_br)
# end

# puts "Brazilian states created"

# puts 'Creating matches!'
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 1, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 2, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 3, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 4, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 5, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 6, percentage: 45)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 7, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 8, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 9, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 10, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 11, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 1,  sign_two_id: 12, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 1, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 2, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 3, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 4, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 5, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 6, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 7, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 8, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 9, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 10, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 11, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 2,  sign_two_id: 12, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 1, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 2, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 3, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 4, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 5, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 6, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 7, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 8, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 9, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 10, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 11, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 3,  sign_two_id: 12, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 1, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 2, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 3, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 4, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 5, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 6, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 7, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 8, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 9, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 10, percentage: 45)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 11, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 4,  sign_two_id: 12, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 1, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 2, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 3, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 4, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 5, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 6, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 7, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 8, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 9, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 10, percentage: 45)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 11, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 5,  sign_two_id: 12, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 1, percentage: 45)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 2, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 3, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 4, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 5, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 6, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 7, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 8, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 9, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 10, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 11, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 6,  sign_two_id: 12, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 1, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 2, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 3, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 4, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 5, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 6, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 7, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 8, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 9, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 10, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 11, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 7,  sign_two_id: 12, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 1, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 2, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 3, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 4, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 5, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 6, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 7, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 8, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 9, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 10, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 11, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 8,  sign_two_id: 12, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 1, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 2, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 3, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 4, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 5, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 6, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 7, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 8, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 9, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 10, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 11, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 9,  sign_two_id: 12, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 1, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 2, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 3, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 4, percentage: 45)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 5, percentage: 45)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 6, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 7, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 8, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 9, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 10, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 11, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 10, sign_two_id: 12, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 1, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 2, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 3, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 4, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 5, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 6, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 7, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 8, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 9, percentage: 60)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 10, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 11, percentage: 80)
# SignMatch.find_or_create_by!(sign_one_id: 11, sign_two_id: 12, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 1, percentage: 65)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 2, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 3, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 4, percentage: 90)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 5, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 6, percentage: 70)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 7, percentage: 50)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 8, percentage: 95)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 9, percentage: 75)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 10, percentage: 85)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 11, percentage: 55)
# SignMatch.find_or_create_by!(sign_one_id: 12, sign_two_id: 12, percentage: 80)
# puts 'Matches created!'
# puts 'Memory created!'

def get_randomuser
  key = "CQUK-0U2E-69AP-K69U"
  ref = "htc3lz0n"
  url = "https://randomuser.me/api/?key=#{key}&ref=#{ref}"

  user_serialized = open(url).read

  user_parsed = JSON.parse(user_serialized)
  user_parsed['results'][0]
end

def get_address
  array_ceps = ["03805-160", "03045-020", "04932-160", "04713-020", "08440-200", "03040-050", "08440-450", "02443-060", "02345-070",
               "04856-330", "05467-000", "04015-011", "03948-010", "05304-010", "08021-520", "05376-190", "05347-015", "04194-285",
               "08420-170", "02990-322", "05056-030", "08382-505", "04675-010", "03578-225", "03125-070", "03952-010", "05101-225",
               "08140-313", "08391-597", "08250-540", "04853-135", "04205-914", "05871-320", "04571-090", "03332-080", "03894-210",
               "05585-060", "02082-010", "04141-100", "03275-160", "05692-030", "04249-095", "02366-295", "08390-334", "03405-010"]
  cep = array_ceps.sample
  key = "4ed7f5f0f2ccd6cc919b860d606d4b12"
  url = "http://geradorapp.com/index.php/api/v1/cep/search/#{cep}?token=#{key}"
  user_serialized = open(url).read
  user_parsed = JSON.parse(user_serialized)
  info_cep = user_parsed['data']
  info_cep
  
random_user = get_randomuser
user_location = get_address

user = User.new
user.username = "#{random_user['name']['first']} #{random_user['name']['last']}"
user.email = random_user['email']
user.gender = random_user['gender']
user.birthdate = random_user['dob']['date']
user.current_address = "#{user_location['address']}, #{user_location['district']}"
user.state_id = State.find_by(state_name: "#{user_location['state_name']}").id
user.birth_city = "#{user_location['city']}, #{user_location['state_name']}"
user.password = 123123
if user.gender == "male"
  user.like_woman = true
  user.like_man = false
else
  user.like_woman = false
  user.like_man = true
end
# photo = URI.open(random_user['picture']['large'])
# user.photo.attach(io: photo, filename: "#{Time.now.to_i}.jpg", content_type: 'image/jpeg')
user.save!
