@students = []

def input_students
  puts "Please enter the name of the student, or hit return twice to finish"
  name = gets.chomp
  while !name.empty? do
  puts "What cohort is the student a member of?"
  cohort = gets.chomp
    while true
      months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""]
        if months.include?(cohort)
          break
        else
          puts "Please enter the cohort month again"
          cohort = gets.chomp
        end
    end
    if cohort == ""
    cohort = "October"
    end
    puts "Please enter the student's hobby"
    hobby = gets.chomp
    puts "Please enter the student's country of birth"
    country = gets.chomp
    puts "Please enter the student's height in cm"
    height = gets.chomp
      @students << {name: name, cohort: cohort, hobbies: hobby, country_of_birth: country, height: height}
      puts "Now we have #{@students.count} students"
      puts "Please enter the name of the next student, or hit return to finish"
      name = gets.chomp
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.cvs"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
    when "3"
      save_students
  when "9"
    exit
  else
    puts "I don't know what you meant. Try again"
  end
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
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
      puts ("Favourite hobby:").ljust(linewidth/2) + ("#{student[:hobbies]}").rjust(linewidth/2)
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
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country_of_birth], student[:height]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end


def show_students
  print_header
  print_student_list
  print_footer
end



interactive_menu
