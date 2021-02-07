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

    def add_boating_test (test_name, status, instructor)
        BoatingTest.new(test_name, status, instructor, self)
    end

    def all_instructors
        BoatingTest.all.filter { |el| el.student == self.name }.map { |el| el.instructor.instructor_name }
    end

    def self.find_student f_name
        all.find { |el| el.name == f_name }
    end

    def grade_percentage
        avg = BoatingTest.all.filter { |el| el.student == self.name && el.status == "passed" }.count.to_f / BoatingTest.all.filter { |el| el.student == self.name }.count
        "#{self.name} is passing #{avg * 100}% of the tests."
    end

end
