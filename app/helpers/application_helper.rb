module ApplicationHelper
  def body_id
   "#{params[:controller]}_#{params[:action]}"
  end
end
