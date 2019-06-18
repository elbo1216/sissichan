class Admin::PressController < AdminController
  def index
    redirect_to "/admin/press/manage"
  end

  def manage
    @partial = 'manage'
    pr = PressRelease.where('position is not null').order(:position)
    @active = pr.inject({}) { |ret, i| 
      ret[i.position] = i
      ret
    }
    @inactive = PressRelease.where('position is null').order(:created_at)
    render "index"
  end

  def add
    @partial = 'add'
    pr = PressRelease.new
    pr.upload_file(params['image'])
    pr.url = params['url']
    pr.save!
    redirect_to "/admin/press/manage"
  end

  def update_positions
    ret = 'Success'
    json = params['data']
    begin
      PressRelease.clear_all_positions
      json.each do |index, entry|
        pr = PressRelease.find(entry[0].to_i)
        if pr && pr.position != entry[1].to_i
          pr.position = entry[1].to_i
          pr.save!
        end
      end
    rescue Exception => e
      logger.error e.message
      ret = 'Failure'
    end

    render :text => ret
  end

  def update_url
    ret = 'Success'
    begin
      pr = PressRelease.find(params['id'])
      pr.url = params['url']
      pr.save!
    rescue Exception => e
      logger.error e.message
      ret = 'Failure'
    end

    render :text => ret
  end
end
