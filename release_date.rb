require 'date'
require 'fileutils'

# Define the directory to search
docs_directory = 'docs'

# Define the time period for new releases (2 months)
release_threshold = Date.today - 2.months

# Function to check if a file is a release note file
def is_release_note_file?(file)
  file.end_with?('.md') || file.end_with?('.txt')
end

# Function to get the release date from a release note file
def get_release_date(file)
  # You'll need to implement logic to extract the release date from the file content
  # This will depend on the format of your release notes.
  # For example, if the file name is in the format "release-notes-YYYY-MM-DD.md"
  # you can use:
  #   File.basename(file, File.extname(file)).split('-').last
  # And then parse it into a Date object.
  #
  # Replace this placeholder with your actual logic.
  Date.parse('2023-10-26') # Placeholder, replace with your logic
end

# Iterate through each product directory
Dir.glob("#{docs_directory}/*") do |product_directory|
  # Check if the directory has a rel_notes directory
  rel_notes_directory = File.join(product_directory, 'rel_notes')
  if File.directory?(rel_notes_directory)
    # Iterate through each file in the rel_notes directory
    Dir.glob("#{rel_notes_directory}/*") do |release_note_file|
      # Check if the file is a release note file
      if is_release_note_file?(release_note_file)
        # Get the release date from the file
        release_date = get_release_date(release_note_file)
        # Check if the release date is within the last 2 months
        if release_date >= release_threshold
          # Print the product name and release date
          puts "Product: #{File.basename(product_directory)}, Release Date: #{release_date}"
        end
      end
    end
  end
end
