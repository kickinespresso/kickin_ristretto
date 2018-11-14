# frozen_string_literal: true

require 'kickin_ristretto/version'
require 'prawn'
require 'prawn/table'
#require 'prawn-table'

module KickinRistretto
  if defined?(Rails)
    ROOT_PATH = File.expand_path '../../', __FILE__
    module ::Rails
      class Application
        rake_tasks do
          Dir[File.join(ROOT_PATH, '/lib/tasks/', '**/*.rake')].each do |file|
            load file
          end
        end
      end
    end
  end

  # Search through all images in the project and check to see if they are referenced somewhere
  # If they are not referenced, prompt to delete them
  def clean_non_referenced_images(image_directory = 'app/assets/images')
    images = search_directory(image_directory)
    legacy_images = collect_none_referenced_images(images)
    puts "\n Delete Non Referenced Images? [Y/N]"
    answer = STDIN.gets.chomp
    if answer == 'Y'
      delete_files(legacy_images)
    elsif answer == 'N'
      puts 'Exiting'
      return false # Abort the rake task
    end
  end


  # Produce a PDF report listing all the images in the website
  def image_audit_report(image_directory = 'app/assets/images')
    images = search_directory(image_directory)
    #filtered_images = get_all_images_by_type(images)['.gif', '.png', '.jpg', '.jpeg', '.JPG', '.JPEG']
    filtered_images = get_all_images_by_type(images).values_at('.png', '.jpg', '.jpeg', '.JPG', '.JPEG').flatten
    filtered_images = filtered_images.reject { |v| v.nil? }

    Prawn::Document.generate("image_audit_report.pdf") do
      text "Image Audit Report"

      # data = [["File Path", "Image"]]
      # filtered_images.each do |image|
      #   data += [[image, {image: image, :fit => [400, 400]}]]
      # end
      # table(data, :header => true)

      filtered_images.each do |image|
        text image
        image image, fit: [400, 400]
      end

    end
  end

  # Search the Directories for images
  # Returns a list of files with fullpath
  def search_directory(image_directory = 'app/assets/images')
    image_directory_regex = "#{image_directory}/**/*"
    Dir[image_directory_regex].select{ |e| File.file? e }
  end

  # Returns a list of images with paths that are not referenced in the rails project
  def collect_none_referenced_images(images)
    legacy_images = []
    images.each do |image|
      filename = File.basename(image)
      result = system("grep -r '#{filename}' ./app")
      legacy_images << image if result == false
    end
    legacy_images
  end

  # Deletes each of the files
  def delete_files(image_files)
    #image_files.each { |image_file| puts "Deleting #{image_file}" }
    image_files.each {|image_file| File.delete(image_file) if File.exist?(image_file)}
  end

  def get_all_images_by_type(files)
    files.group_by{ |f| File.extname(f) }
  end


end
