class Stores::ReviewsController < ApplicationController
 def index
   @store = Store.find(params[:store_id])
   @reviews = @store.reveiws.all

  respond_to do |format|
    format.html 
    format.json { render json: @reviews }
  end
 end
 

 def create
   @store = Store.find(params[:store_id])
   @reviews = @store.review.build(params[:review])

   respond_to do |format|
    if @review.save
      format.html { redirect_to [@store, @review], notice: 'レビュー投稿リクエストが完了しました' }
      format.json { render action: "show", status: :created, location: @review }
    else
      format.html { render action: "new" }
      format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

 
 def new
   @store = Store.find(params[:store_id])
   @reviews = @store.reviews.build

   respond_to do |format|
     format.html 
     format.json { render json: @reviews }
    end
  end

 
 def edit
    @store = Store.find(params[:user_id])
    @reviews = @store.reviews.find(params[:id])
 end


 def show
   @store = Store.find(params[:store_id])
   @review = @store.reveiw.all

   respond_to do |format|
     format.html 
     format.json { render json: @reviews }
   end
  end


 def update
   @store = Store.find(params[:store_id])
   @review = @store.reviews.builds(params[:id])
 
   respond_to do |format|
    if @review.update(params[:review])
     format.html { redirect_to [@store, @review], notice: 'レビューの更新が完了しました。' }
　　　format.json { head :no_content }
    else
      format.html { render action: "edit"}
      format.json { render json: @review.errors, status: :unprocessable_entity}
    end
   end
  end 

 def destroy
   @store = Store.find(params[:user_id])
   @review = @store.reviews.build(params[:id])
   @review.destroy

   respond_to_do |format|
     format.html { redirect_to store_reviews_url}
     format.json { head :no_content } 
   end
  end
