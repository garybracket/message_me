class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :destroy]


  def set_url
    url = params[:query]
    import(url)

  end

  def show
  end

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "New subject was added successfully."
      redirect_to @subject
    else
      render 'new'
    end
  end

  def update
    if @subject.update(article_params)
      flash[:notice] = "Subject was updated successfully."
      redirect_to @subject
    else
      render 'edit'
    end
  end

  def destroy
    if @subject.destroy
      flash[:notice] = "Subject was deleted successfully."
      redirect_to subjects_path
    else
      flash[:notice] = "Article could NOT be deleted"
    end
  end

  def destroy2
    if Subject.destroy_all
      flash[:notice] = "ALL Subjects were deleted successfully."
      redirect_to subjects_path
    else
      flash[:notice] = "ALL Subjects could NOT be deleted"
    end
  end

  def import(url)
      puts 'Importing Data'
      data = Roo::Spreadsheet.open(url, extension: "xlsx") # opens the spreadsheet
      headers = data.row(1) # get header row
      data.each_with_index do |row, idx|
          next if idx == 0 # skip header row
          # create hash from headers and cells
          subject_data = Hash[[headers, row].transpose]
          subject = Subject.new(subject_data)
          puts "Saving Subject"
          subject.save!
        end
        flash[:notice] = "ALL subjects were imported from URL."
        redirect_to subjects_path
  end

  def import2
      puts 'Importing Data'
      data = Roo::Spreadsheet.open("#{ENV['my_url']}", extension: "xlsx") # opens the spreadsheet, env url grabs application.yml configs or HEROKU VAR CONFIG named my_url
      headers = data.row(1) # get header row
      data.each_with_index do |row, idx|
          next if idx == 0 # skip header row
          # create hash from headers and cells
          subject_data = Hash[[headers, row].transpose]
          # next if user exists
          subject = Subject.new(subject_data)
          puts "Saving Subject"
          subject.save!
        end
        flash[:notice] = "ALL subjects were imported from Heroku CONFIG VAR."
        redirect_to subjects_path
  end



  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :age)
  end



  # def require_same_user
  #   if current_user != @article.user && (!current_user.mod? && !current_user.admin? && !current_user.owner?)
  #     flash[:alert] = "You can only edit or delete your own article"
  #     redirect_to @article
  #   end
  # end
end
