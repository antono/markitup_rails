puts "\n===> Copying files..."
src = File.join(File.dirname(__FILE__), 'assets/*')
dst = File.join(RAILS_ROOT, "public/plugin_assets/markitup/")
FileUtils.mkdir_p dst
FileUtils.cp_r(src, dst, :verbose => true)
puts "\n===> Files copied - Installation complete!"
