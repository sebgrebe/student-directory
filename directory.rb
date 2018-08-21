@students = [] #accessible to all methods

#Asking user for student names and cohort
def input_students
  name = input_name
  while !name.empty? do
    cohort = input_cohort
    if cohort.empty?
      #set November as default cohort
      @students << {name: name.to_sym, cohort: "November"}
    else
      @students << {name: name.to_sym, cohort: cohort.to_sym}
    end
    name = input_name
  end
  @students
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

# students = students_fixed

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print
  @students.each do |student|
    puts "#{student[:name]}, #{student[:cohort]} cohort"
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students"
end

def interactive_menu
  loop do
    #Print the menu and ask the user what to do
    print_menu
    #read the input and turn it into a variable
    selection = gets.chomp
    #do what user selected
    process(selection)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  if @students.count > 0
    print_header
    print
    print_footer
  else
    nil
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end


interactive_menu
