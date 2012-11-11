class Admin::ContactsController < AdminController
  def index 
    redirect_to '/admin/contacts/search'
  end

  def search
    @partial = 'search'
    @results = []
    if request.post?
      @email = params['email']
      @requested_start = params['requested_start']
      @requested_end = params['requested_end']
      conditions = ["1=1"]
      conditions << "email = '#{params['email']}'" unless @email.blank?
      conditions << "created_at >= '#{@requested_start}'" unless @requested_start.blank?
      conditions << "created_at <= '#{@requested_end}'" unless @requested_end.blank?

      @results = Contact.find(:all, :conditions => conditions.join(' and '), :order => 'created_at desc')
    end
    render :index
  end

  def away
    @partial = 'away'
    if request.post?
      File.open("#{Rails.root}/doc/away_notice.doc", 'w') { |f|
        f.write(params["away_notice"])
      }

      if params['trigger_away'] == 'true'
        FileUtils.touch("#{Rails.root}/config/features/away")
      else
        FileUtils.rm("#{Rails.root}/config/features/away")
      end
    end
    @away_message = IO.read("#{Rails.root}/doc/away_notice.doc")
    @away = File.exists?("#{Rails.root}/config/features/away")

    render :index
  end

  def chart
    @partial = 'chart'
    @option_list = []
    @year = params[:year] || Time.now.strftime('%Y')
    Contact.find_by_sql("select distinct year(created_at) as year from contacts;").each do |c|
      selected = "selected" if @year.to_i == c.year
      @option_list << "<option value='#{c.year}' #{selected}>#{c.year}</option>"
    end
    @data = Contact.find(:all, :conditions => ["year(created_at) = #{@year}"]).inject({}) { |results, contact| 
      results[contact.created_at.strftime('%m-%Y')] = 0 unless results[contact.created_at.strftime('%m-%Y')]
      results[contact.created_at.strftime('%m-%Y')] += 1
      results
    } 
    render :index
  end
end
