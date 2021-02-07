class BoatingTest
    attr_accessor :status
    attr_reader :student, :instructor, :test_name

    @@all = []

    def initialize test_name, status, instructor, student
        @test_name = test_name
        @status = status
        @instructor = instructor
        @student = student

        @@all << self
    end

    def self.all
        @@all
    end

end
