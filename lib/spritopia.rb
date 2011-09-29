require "spritopia/version"
require 'chunky_png'
require 'json'

module Spritopia
  extend self
  include ChunkyPNG

  module CLI
    extend self

    def start
      if ARGV.size != 1
        show_usage
        exit -1
      else
        Spritopia.process_file(ARGV.first)
      end
    end


    private

    def show_usage
      puts "usage: #{$0} filename.sprite\n\n" <<
      "\tfilename.sprite should be a file with a list of files, relatives to itself.\n" <<
      "\tThe files should be .png"


    end

  end


  def process_file(file)
    raise "File should be a .sprite file" unless file =~ /\.sprite$/
    basename = File.basename(file, ".sprite")
    dir  = File.dirname(file)
    basefilename = File.join(dir, basename)

    File.file?(file) or raise "The file #{file} did not exists"

    # Get the list of the images

    files = File.read(file).split("\n").map{|f| f.strip}

    # Calculate height and width
    sizes = files.map do |f|
      image = Image.from_file(File.join(dir,f))
      [image.width, image.height]
    end

    height = sizes.inject( 0 ) { |memo,i| memo+i[1] }
    width = sizes.inject( 0 ) { |memo,i| memo > i[0] ? memo : i[0] }


    # Generate the sprite
    canvas = Image.new(width,height)

    file_info = {}

    files.inject(0) { |current_height, filename|
      new_image = Image.from_file(File.join(dir,filename))
      canvas.replace!(new_image, 0, current_height)

      file_info[filename] = {:width => new_image.width, :height => new_image.height, :x => 0, :y => current_height, :x2 => new_image.width, :y2 => new_image.height + current_height }


      current_height + new_image.height
    }

    # Save the sprite

    puts File.basename(file,".sprite")

    canvas.save(basefilename+".png")

    # Save the json

    File.open(basefilename + ".json", "w") do |f|
      f.write file_info.to_json
    end

    true

  end


end
