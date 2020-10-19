def print_header
    linewidth = 60
    puts (("The students of Villains Academy").center linewidth)
    puts (("-------------").center linewidth)
end
def print(students)
  linewidth = 60
    students.each do |student|
        puts ("#{student[:name]}:").ljust(linewidth/2) + ("(#{student[:cohort]} cohort)").rjust(linewidth/2)
        puts ("Favourite hobby:").ljust(linewidth/2) + ("#{student[:hobbies]}").rjust(linewidth/2)
        puts ("Country of birth: ").ljust(linewidth/2) + ("#{student[:country_of_birth]}").rjust(linewidth/2)
        puts ("Student's Height: ").ljust(linewidth/2) + ("#{student[:height]}").rjust(linewidth/2)
        puts "------------------------------------------------------------"
    end
end
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

def input_students
    puts "Please enter the name of the student, or hit return twice to finish"
    students = []
    name = gets.chomp
    while !name.empty? do
    puts "Please enter the student's hobby"
    hobby = gets.chomp
    puts "Please enter the student's country of birth"
    country = gets.chomp
    puts "Please enter the student's height in cm"
    height = gets.chomp
        students << {name: name, cohort: :November, hobbies: hobby, country_of_birth: country, height: height}
        puts "Now we have #{students.count} students"
        puts "Please enter the name of the next student, or hit return to finish"
        name = gets.chomp
    end
    students
end

students = input_students
print_header
print(students)
print_footer(students)