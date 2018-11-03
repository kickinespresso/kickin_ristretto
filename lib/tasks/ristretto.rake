require 'kickin_ristretto'
include KickinRistretto
namespace :kickin_ristretto do
  desc "Perform Used Analysis "
  task :analyze do
    puts "do the analysis"
    KickinRistretto.search_directory
  end
end
