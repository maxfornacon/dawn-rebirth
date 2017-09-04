module ApplicationHelper
	def active_page(active_page)
    @active == active_page ? "active" : ""
  end
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def role(id)
    if @guild.guildtype == "Shinobigilde"
      if id == 11
        @role = "Genin"
      elsif id == 12
        @role = "Chūnin"
      elsif id == 13
        @role = "Jōnin"
      elsif id == 14
        @role = "Kage"
      elsif id == 15
        @role = "Anbu"
      end
    end
    if @guild.guildtype == "Magiergilde"
      if id == 11
        @role = "Magier"
      elsif id == 12
        @role = "S-Rang-Magier"
      elsif id == 13
        @role = "Meister"
      end
    end
  end

  def print_rolenumber(guildtype, number)
    if guildtype == "Shinobigilde"
      if number == 1
        @roleid = 11
      elsif number == 2
        @roleid = 12
      elsif number == 3
        @roleid = 13
      elsif number == 4
        @roleid = 14
      elsif number == 5
        @roleid = 15
      end
    end
    if guildtype == "Magiergilde"
      if number == 1
        @roleid = 11
      elsif number == 2
        @roleid = 12
      elsif number == 3
        @roleid = 13
      end
    end
  end

  def resource_name
    :user
  end

  def resource_class 
     User 
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def online_status(user)
    content_tag :span, "", class: "user-#{user.id} online_status #{'online' if user.online?}"
  end

  def redis
    Redis.new
  end

  def listOutput(list)
    listLength = redis.llen(list)
    @arr = []
    for i in 0..listLength - 1
      #p redis.lindex("online_list", i)
      @user = User.find(redis.lindex("online_list", i))
      @arr << @user.name
    end
    return @arr
  end
  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end
end