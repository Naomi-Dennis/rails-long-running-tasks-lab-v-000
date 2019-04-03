class SongsController < ApplicationController
   require "csv"
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  def upload
     CSV.foreach(params[:file].path, headers: true) do |song|
<<<<<<< HEAD
       new_song = Song.create({title: song[0]})
       artist = nil
       if Artist.where(name: song[1]).empty?
          artist = Artist.create!({name: song[1]})
          artist.save!
       else
          artist = Artist.find_by(name: song[1])
       end
       new_song.artist = artist
=======
       binding.pry
       new_song = Song.create({title: song[0]})
       new_artist = Artist.create!({name: song[1]})
       new_artist.save!
       new_song.artist = new_artist
>>>>>>> 8fcd2b2689398adc32b48475adec6dd3eaeafb20
       new_song.save!
     end
     redirect_to songs_path
   end
  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
