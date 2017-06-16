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
end