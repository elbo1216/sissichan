class Admin::AboutController < AdminController
  def index
    @partial='about'
    if request.post?
      File.open("#{Rails.root}/doc/about_content.txt", 'w') { |f|
        f.write(params["about_content"])
      }
    end
    @about_content = IO.read("#{Rails.root}/doc/about_content.txt")
  end
end
