require 'kickin_ristretto'
include KickinRistretto
namespace :kickin_ristretto do
  desc "Search for non-referenced images in the project"
  task :search_images do
    puts "Performing Search"
    KickinRistretto.clean_non_referenced_images
    puts "Completed Search"
  end

  desc "Generate Image Audit Report"
  task :image_audit_report do
    puts "Performing Image Audit Report"
    KickinRistretto.image_audit_report
    puts "Completed Image Audit Report"
  end

end
