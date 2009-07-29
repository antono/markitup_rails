puts "\n===> Removing markitup assets..."
FileUtils.rm_rf File.join(RAILS_ROOT, "public/plugin_assets/markitup/"), :verbose => true
puts "\n===> Markitup assets deleted!"
