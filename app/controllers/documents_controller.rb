class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  load_and_authorize_resource  
  
  def index
    @user = current_user  
    @documents = Document.page(params[:page]).order('created_at DESC')
    @files_h1 = "All Files"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @documents }
    end
  end

  def my_files
    @documents = current_user.documents
    #@documents = Document.page(params[:page]).order('created_at DESC')
    #@documents = Document.joins("SELECT documents.* FROM documents INNER JOIN documents_users ON documents.id = documents_users.document_id WHERE documents_users.user_id = 1")
    #@documents = Document.joins(:users)
    #@documents = Document.all(:conditions => ["users.id=?", self])
    @user = current_user
    @files_h1 = "My Files"  
    respond_to do |format|
      format.html { render :template => "documents/my_files"}
      format.json { render :json => @documents }
    end
  end
  
  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, :notice => 'Document was successfully created.' }
        format.json { render :json => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to @document, :notice => 'Document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :ok }
    end
  end
end
