namespace :markitup do

  src = File.join(File.dirname(__FILE__), 'assets/*')
  dst = File.join(RAILS_ROOT, "public/plugin_assets/markitup/")

  desc "Copies markitups assets (css+js+images) to public dir"
  task :install do
    FileUtils.mkdir_p dst
    FileUtils.cp_r(src, dst, :verbose => true)
    puts "\n==> Markitup assets installed!"
  end

  desc "Updates syntax highlighter assets (css+js) in public dir"
  task :update do
    Rake::Task["markitup:uninstall"].invoke
    Rake::Task["markitup:install"].invoke
    puts "\n==> Markitup assets updated!"
  end

  desc "Deletes syntax highlighter assets (css+js) from public dir"
  task :uninstall do
    FileUtils.rm_rf dst, :verbose => true
    puts "\n==> Markitup assets uninstalled!"
  end

end
