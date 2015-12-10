require 'rfaye'

Rfaye::Conf.load(File.expand_path("../config/rfaye.yml", __FILE__), ENV["RAILS_ENV"] || "development")

run Rfaye.up()