require 'kickin_ristretto'
include KickinRistretto
namespace :kickin_ristretto do
  desc "Perform Used Analysis "
  task :analyze do
    puts "do the analysis"
    KickinRistretto.clean_non_referenced_images
  end


  desc "Image Audit Report"
  task :image_audit_report do
    puts "Performing Image Audit Report"
    KickinRistretto.image_audit_report
    puts "Completed Image Audit Report"
  end

  #image "#{Prawn::DATADIR}/images/pigs.jpg"
end
