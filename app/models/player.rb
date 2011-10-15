class Player
  include MongoMapper::EmbeddedDocument

  key :player, String
  key :score, Float
  key :status, String

end
