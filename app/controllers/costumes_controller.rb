class CostumesController < ApplicationController
  before_action :find_user, only: %i[show edit mycostumes]
  before_action :find_costume, only: %i[update destroy show edit]
  skip_before_action :authenticate_user!, only: :index

  def index
    @costumes = Costume.all
  end

  def show
    @booking = Booking.new
    @bookings_dates = @costume.bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
      }
    end
  end

  def new
    @costume = Costume.new
    @costume_categories = [
      "Animal", "Superhero", "Fantasy", "Horror", "Historical",
      "Sci-Fi", "Pirate", "Disney", "Fairy Tale", "Zombie",
      "Vampire", "Alien", "Steampunk", "Celebrity", "Cartoon",
      "Clown", "Sports", "Medieval", "Victorian", "Greek Mythology",
      "Roman Mythology", "Ninja", "Samurai", "Military", "Western",
      "Space", "Sea Creature", "Robot", "Wizard", "Witch"
    ]
  end

  def create
    costume = Costume.new(costume_params)
    costume.user = current_user
    if costume.save!
      redirect_to costume_path(costume)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @costume_categories = [
      "Animal", "Superhero", "Fantasy", "Horror", "Historical",
      "Sci-Fi", "Pirate", "Disney", "Fairy Tale", "Zombie",
      "Vampire", "Alien", "Steampunk", "Celebrity", "Cartoon",
      "Clown", "Sports", "Medieval", "Victorian", "Greek Mythology",
      "Roman Mythology", "Ninja", "Samurai", "Military", "Western",
      "Space", "Sea Creature", "Robot", "Wizard", "Witch"
    ]
  end

  def update
    if @costume.update(costume_params)
      redirect_to costume_path(@costume), notice: 'Costume was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @costume.destroy
    redirect_to costume_path(@costume), status: :see_other
  end

  def mycostumes
    @costumes = @user.costumes
  end

  private

  def find_user
    @user = current_user
  end

  def find_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:title, :description, :price_per_day,:size, :category ,photos: [])
  end
end
