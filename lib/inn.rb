class INN
  N10_1 = [2, 4, 10, 3, 5, 9, 4, 6, 8]
  N12_2 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
  N12_1 = [3, 7]+N10_1

  INN_FORMAT = /^(\d{10}$)|(^F\d{10}$)|(^\d{12})$/

    attr_accessor :inn

    def initialize(inn)
      inn = inn.to_s unless inn.kind_of?(String)
      @inn = inn
    end


    def format_good
      (@inn =~ INN_FORMAT) == nil ? false : true
    end

    def twelve_digits_first_step
      tmp = 0
      N12_2.each_with_index do |c, index|
        tmp += c*@inn.at(index).to_i
      end

      return @inn.at(10).to_i == ((x = tmp % 11) == 10 ? 0 : x )
    end

    def twelve_digits_second_step
      tmp = 0
      N12_1.each_with_index do |c, index|
        tmp += c*@inn.at(index).to_i
      end

      return @inn.at(11).to_i == ((x = tmp % 11) == 10 ? 0 : x )
    end

    def ten_digits_step
      tmp = 0
      N10_1.each_with_index do |c, index|
        tmp += c*@inn.at(index).to_i
      end

      return @inn.at(9).to_i == ((x = tmp % 11) == 10 ? 0 : x )
    end

    def check_12_digits_inn
      twelve_digits_first_step and twelve_digits_first_step
    end

    def check_10_digits_inn
      ten_digits_step
    end


    def valid?
      return false unless format_good
      if @inn.length==12
        check_12_digits_inn
      else
         check_10_digits_inn
      end
    end
  end
