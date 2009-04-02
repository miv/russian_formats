require 'lib/inn'

describe INN do


  INVALID_FORMATS =  ["A123123123", "sda31231", "223", "1231234322355"] 
  INVALID_FORMATS.each do |invalid|
	  it "should return false if format is invalid like in #{invalid}" do
	    INN.new(invalid).format_good.should be_false
	  end
  end

  VALID_10_DIGITS = ["7830002293", "5245000448"]

  VALID_10_DIGITS.each do |valid|
	  it "should return true to valid 10 digits inn like #{valid}" do
	    INN.new(valid).valid?.should be_true
	  end
  end

  VALID_12_DIGITS = ["500100732259"]

  VALID_12_DIGITS.each do |valid|
          it "should return true to valid 10 digits inn like #{valid}" do
            INN.new(valid).valid?.should be_true
          end
  end
 
  it "should work with intergers and with strings" do
    INN.new(VALID_12_DIGITS[0].to_i).valid?.should be_true
  end

end
