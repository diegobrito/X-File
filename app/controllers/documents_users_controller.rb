class DocumentsUsersController < ApplicationController
  # GET /documents_users
  # GET /documents_users.xml
  def index
    @documents_users = DocumentsUser.paginate :page => params[:page], :per_page => 11, :order => 'created_at DESC'
    @user = User.all
  end


  # GET /documents_users/1
  # GET /documents_users/1.xml
  def show
    @documents_user = DocumentsUser.find_by_document_id_and_user_id(params[:document_id], params[:user_id])
  end

  # GET /documents_users/new
  # GET /documents_users/new.xml
  def new
    @documents_user = DocumentsUser.new
  end

  # GET /documents_users/1/edit
  def edit
    @documents_user = DocumentsUser.find(params[:id])
  end

  # POST /documents_users
  # POST /documents_users.xml
  def create
    @documents_user = DocumentsUser.new params[:documents_user]

    respond_to do |format|
      if @documents_user.save
        flash.now[:notice] = 'Compartilhamento de documento realizado com sucesso.'
        format.html { redirect_to documents_users_path }
        format.xml  { render :xml => @documents_user, :status => :created, :location => @documents_user }
      else
        format.html { render :template => "documents_users/new"
        }
        format.xml  { render :xml => @documents_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents_users/1
  # PUT /documents_users/1.xml
  def update
    @documents_user = DocumentsUser.find(params[:id])

    respond_to do |format|
      if @documents_user.update_attributes(params[:documents_user])
        flash[:notice] = 'DocumentsUser was successfully updated.'
        format.html { redirect_to(@documents_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documents_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents_users/1
  # DELETE /documents_users/1.xml
  def destroy
    user = User.find(params[:user_id])
    user.documents.delete(Document.find(params[:document_id]))

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
    
end
