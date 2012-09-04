#encoding: utf-8
class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find params[:id]
  end


  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new params[:subject]

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: t('notice.create', model: Subject.model_name.human) }
      else
        format.html { render action: "new" }
      end
    end 
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]

    respond_to do |format|
      if @subject.update_attributes params[:subject]
        format.html { redirect_to subjects_path, notice: t('notice.update', model: Subject.model_name.human)}
      else
        format.html { render action: "edit" }
      end
    end
    
  end

  def destroy
    @subject = Subject.find params[:id]
    @subject.destroy

    redirect_to subjects_url, notice: t('notice.destroy', model: Subject.model_name.human)
  end
end
