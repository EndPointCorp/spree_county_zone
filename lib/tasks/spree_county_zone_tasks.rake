require 'active_record'
require 'roo'

namespace :spree_county_zone do
  desc 'Install counties for US'

  task :load_us  => :environment do |t, args|
    require 'highline/import'
    file_path = File.join(File.dirname(__FILE__), "..", "generators/db_file", "us_county.csv")
    if File.exists?(file_path)
      spreadsheet = Roo::CSV.new(file_path)
      us_country = Spree::Country.find_by(iso: 'US')
      if us_country
        (2..spreadsheet.last_row).each do |i|
          next  unless spreadsheet.row(i)[2] || spreadsheet.row(i)[3]
          state = Spree::State.find_by(country: us_country, abbr: spreadsheet.row(i)[2])
          next unless state
          say(us_country.name + ':' + spreadsheet.row(i)[2] + ':' +  spreadsheet.row(i)[3])
          Spree::County.find_or_create_by(name: spreadsheet.row(i)[3], state_id: state.id)
        end
        say 'Rows loaded: ' +  spreadsheet.last_row.to_s
        say 'Complete'
      else
        say 'Cannot find country US'
        exit(1)
      end
    else
      say "Cannot find or read #{file_path}"
    end
  end

end
