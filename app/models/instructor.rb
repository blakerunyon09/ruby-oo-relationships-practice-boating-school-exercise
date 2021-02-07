# * `Instructor` class:initialize with a name
# * `Instructor.all` should return all instructors
# * `Instructor#passed_students` should return an array of students who passed a boating test with this specific instructor.
# * `Instructor#pass_student` should take in a student instance and test name. If there is a `BoatingTest` whose name and student match the values passed in, this method should update the status of that BoatingTest to 'passed'. If there is no matching test, this method should create a test with the student, that boat test name, and the status 'passed'. Either way, it should return the `BoatingTest` instance.
# * `Instructor#fail_student` should take in a student instance and test name. Like `#pass_student`, it should try to find a matching `BoatingTest` and update its status to 'failed'. If it cannot find an existing `BoatingTest`, it should create one with the name, the matching student, and the status 'failed'.
# * `Instructor#all_students` should return an array of students who took a boating test with this specific instructor. 
class Instructor
    attr_reader :instructor_name

    @@all = []

    def initialize instructor_name
        @instructor_name = instructor_name

        @@all << self
    end

    def self.all
        @@all
    end
    
    def passed_students
        BoatingTest.all.filter { |el| el.instructor.instructor_name == self.instructor_name && el.status == "passed" }.map { |el| el.student }
    end

    def pass_student student, test_name
        if BoatingTest.all.find { |el| el.student.name == student && el.test_name == test_name }
            BoatingTest.all.find { |el| el.student.name == student && el.test_name == test_name }.status = "passed"
        else
            BoatingTest.new(test_name, "passed", self, Student.all.find { |el| el.name == student } )
        end
    end

    def fail_student student, test_name
        if BoatingTest.all.find { |el| el.student.name == student && el.test_name == test_name }
            BoatingTest.all.find { |el| el.student.name == student && el.test_name == test_name }.status = "failed"
        else 
            BoatingTest.new(test_name, "failed", self, Student.all.find { |el| el.name == student } )
        end
    end

end