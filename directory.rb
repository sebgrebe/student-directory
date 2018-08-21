#Asking user for student names and cohort

def input_students
  students = []
  name = input_name()
  while !name.empty? do
    cohort = input_cohort
    if cohort.empty?
      #set November as default cohort
      students << {name: name.to_sym, cohort: "November"}
    else
      students << {name: name.to_sym, cohort: cohort.to_sym}
    end
    name = input_name()
  end
  students
end

def input_name
  puts "Enter the name of the student (hit return twice to finish)"
  name = gets.chomp
end

def input_cohort
  puts "Enter the name of the cohort"
  cohort = gets.chomp
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

students = input_students
# students = students_fixed

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
