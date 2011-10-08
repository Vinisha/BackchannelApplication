class LikesController < ApplicationController
  # GET /likes
  # GET /likes.json

  def index
    @likes = Like.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @likes }
    end
  end



  # GET /likes/1
  # GET /likes/1.json
  def show
    @like = Like.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @like }
    end
  end

  # GET /likes/new
  # GET /likes/new.json
  def new

    # getting postID
    #puts "In the new method of like controller, showing post id"
    #puts session[:post_id]
    #puts "Printing the unity_id of the user who is liking the post"
    #puts session[:Unity_ID]
    #puts "Printing the unity_id of the user who posted this question/post"
    @post_record = Post.find_by_id(session[:post_id])
    #puts @post_record.Unity_ID

    if(session[:Unity_ID]!= @post_record.Unity_ID)
     @likes_new = Like.new
     @likes_new.Unity_ID= session[:Unity_ID]
     @likes_new.Post_ID= session[:post_id]
     @likes_new.save!

     #Adding this like to the number of votes
     @number_of_likes=@post_record.Votes + 1
     #puts "Number of existing likes:"
     #puts @number_of_likes
     @post_record.Votes=@number_of_likes
     @post_record.save!

     respond_to do |format|
      format.html {redirect_to @post_record}# new.html.erb
      format.json { render json: @like }
      end
    else

      redirect_to(:controller=>"posts",:action=>"show", :id=>session[:post_id])

      flash[:notice]= "Cannot like your own post"
    end
  end


  # GET /likes/1/edit
  def edit
    @like = Like.find(params[:id])
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(params[:like])

    respond_to do |format|
      if @like.save
        format.html { redirect_to @like, notice: 'Like was successfully created.' }
        format.json { render json: @like, status: :created, location: @like }
      else
        format.html { render action: "new" }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /likes/1
  # PUT /likes/1.json
  def update
    @like = Like.find(params[:id])

    respond_to do |format|
      if @like.update_attributes(params[:like])
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.html { redirect_to likes_url }
      format.json { head :ok }
    end
  end

  def vote_check
             @flag="false"
             @like=Array.new
             authorFlag = "false"
             likeFlag = "false"
             #puts "in vote check"
             @like=Like.find_all_by_Post_ID(session[:post_id])
             #puts "count value:"
             #puts @like.count

             #coding for liking the reply by author
             @unity=Post.find_by_id(session[:post_id])
              if(@unity.Unity_ID.to_s == session[:Unity_ID].to_s)
                  authorFlag = "true"
                end

             @like.each do |like|
               #puts like.Post_ID
               #puts like.Unity_ID
               if(like.Unity_ID.to_s == session[:Unity_ID].to_s)
                  #puts "likeflag changing"
                  likeFlag = "true"
                end
            end

            p "author flag #{authorFlag}"
            p "like flag #{likeFlag}"
            if((authorFlag == "true") || (likeFlag == "true"))
                respond_to do |format|
                    format.html{redirect_to :controller=>"posts", :action => "show", :id=>session[:post_id]} # new.html.erb
                    format.json { render json: @likes }
                    flash[:notice]="Cannot vote/like"
                end
            else
              #puts "you can vote"
              new
            end
      end
 end
