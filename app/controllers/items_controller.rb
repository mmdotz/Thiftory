class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    #in Item model, created helper method to tell attachment method which object
    #we are passing in for refile upload
    respond_to do |format|
      format.json do
        render json: @items.to_json(include: :source, methods: :photo_url)
      end
      format.html
      format.csv {send_data @items.to_csv}
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item       = Item.new
    @categories = Category.all
    @subcat1s   = Subcat1.all
    @subcat2s   = Subcat2.all
  end

  def update_subcat1
    category = Category.find(params[:category_id])
    @subcat1s = category.subcat1s.map{ |x| [x.name, x.id] }.insert(0, "Select Subcategory 1")
    @subcat2s = category.subcat2s.map{ |y| [y.name, y.id] }.insert(0, "Select Subcategory 2")
  end

  def update_subcat2
    subcat1 = Subcat1.find(params[:subcat1_id])
    @subcat2s = subcat1.subcat2s.map{ |z| [z.name, z.id] }.insert(0, "Select a Subcategory 2")
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @items }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:category, :subcat1, :subcat2, :description, :quantity, :shipping, :storage_loc, :status, :source_id, :photo )
    end
end
