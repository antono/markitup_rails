namespace :markitup do

  PLUGIN_ROOT = File.dirname(__FILE__) + '/..'

  STYLESHEETS = Dir[PLUGIN_ROOT + '/assets/stylesheets/*'].select { |e| File.file?(e) }
  JAVASCRIPTS = Dir[PLUGIN_ROOT + '/assets/javascripts/*'].select { |e| File.file?(e) }

  desc "Copies markitups assets (css+js+images) to public dir"
  task :install do
    dest = File.join(RAILS_ROOT, 'public/plugin_assets/markitup')
    FileUtils.mkdir(dest)
    FileUtils.cp .constantize, dest, :verbose => true
    puts "\n==> Markitup assets installed!"
  end

  desc "Updates syntax highlighter assets (css+js) in public dir"
  task :update do
    uninstall
    install
    puts "\n==> Syntax Highlighter assets updated!"
  end

  desc "Deletes syntax highlighter assets (css+js) from public dir"
  task :uninstall do
    %w{javascripts stylesheets}.each do |atype|
      dest = File.join(RAILS_ROOT, 'public', atype, 'sh2')
      FileUtils.rm_rf(dest)
    end
    puts "\n==> Syntax Highlighter assets uninstalled!"
  end

end
