class LoginsController < ApplicationController
  # GET /logins
  # GET /logins.json
  def index
    @logins = Login.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logins }
    end
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
    @login = Login.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @login }
    end
  end

  # GET /logins/new
  # GET /logins/new.json
  def new
    @login = Login.new
     #puts "in new(login)"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @login }
    end
  end

  # GET /logins/1/edit
  def edit
    @login = Login.find(params[:id])
  end

  # POST /logins
  # POST /logins.json
  def create
    session[:findflag]=0
    @uname = User.find_by_Unity_ID(params[:user])
    if(@uname==nil)

      #puts "no username exists"
      respond_to do |format|
              flash[:notice]="Invalid Username and Password"
             format.html{redirect_to :controller=>"logins", :action => "new"} #new.html.erb
             format.json { render json: @logins }

           end

    elsif(@uname.Password==params[:pass])
       session[:Unity_ID]=params[:user]
       #puts "they are equal"
       #format.html { redirect_to logins_new, notice:'Login failed' }
       respond_to do |format|
        format.html {redirect_to(:controller =>"posts",:action => "index")}
        format.json {render json: @logins}

       end

    else
       #puts "in else of logins"
       session[:check]=1
       respond_to do |format|
       flash[:notice]="Invalid Username and Password"
       format.html{redirect_to :controller=>"logins", :action => "new"} #new.html.erb
       format.json { render json: @logins }
       #flash[:notice]="Invalid Username and Password"
     end
     end
    puts params[:user]
    puts params[:pass]
    #puts "in create"
  end

  # PUT /logins/1
  # PUT /logins/1.json
  def update
    #puts "in update"
    @login = Login.find(params[:id])

    respond_to do |format|
      if @login.update_attributes(params[:login])
        format.html { redirect_to @login, notice: 'Login was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @login = Login.find(params[:id])
    @login.destroy

    respond_to do |format|
      format.html { redirect_to logins_url }
      format.json { head :ok }
    end
  end

  def logout
    #puts "in logout"
    session[:Unity_ID]=nil
    session[:post_id]=nil
    session[:findflag]=0
    redirect_to(:controller =>"logins",:action => "new")
  end
end

