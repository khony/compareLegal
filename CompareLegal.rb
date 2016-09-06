require 'rubygems'
require 'yaml'
require 'pp'
f1 = YAML.load_file(ARGV[0])
f2 = YAML.load_file(ARGV[1])

class CompareLegal
  def self.get_all_keys(object, father = "")
    if object.is_a?(Hash)
      var = []
      object.keys.each do |obj|
        current = ""
        current = father+"." if !father.empty? && father != "en" && father != "pt"
        var += [current+obj] + get_all_keys(object[obj], current+obj)
      end
      var
    else
      []
    end
  end

  def self.compare_yaml_hash(cf1, cf2)
    all_keys_1 = get_all_keys(cf1)
    all_keys_2 = get_all_keys(cf2)
    puts all_keys_1 - all_keys_2

  end

end
CompareLegal.compare_yaml_hash(f1,f2)