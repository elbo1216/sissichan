class Admin::BookingPolicyController < AdminController
  def index
    @partial='policy'
    if request.post?
      File.open("#{Rails.root}/doc/policy_content.txt", 'w') { |f|
        f.write(params["policy_content"])
      }
    end
    @policy_content = IO.read("#{Rails.root}/doc/policy_content.txt")
  end
end
