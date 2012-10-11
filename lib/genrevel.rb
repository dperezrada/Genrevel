# require "genrevel/version"
require 'rubygems'
require 'thor'

module GenRevel
	class Base < Thor
		include Thor::Actions
		GenRevel::Base.source_root(
			File.expand_path(File.join(File.dirname(__FILE__), "..", "data"))
		)

		desc "hidden TYPE", "this is hidden", :hide => true
		def get_source(path)
			File.expand_path(File.join(File.dirname(__FILE__), "..", "data", path))
		end
		
		desc "create", "Create new revel template"
		argument :name
		def create
			directory "reveljs_raw", name
			empty_directory File.join(name, "slides")
			copy_file "templates/title_subtitle.html", File.join(name, "slides", "1_.html")
		end

		desc "add", "Add a new slide to the presentation"
		argument :name
		def add
			source = "templates/title_subtitle.html"
			context = instance_eval('binding')
			template = ERB.new(::File.binread(get_source(source)), nil, '-', '@output_buffer').result(context)
			puts template
			insert_into_file "#{name}/index.html", template, :before => "			</div><!-- Finish slides -->"
		end
	end
end


# module Backbone
#   class New < Thor::Group
#     desc "Create new Backbone project"
#     include Thor::Actions

#     argument :name

#     def self.source_root
#       File.dirname(__FILE__)
#     end

#     def copy_base_struture
#       directory 'generators/base', name
#     end
#   end

#   class Generate < Thor
#     include Thor::Actions

#     def self.source_root
#       File.dirname(__FILE__)
#     end

#     desc "model DOMAIN NAME", "Creates a new model"
#     def model(domain, name)
#       source = "generators/models/base.js"
#       context = instance_eval('binding')
#       template = ERB.new(::File.binread(source), nil, '-', '@output_buffer').result(context)
#       insert_into_file "#{domain}/js/main.js", template, :before => "\n// Collections"
#     end

#     desc "collection DOMAIN NAME MODEL", "Creates a new collection"
#     def collection(domain, name, model)
#       source = "generators/collections/base.js"
#       context = instance_eval('binding')
#       template = ERB.new(::File.binread(source), nil, '-', '@output_buffer').result(context)
#       insert_into_file "#{domain}/js/main.js", template, :before => "\n// Views"
#     end
#   end
# end