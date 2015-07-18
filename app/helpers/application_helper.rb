module ApplicationHelper
  def vendor_logged_in?
    !!session[:vendor_id]
  end

  def current_vendor
    return Vendor.find(session[:vendor_id]) if vendor_logged_in?
  end

  def current_vendors_deal?(deal)
    current_vendor == deal.vendor
  end

  def current_vendors_page?(vendor)
    current_vendor == vendor
  end

  def bootstrap_class_for(flash_type)
    { "success"=> "alert-success", "error" => "alert-danger", "alert" => "alert-warning", "notice" => "alert-info" }[flash_type] || flash_type.to_s
  end
end
