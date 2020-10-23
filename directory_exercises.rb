@students = []
require "csv"

def adding_students(name, cohort, hobby, country, height)
  @students << {name: name, cohort: cohort.to_sym, hobby: hobby, country_of_birth: country, height: height}
end

def input_students
  puts "Please enter the name of the student, or hit return twice to finish"
  name = STDIN.gets.chomp
  while !name.empty? do
  cohort = cohort_month
  puts "Please enter the student's hobby"
  hobby = STDIN.gets.chomp
  puts "Please enter the student's country of birth"
  country = STDIN.gets.chomp
  puts "Please enter the student's height in cm"
  height = STDIN.gets.chomp
    adding_students(name, cohort, hobby, country, height)
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the next student, or hit return to finish"
    name = STDIN.gets.chomp
  end
end

def cohort_month
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  puts "What cohort is the student a member of?"
  cohort = STDIN.gets.chomp
  while true
    if months.include?(cohort)
      break
    elsif cohort == ""
      cohort = "October"
      break
    else
      puts "Please enter the cohort month again"
      cohort = STDIN.gets.chomp
    end
  end
  cohort
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      puts "You selected: Input the students"
    input_students
    when "2"
      puts "You selected: Show the students"
    show_students
    when "3"
      puts "You selected: Save the list"
      save_students
    when "4"
      puts "You selected: Load the list from file"
      load_students
    when "9"
      puts "You selected: Exit. Goodbye!"
      sleep 1
    exit
    else
    puts "I don't know what you meant. Try again"
  end
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_header
    linewidth = 60
    puts (("The students of Villains Academy").center linewidth)
    puts (("-------------").center linewidth)
end

def print_student_list
  linewidth = 60
    @students.each do |student|
      puts ("#{student[:name]}:").ljust(linewidth/2) + ("(#{student[:cohort]} cohort)").rjust(linewidth/2)
      puts ("Favourite hobby:").ljust(linewidth/2) + ("#{student[:hobby]}").rjust(linewidth/2)
      puts ("Country of birth: ").ljust(linewidth/2) + ("#{student[:country_of_birth]}").rjust(linewidth/2)
      puts ("Student's Height: ").ljust(linewidth/2) + ("#{student[:height]}").rjust(linewidth/2)
      puts "------------------------------------------------------------"
    end
end


def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  puts "Please specify the name of the file you are saving"
  filename = STDIN.gets.gsub(/\s+/, "")  + ".csv"
  CSV.open(filename, "w") do |f|
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:hobby], student[:country_of_birth], student[:height]]
      f << student_data
      end
  end
end

def load_students(filename = "students.csv")
  puts "Please type the name of the file you would like to load."
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    CSV.foreach(filename, "r") do |row|
      name, cohort, hobby, country_of_birth, height = row
      adding_students(name, cohort, hobby, country_of_birth, height)
    end
  else
    puts "This filename does not exist"
  end
end



def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


def show_students
  print_header
  print_student_list
  print_footer
end

try_load_students
interactive_menu