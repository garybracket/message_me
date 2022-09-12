namespace :import do
  desc "Import data from spreadsheet"
  task data: :environment do
    puts 'Importing Data'
    data = Roo::Spreadsheet.open('lib/data.xlsx') # opens the spreadsheet
    headers = data.row(1) # get header row
    data.each_with_index do |row, idx|
        next if idx == 0 # skip header row
        # create hash from headers and cells
        subject_data = Hash[[headers, row].transpose]
        # next if user exists
        if Subject.exists?(name: subject_data['name'])
          puts "User with email #{subject_data['name']} already exists"
          next
        end
        subject = Subject.new(subject_data)
        puts "Saving Subject with name: '#{subject.name}'"
        subject.save!
      end
    end
  end
