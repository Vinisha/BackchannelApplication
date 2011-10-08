class LikesforrepliesController < ApplicationController
  # GET /likesforreplies
  # GET /likesforreplies.json
  def index
    @likesforreplies = Likesforreply.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @likesforreplies }
    end
  end

  # GET /likesforreplies/1
  # GET /likesforreplies/1.json
  def show
    @likesforreply = Likesforreply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @likesforreply }
    end
  end

  # GET /likesforreplies/new
  # GET /likesforreplies/new.json
  def new
    #puts "***********************************************************************************printing params[:idmine]"
    #puts params[:idmine]
    @idmine=params[:idmine]
    #puts session[:post_id]
    @reply=Array.new
    #@final=Array.new


    @reply=Reply.find_all_by_Post_ID(session[:post_id])
    #puts @reply.count
    @reply.each do |reply|
      #puts "in reply"
      #puts reply.Reply_number
      @re=reply.Reply_number
      #puts @idmine
     if(reply.Reply_number.to_s==params[:idmine])

        #puts "in if of reply"
        @postid=reply.Post_ID
        @replyid=reply.Reply_number
        #puts @replyid
        @final=reply.No_of_likes+1
         #reply.save!
      end
    end
    #puts "out of if"
    #puts @postid
    #puts @replyid
    #puts @final





   #save the record in the Likesforreply table
   @likes_replies_new = Likesforreply.new
   @likes_replies_new.liked_by = session[:Unity_ID]
    #puts "after saving unity id"
   @likes_replies_new.post_id = session[:post_id]
    #puts "after saving post id"
   @likes_replies_new.reply_id = params[:idmine]
    #puts "after saving reply id"
   @likes_replies_new.save()
       #puts "after saving"
    #@var_reply= Reply.all
    #@var_reply.each do |reply|
     # if(reply.Post_ID=@post_record.id && reply.Reply_number=@reply_record.id)
      #   @num_likes = reply
      #end
    #end
    #puts "Printing the number of likes"
    #puts @num_likes.No_of_likes

    #increamenting number of likes in reply table
    @re=Reply.find_all_by_Post_ID(session[:post_id])
    p @re.count
    @re.each do |reply|
      #puts "in reply"
      if(reply.Reply_number.to_s==params[:idmine])
        reply.No_of_likes=@final
        reply.save!
      end
     end


    #@likes_number = @reply.No_of_likes+1
    #@reply.No_of_likes = @likes_number
    #@reply.save!

       respond_to do |format|
      format.html{redirect_to :controller=>"posts", :action=>"show", :id=>session[:post_id]} # new.html.erb
      format.json { render json: @likesforreply }

    end



  end

  # GET /likesforreplies/1/edit
  def edit
    @likesforreply = Likesforreply.find(params[:id])
  end

  # POST /likesforreplies
  # POST /likesforreplies.json
  def create
    @likesforreply = Likesforreply.new(params[:likesforreply])

    respond_to do |format|
      if @likesforreply.save
        format.html { redirect_to @likesforreply, notice: 'Likesforreply was successfully created.' }
        format.json { render json: @likesforreply, status: :created, location: @likesforreply }
      else
        format.html { render action: "new" }
        format.json { render json: @likesforreply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /likesforreplies/1
  # PUT /likesforreplies/1.json
  def update
    @likesforreply = Likesforreply.find(params[:id])

    respond_to do |format|
      if @likesforreply.update_attributes(params[:likesforreply])
        format.html { redirect_to @likesforreply, notice: 'Likesforreply was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @likesforreply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likesforreplies/1
  # DELETE /likesforreplies/1.json
  def destroy
    @likesforreply = Likesforreply.find(params[:id])
    @likesforreply.destroy

    respond_to do |format|
      format.html { redirect_to likesforreplies_url }
      format.json { head :ok }
    end
  end

  def check
         @flag="false"
         authorFlag = "false"
         likeFlag = "false"
         @like_reply=Likesforreply.find_all_by_reply_id(params[:idmine])

         #coding for liking the reply by author
         @unity=Reply.find_all_by_Post_ID(session[:post_id])
         @unity.each do |unity|
            if(unity.Reply_number.to_s == params[:idmine] && unity.Unity_ID == session[:Unity_ID])
              authorFlag = "true"
            end
         end

         @like_reply.each do |like_reply|
           #puts like_reply.liked_by
           #puts like_reply.post_id
            if((like_reply.liked_by.to_s == session[:Unity_ID].to_s) && (like_reply.post_id.to_s == session[:post_id].to_s))
              #puts "likeflag changing"
              likeFlag = "true"
            end
        end

        p "author flag #{authorFlag}"
        p "like flag #{likeFlag}"
        if((authorFlag == "true") || (likeFlag == "true"))
            respond_to do |format|
                format.html{redirect_to :controller=>"posts", :action => "show", :id=>session[:post_id]} # new.html.erb
                format.json { render json: @likesforreply }
                flash[:notice]="Cannot vote/like"
            end
        else
          #puts "you can vote"
          new
        end
  end

end