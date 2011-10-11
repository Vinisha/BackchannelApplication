class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
    before_filter :checking, :except=>:find
      def index
    #puts "in index(posts)"


   @unity=User.find_by_Unity_ID(session[:Unity_ID])
   puts @unity.Name
   puts @unity.created_at
    puts @unity.created_at.yday
    #@time1=Time.new(@unity.created_at)
    #puts @time1.yday
    @posts = Post.all
     #puts "**************************creating the metrics for the list of posts**************************"
    @time1=Time.now.yday
    #puts "todays day"
    #puts @time1
    @Weight=Array.new
    @value_per_day=1
    @value_of_vote=1
    @total_points=180

    @posts.each do |post|
        #puts post.Unity_ID
        @time2=post.created_at.yday
        #puts "created day"
        #puts @time2
        @days=@time1 - @time2
        #puts "days:"
        #puts @days
        #if(@days>=60 || (@days>=30 && post.Votes==0))
         # @metric=0
        #else
        #@metric=post.Votes + @days + 10 +post.id
         @metric=(post.Votes * @value_of_vote) + (@total_points - (@days * @value_per_day)) + post.id
         #puts @metric
         @Weight<<[@metric,post.id]

        #end
      #puts "***********************************end of calculating metrics*********************************"
    end

    #puts "****************** printing the metrics array****************************************88"
    #puts @Weight
    @met=Array.new
    @met=@Weight.sort
    #puts @met
    @posts_send=Array.new
    @met.each do |met|
      @posts_send<<Post.find_by_id(met[1])
      #puts @Weight[y]
      #@posts.each do |post|
       # if(post.id==@Weight[y])
        #  puts "********************8in checking***********************"
         # puts post.id
          #@posts_send << post

        #end

      #end
    end

    #puts params["Search"]
    #puts params["text"]
    #if(params["Search"]=="name" || params["Search"]=="post")
     # @posts_send = find
    #end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts_send }
    end
   end



  def find
    #puts "in find"
    @posts=Post.all
    @posts_send=Array.new
    if(params["Search"]=="name")
      @posts.each do |post|
        #puts post.Unity_ID
        if(post.Unity_ID==params["text"])
           @posts_send<<post
        end
      end

    elsif(params["Search"]=="post")
      #puts "in else if"
      @x=/\w*#{params["text"]}\w*/
      @posts.each do |post|
         if(@x.match(post.Content))
           #puts post.Unity_ID
           @posts_send<<post
         end
      end

    else
      #puts "in else of search"
      @posts.each do |post|
        @posts_send<<post
      end
    end
    respond_to do |format|
      format.html # find.html.erb
      format.json { render json: @posts_send }
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])    #getting the post_id and storing in session variable
    #puts "In the show method of posts controller, showing post id"
    session[:post_id]=params[:id]
    #puts session[:post_id]

    @post_record = Post.find_by_id(session[:post_id])
      session[:subject]= @post_record.Subject

      @reply= Reply.find_all_by_Post_ID(session[:post_id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    puts "in and before destroy"
    #puts Post.count
    @post = Post.find(params[:id])
    @post.destroy
    #puts "after destroying"
    #puts Post.count
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
