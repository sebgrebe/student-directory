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

# students = students_fixed

#methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}, #{student[:cohort]} cohort".center(45)
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students".center(45)
end

def interactive_menu
  students = []
  loop do
    #Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #read the input and turn it into a variable
    selection = gets.chomp
    #do what user selected
    case selection
    when "1"
      students = input_students
    when "2"
      if students.count > 0
        print_header
        print(students)
        print_footer(students)
      else
        nil
      end
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
