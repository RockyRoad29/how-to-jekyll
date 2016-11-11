require 'date'

class JekyllSource
  include Thor::Actions

  attr_accessor :name
  def initialize(title, layout=:post)
    @title = title
    @name = title.downcase.tr(' ', '-')
    @layout = layout
    @date =  Time.now.to_s
    puts "#{@layout} #{@name}: #{@title}"
  end

  def front_matter
    return "
---
title: #{@title}
layout: #{@layout}
categories:
tags:
date: #{Time.now.to_s}
---
"
  end

  def create_draft
    dst = "_drafts/#{@name}.md"
    puts "Creating #{dst}"
    open(dst, 'w') { |f|
      f << self.front_matter
    }
  end
end

class JekyllGenerator < Thor
  include Thor::Actions
  class_option :verbose, :type => :boolean

  def self.source_root
    File.dirname(__FILE__)
  end

  desc "draft", "Create a new draft post"
  #argument :name
  option :layout, :default => :post

  def draft(title)
    src = JekyllSource.new(title, options[:layout])
    # src.create_draft
    dst = "_drafts/#{src.name}.md"
    create_file dst, src.front_matter

    # Can't get the template to work
    # template('templates/draft.tt', dst, src)
  end

  desc "publish", "Publish a draft post"
  def publish(draft)
    # TODO inject current date and move the file
  end
end
