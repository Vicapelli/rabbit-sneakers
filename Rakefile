# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
#=begin require "sneakers/tasks"

#namespace :rabbitmq do
 ##### desc "Setup routing"
  #task :setup do
  #  require "bunny"

    #inicia o bunny
  #  conn = Bunny.new
  #  conn.start

    #abre o canal
  #  ch = conn.create_channel

    #cria o exchange
  #  x = ch.fanout("blog.calculadora")

    #cria a fila
  #  queue = ch.queue("dashboard.somas", durable: true)


  #  queue.bind("blog.calculadora")

   # conn.close
  #end
#end =end

Rails.application.load_tasks
