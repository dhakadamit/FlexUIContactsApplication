class PeopleController < ApplicationController
  #before_filter :login_required

  def directory
    @people = Person.find_by_first_alphabet(params[:alphabet]).paginate :page => params[:page], :per_page => 20
    respond_to do |format|
      format.html
      format.xml { render :xml => @people.to_xml() }
      format.json { render :json => @people.to_json(:only => [:first_name, :middle_name],
                                                    :include => {
                                                            :contact_detail => {:only => [:area, :city]},
                                                            :businesses => {:only => :name}
                                                    }
      )}
    end
  end

  def search
    @results = Person.find_all_by_query_and_filter(params).paginate :page => params[:page], :per_page => 20

    respond_to do |format|
      format.html
      format.xml { render :xml => @results.to_xml() }
      format.json { render :json => @results.to_json(:only => [:first_name, :middle_name],
                                                     :include => {
                                                             :contact_detail => {:only => [:area, :city]},
                                                             :businesses => {:only => :name}
                                                     }
      )}
    end
  end

  def show
    @person = Person.find_by_id(params[:id])
    @children = @person.children
    respond_to do |format|
      format.html
      format.json {  render :json => @person.to_json(:include => {
              :contact_detail => {:include => :phone_numbers},
              :businesses => {:include => {:contact_detail => {:include => :phone_numbers}}},
              :father => {:only => [:first_name], :methods => {}},
              :mother => {:only => [:first_name], :methods => {}},
              }, :methods => [:children]
      ) }
    end
  end

  def new
    @person = Person.new
    @contact_detail = ContactDetail.new
    @person.businesses.build
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Person successfully created"
          redirect_to :action => :show, :id => @person
        end
        format.json {  render :json => "Person successfully created", :status => 200 }
      end
    else
      respond_to do |format|
        format.html do
          render :action => :new
        end
        format.json {  render :json => "Couldn't create", :status => 500 }
      end

    end
  end

  def edit
    @person = Person.find_by_id(params[:id])
    @contact_detail = @person.contact_detail
  end

  def update
    @person = Person.update(params[:id], params[:person])
    if @person
      redirect_to :action => :show, :id => @person
    else
      render :action => :edit
    end
  end
end
