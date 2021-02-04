# / `Student` class: should initialize with `first_name`
# / `Student.all` should return all of the student instances
# * `Student#add_boating_test` should initialize a new boating test with a Student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object). 
# * `Student#all_instructors` should return an array of instructors with whom this specific student took a boating test.
# * `Student.find_student` will take in a first name and output the student (Object) with that name
# * `Student#grade_percentage` should return the percentage of tests that the student has passed, a Float (so if a student has passed 3 / 9 tests that they've taken, this method should return the Float `33.33`)


class Student
    attr_reader :name

    @@all = []

    def initialize name
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

end
