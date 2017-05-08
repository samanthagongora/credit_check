class CreditCheck
  def check(cc_number)
    cc_reversed = manipulate_number(cc_number)
    cc_doubled = double_other(cc_reversed)
    doubled_and_summed = sum_doubled_digits(cc_doubled)
    summed = sum_all(doubled_and_summed)
    is_valid = divisible_by_ten(summed)
    valid_statement(is_valid)
  end

  def manipulate_number(cc_number)
    split_numbers = cc_number.split('')
    converted_numbers = split_numbers.map {|num| num.to_i}
    converted_numbers.reverse
  end

  def double_other(cc_reversed)
    cc_reversed.map.with_index do |num, i|
      if i.odd?
        num * 2
      else
        num
      end
    end
  end

  def sum_doubled_digits(cc_doubled)
    cc_doubled.map do |number|
      if number > 9
        sum_two_digits(number)
      else
        number
      end
    end
  end

  def sum_two_digits(number)
    quotient = number / 10
    remainder = number % 10
    quotient + remainder
  end

  def sum_all(doubled_and_summed)
    doubled_and_summed.reduce(:+)
  end

  def divisible_by_ten(summed)
    valid = false
    valid = true if (summed % 10).zero?
    valid
  end

  def valid_statement(is_valid)
    if is_valid
      puts 'The number is valid!'
    else
      puts 'The number is invalid!'
    end
  end
end

checker = CreditCheck.new
checker.check('4929735477250543')
checker.check('5541808923795240')
checker.check('4024007136512380')
checker.check('6011797668867828')
checker.check('5541801923795240')
checker.check('6011797668868728')
checker.check('4024007106512380')
checker.check('342804633855673')
checker.check('342801633855673')
