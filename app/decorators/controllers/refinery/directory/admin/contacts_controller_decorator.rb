Refinery::Directory::Admin::ContactsController.class_eval do

  before_filter :empty_checkboxes, :only => :update
  protected

  def empty_checkboxes
    params[:contact][:category_ids] ||= []
  end

end
