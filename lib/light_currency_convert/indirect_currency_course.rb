module LightCurrencyConverter
  class IndirectCurrencyCourse
    attr_accessor :courses, :path

    def initialize(courses, path)
      @path = path
      @courses = courses
    end

    def convert(amount, *args)
      @courses.zip(path).reduce(amount) do |result, course_with_convert_couple|
        course_with_convert_couple[0].convert(result, *course_with_convert_couple[1])
      end
    end

    def to_s
      flat_path = path.to_a.flatten
      to_value = convert(1, flat_path[0], flat_path[-1])
      "1 #{flat_path[0]} => #{to_value} #{flat_path[-1]}"
    end
  end
end
