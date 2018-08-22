@students = [] #accessible to all methods

#Asking user for student names and cohort
def input_students
  name = input_name
  while !name.empty? do
    cohort = input_cohort
    if cohort.empty?
      #set November as default cohort
      add_student(name, "November")
    else
      add_student(name, cohort)
    end
    name = input_name
  end
  @students
end

def load_students_from_file(filename = "students.csv")
  #open file for reading
  file = File.open(filename, "r")
  # load file into students variable
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  file.close
end

def add_student(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_name
  puts "Enter the name of the student (hit return twice to finish)"
  name = STDIN.gets.chomp
end

def input_cohort
  puts "Enter the name of the cohort"
  cohort = STDIN.gets.chomp
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

def print_student_list
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
    #do what user selected
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  if @students.count > 0
    print_header
    print_student_list
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
  when "3"
    save_students
  when "4"
    load_students_from_file
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  #put array into lines of strings and add to File
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students_on_startup
  filename = ARGV.first
  if filename == nil #get out of method if no filename was given
    load_students_from_file
    return nil
  end
  if File.exists?(filename) #file of filename given exists
    load_students_from_file(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

load_students_on_startup
interactive_menu
