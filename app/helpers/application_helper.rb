module ApplicationHelper
    
    def full_title(page_title = '')
        base_title = "BedMe"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    
    def current_property
      @current_property ||= Property.find_by(id: params[:property_id])
    end
    
end
