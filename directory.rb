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
  {name: "Nurse Ratched", cohort: :august},
  {name: "Michael Corleone", cohort: :august},
  {name: "Alex DeLarge", cohort: :april},
  {name: "The Wicked Witch of the West", cohort: :april},
  {name: "Terminator", cohort: :april},
  {name: "Freddy Krueger", cohort: :december},
  {name: "The Joker", cohort: :december},
  {name: "Joffrey Baratheon", cohort: :december},
  {name: "Norman Bates", cohort: :december}
]

# students = input_students
# students = students_fixed
students = [{name: "Norman Bates", cohort: :december}]
#methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#Print students grouped by cohort
def print(students)
  cohorts = Hash.new
  students.each do |student|
    if cohorts[student[:cohort]] == nil
      cohorts[student[:cohort]] = [student[:name]]
    else
      cohort = cohorts[student[:cohort]]
      cohort << student[:name]
      cohorts[student[:cohort]] = cohort
    end
  end
  cohorts.each do |cohort, students|
    puts "Students in the #{cohort} cohort:"
    students.each do |student|
      puts student
    end
    puts "--------------"
  end
end
def print_footer(names)
  students_numerus = (names.count == 1) ? "student" : "students"
  puts "Overall we have #{names.count} great #{students_numerus}"
end
#call methods
print_header
print(students)
print_footer(students)
