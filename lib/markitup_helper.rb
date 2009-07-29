module MarkitupHelper
  MARKITUP_ASSETS_BASE = '/plugin_assets/markitup'
  def include_markitup_assets(options = {})
    options[:sets] ||= 'default'
    options[:skin] ||= 'markitup'
    html = []
    html << javascript_include_tag File.join(MARKITUP_ASSETS_BASE, 'jquery.markitup.pack.js') 
    html << javascript_include_tag File.join(MARKITUP_ASSETS_BASE, 'sets', options[:sets].to_s, 'set.js')
    html << stylesheet_link_tag File.join(MARKITUP_ASSETS_BASE, 'skins', options[:skin].to_s, 'style.css')
    html << stylesheet_link_tag File.join(MARKITUP_ASSETS_BASE, 'sets', options[:sets].to_s, 'style.css')
    html.join("\n")
  end

  def init_markitup_for(css3_selector)
    javascript_tag "$(document).ready(function() { $(\"#{css3_selector}\").markItUp(mySettings); });"
  end
end
