class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    if Note.create(favorited: @sale, user: current_user)
      redirect_to favorite_sales_path
    end
  end

  def edit
  end

  def delete
  end

  private

    def note_params
      params.require(:note).permit(:description)
    end

end
