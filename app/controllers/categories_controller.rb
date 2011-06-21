class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.not_deleted

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories, :include => :existing_foods } # категории с едой
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.not_deleted.find(params[:id])
    # простейший вариант сортировки
    if params[:sort] == "title"
      order = "title"
    elsif params[:sort] == "date"
      order = "created_at"
    elsif
      order = "created_at"
    end
    @foods = @category.existing_foods.order(order + " ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.not_deleted.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.not_deleted.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.not_deleted.find(params[:id])
    #@category.destroy
    @category.update_attribute(:deleted, true)
    @categories = Category.not_deleted

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
      format.js   { render "_categories" } # аяксовая перезагрузка списка категорий
    end
  end
end
