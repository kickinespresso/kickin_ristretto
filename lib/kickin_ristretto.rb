# frozen_string_literal: true

require 'kickin_ristretto/version'

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

  # Search the Directories 
  def search_directory(image_directory = 'app/assets/images')
    image_directory_regex = "#{image_directory}/**/*"
    images = Dir[image_directory_regex].select{ |e| File.file? e }
    legacy_images = collect_none_referenced_images(images)
    puts "\n Is this what you want to happen? [Y/N]"
    answer = STDIN.gets.chomp
    if answer == 'Y'
      delete_files(legacy_images)
    elsif answer == 'N'
      puts 'Exiting'
      return false # Abort the rake task
    end
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
    image_files.each { |image_file| puts "Deleting #{image_file}" }
    #image_files.each {|image_file| File.delete(image_file) if File.exist?(image_file)}
  end

end
