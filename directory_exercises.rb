def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort), Favourite hobby: #{student[:hobbies]}, 
        Country of birth: #{student[:country_of_birth]}, Student's Height: #{student[:height]}"
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