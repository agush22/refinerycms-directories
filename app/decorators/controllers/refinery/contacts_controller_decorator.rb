Refinery::ContactsController.class_eval do

  before_filter :update
  protected

  def update
    params[:contact][:category_ids] ||= []
  end

end
