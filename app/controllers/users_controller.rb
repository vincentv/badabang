class UsersController < InheritedResources::Base
  respond_to :html, :json

  def collection
    @users ||= User.sort(:reward.desc)
  end

  def show(options={}, &block)

    user_id = params[:id]
    #{:player_two => BSON::ObjectId(user_id)}])

    @duels = Duel.where(:$or =>[{:player_one => user_id},
                        {:player_two => user_id}])
    show!
  end
end
