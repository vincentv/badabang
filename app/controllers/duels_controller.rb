class DuelsController < InheritedResources::Base
  respond_to :html, :json

  def create

    player_one = User.find(params[:duel][:player_one])
    player_two = User.find(params[:duel][:player_two])

    params[:duel][:player_one_nickname] = player_one.nickname
    params[:duel][:player_two_nickname] = player_two.nickname

    if params[:duel][:player_one_score] < params[:duel][:player_two_score]
      params[:duel][:winner] = params[:duel][:player_one]
      player_one.win
      player_two.lose
    else
      params[:duel][:winner] = params[:duel][:player_two]
      player_one.lose
      player_two.win
    end

    create!
  end

end
