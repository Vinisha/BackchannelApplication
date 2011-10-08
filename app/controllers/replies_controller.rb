class RepliesController < ApplicationController
  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @replies }
    end
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
   #getting the reply id and unity id of the person who likes


   #@likes_replies_new = LikesReplies.new
   #@likes_replies_new.liked_by = session[:Unity_ID]
   #@likes_replies_new.post_id = @reply.Post_ID
   #@likes_replies_new.reply_id = @reply.id
   #@likes_replies_new.save!


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reply }
    end
  end

  # GET /replies/new
  # GET /replies/new.json
  def new
    @reply = Reply.new
    @post_record = Post.find_by_id(session[:post_id])
    #finding the reply id
    #puts "post_id="
    #puts @post_record.id
    @reply_id = Reply.find_all_by_Post_ID(session[:post_id])
    #puts "printing the reply numbers"
    #puts @reply_id.count()
    #session[:reply_number]= @reply_id.count()
    #@reply_num =  session[:reply_number]+1
    #storing final reply_id in session variable
    session[:reply_number] = @reply_id.count() + 1
    #puts session[:reply_number]

   @num_replies=@post_record.No_Replies+1
    #puts "printing the number of replies"
    #puts @num_replies
    @post_record.No_Replies = @num_replies
    @post_record.save!

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = Reply.find(params[:id])
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(params[:reply])

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
        format.json { render json: @reply, status: :created, location: @reply }
      else
        format.html { render action: "new" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /replies/1
  # PUT /replies/1.json
  def update
    @reply = Reply.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to replies_url }
      format.json { head :ok }
    end
  end
end
