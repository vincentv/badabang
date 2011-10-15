class Duel
  include MongoMapper::Document

  key :player_one, String
  key :player_one_nickname, String
  key :player_one_score, Float
  key :player_two, String
  key :player_two_nickname, String
  key :player_two_score, Float
  key :winner, String

end
