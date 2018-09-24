class Wordlist1sController < ApplicationController
  def index
    @wordlist1s = Wordlist1.paginate(page: params[:page]) 
  end
  
  def show
    @wordlist1 = Wordlist1.find(params[:id])
  end
    
  def new
    @wordlist1 = Wordlist1.new
    #@wordlist1.build_learned
  end
    
  def create
    @wordlist1 = Wordlist1.new wordlist1_params
    if @wordlist1.save
     flash[:success] = t "success"
     redirect_to wordlist1s_path
    else
     render :new
    end
  end
  
  def edit
    @wordlist1 = Wordlist1.find(params[:id])
  end
  
  def destroy
    Wordlist1.find(params[:id]).destroy
    if @wordlist1.nil?
      flash[:success] = t "delete"
    else
      flash[:danger] = t "error"
    end
    redirect_to wordlist1s_url
  end
  
  def update
    @wordlist1 = Wordlist1.find(params[:id])
    if @wordlist1.update_attributes(wordlist1_params)
      flash[:success] = t "update"
    else
      render :edit
    end
    render "learneds/_show_learned"
  end
  
  private
  
  def wordlist1_params
    params.require(:wordlist1).permit :name, :word1, :word2, :word3, :word4, :word5,
     learned_attributes: [:id, :name, :word1, :word2, :word3, :word4, :word5]
  end
end
