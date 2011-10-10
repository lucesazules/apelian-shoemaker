module ApplicationHelper

  # Returns a string concatenating current controller#action
  # @return [String] :controller_:action
  def body_id
    if params[:scope] == "trend"
      "shoes_trend"
    else
      "#{params[:controller]}_#{params[:action]}"
    end
  end

  # Renders link to shoes#index filtering
  # by given heel
  def link_to_heel(heel)

    raise ArgumentError unless Shoe::HEELS.include?(heel)

    text = case heel
      when Shoe::LOW_HEEL
        "TACO BAJO"
      when Shoe::MED_HEEL
        "TACO MEDIO"
      when Shoe::HIGH_HEEL
        "TACO ALTO"
    end


    campaign_name = params[:campaign].blank?? @current_campaign : params[:campaign]
    link_to content_tag( :span, text), shoes_path(:search => { :heel_eq => heel}, :campaign => campaign_name)
  end

  # Returns campaign that is currently beign navigated on webpage
  # @return [String] chosen campaign.
  def navigating_campaign
    params[:campaign].blank?? @current_campaign : params[:campaign]
  end

  # Returns current filtered heel or nil if no heel in filter
  # @return [String] heel
  def current_heel
    return nil if @search.nil?
    @search.search_attributes['heel_equals']
  end

  # Indicates if given heel is currently selected
  # @param [String] heel
  # @return [TrueClass]
  def heel_selected?(heel)
    raise ArgumentError unless Shoe::HEELS.include?(heel)
    heel==current_heel
  end

  # Indicates if we are navigating through
  # trend shoes
  def navigating_trend?
    (body_id == 'shoes_trend') || (params[:scope].to_s == 'trend')
  end

end
