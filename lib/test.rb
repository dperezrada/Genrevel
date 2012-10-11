require 'rubygems'
require 'thor'

class ThorExample < Thor
  desc "start", "start server"
  method_option :environment,:default => "development", :aliases => "-e",
:desc => "which environment you want server run."
  method_option :daemon, :type => :boolean, :default => false, :aliases => "-d",
:desc => "running on daemon mode?"
  def start
    puts "start #{options.inspect}"
  end

  desc "stop" ,"stop server"
  method_option :delay,  :default => 0, :aliases => "-w",
:desc => "wait server finish it's job"
  def stop
    puts "stop"
  end
end

ThorExample.start