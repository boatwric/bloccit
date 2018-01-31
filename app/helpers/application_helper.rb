#Used across app, anything written here will be available in all views
#http://ruby-doc.org/core-2.2.0/Proc.html
#https://apidock.com/rails/ActionView/Helpers/TagHelper/content_tag


module ApplicationHelper
    
#form_group_tag- First argument is an array of errors, and the second is a block. The & turns the block into a Proc, a block that can be reused like a variable
    
    def form_group_tag(errors, &block)
        css_class = 'form-group'
        css_class << ' has-error' if errors.any?
        #content_tag helper method used to build the HTML and CSS to display the form element and any associated errors
        content_tag :div, capture(&block), class: css_class
      end
end
