facebook = "#{Rails.root}/config/facebook.yml"

if File.exists? facebook
  config = YAML.load_file(facebook)
  config.each {|key, value| ENV[key] || ENV[key] = value.to_s }
end