class CostumesController < ApplicationController
  before_action :find_user, only: %i[show edit mycostumes]
  before_action :find_costume, only: %i[update destroy show edit]
  skip_before_action :authenticate_user!, only: :index

def index

  @costumes = Costume.all
    if params[:query].present?
      if params[:dates].present?
        dates = params[:dates].split(' to ')
        start_date = dates.first.to_date - 1.day
        end_date = dates.last.to_date + 1.day
      end
      @costumes = Costume.search_by_title_and_description_and_category(params[:query])
        # AND bookings.start_date <= :datepickr_start_date
        # AND bookings.end_date >= :datepickr_end_date
      # @costumes = @costumes.joins(:bookings).where(sql_subquery, query: "%#{params[:query]}%", datepickr_start_date: start_date, datepickr_end_date: end_date )
      if dates.present?
        @costumes = @costumes.joins(:bookings).where.not(bookings: {start_date: start_date..end_date} ).where.not(bookings: {end_date: start_date..end_date})
      end

    end

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
      "Sci-Fi", "Fairy Tale", "Zombie",
      "Vampire", "Alien", "Steampunk", "Celebrity", "Cartoon",
      "Clown", "Victorian", "Greek Mythology",
      "Roman Mythology", "Ninja", "Samurai", "Military", "Western",
      "Robot", "Wizard", "Witch"
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
    params.require(:costume).permit(:title, :description, :price_per_day, :size, :category, photos: [])
  end
end
