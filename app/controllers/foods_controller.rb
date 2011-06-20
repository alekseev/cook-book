class FoodsController < ApplicationController
  # GET /foods
  # GET /foods.xml
  def index
    if params[:sort] == "title"
      order = "title"
    elsif params[:sort] == "date"
      order = "created_at"
    elsif
      order = "created_at"
    end
    @foods = Food.not_deleted.order(order + " ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foods }
    end
  end

  # GET /foods/1
  # GET /foods/1.xml
  def show
    @food = Food.not_deleted.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @food }
    end
  end

  # GET /foods/new
  # GET /foods/new.xml
  def new
    @categories = Category.not_deleted
    @food = Food.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @food }
    end
  end

  # GET /foods/1/edit
  def edit
    @categories = Category.not_deleted
    @food = Food.not_deleted.find(params[:id])
  end

  # POST /foods
  # POST /foods.xml
  def create
    @food = Food.new(params[:food])

    respond_to do |format|
      if @food.save
        format.html { redirect_to(@food, :notice => 'Food was successfully created.') }
        format.xml  { render :xml => @food, :status => :created, :location => @food }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /foods/1
  # PUT /foods/1.xml
  def update
    @food = Food.not_deleted.find(params[:id])

    respond_to do |format|
      if @food.update_attributes(params[:food])
        format.html { redirect_to(@food, :notice => 'Food was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.xml
  def destroy
    @food = Food.not_deleted.find(params[:id])
    #@food.destroy
    @food.deleted = true
    @food.save
    @foods = Food.not_deleted

    respond_to do |format|
      format.html { redirect_to(foods_url) }
      format.xml  { head :ok }
      format.js   { render "_foods" }
    end
  end
end