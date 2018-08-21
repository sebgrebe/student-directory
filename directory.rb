#Asking user for student names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: "November"}
    name = gets.chomp
  end
  students
end

#fixed set of students
students_fixed = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

# students = input_students
students = students_fixed

#methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#center student name
def print(students)
  students.each do |student|
    puts "#{student[:name]}, #{student[:cohort]} cohort".center(45)
  end
end
def print_footer(names)
  puts "Overall we have #{names.count} great students".center(45)
end
#call methods
print_header
print(students)
print_footer(students)
