class TenjiMaker
  def to_tenji(text)
    read_and_output(text)
    string = @tenji_str1.rstrip + "\n" <<  @tenji_str2.rstrip + "\n" << @tenji_str3.rstrip
    string
  end
  
  def judge_others_text(text,number)
    i = number
    case text
    when /K\D/
      @tenji_str3[i+1] = 'o'
    
    when /S\D/
      @tenji_str2[i+1] = 'o'
      @tenji_str3[i+1] = 'o'
    
    when /T\D/
      @tenji_str2[i+1] = 'o'
      @tenji_str3[i] = 'o'

    when /N\D/
      @tenji_str3[i] = 'o'

    when /H\D/
      @tenji_str3[i] = 'o'
      @tenji_str3[i+1] = 'o'
    
    when /M\D/
      @tenji_str2[i+1] = 'o'
      @tenji_str3[i] = 'o'
      @tenji_str3[i+1] = 'o'
    
    when /R\D/
      @tenji_str2[i+1] = 'o'

    when /Y\D/
      @tenji_str1[i+1] = 'o'
      @tenji_str1[i] = '-'
      @tenji_str3[i] = 'o'
      
    when /W\D/
      @tenji_str1[i] = '-'
      @tenji_str3[i] = 'o'

    when 'N'
      @tenji_str2[i+1] = 'o'
      @tenji_str3[i] = 'o'
      @tenji_str3[i+1] = 'o'
    end
  end
  
  def judge_mother_text(text,number)
    i = number
    case 
    when text.include?('A')
      @tenji_str1[i] = 'o'

    when text.include?('I')
      @tenji_str1[i] = 'o'
      @tenji_str2[i] = 'o'

    when text.include?('U') && !(text.include?('Y'))
      @tenji_str1[i] = 'o'
      @tenji_str1[i+1] = 'o'

    when text.include?('E')
      @tenji_str1[i] = 'o'
      @tenji_str1[i+1] = 'o'
      @tenji_str2[i] = 'o'

    when text.include?('O') && !(text.include?('Y'))
      @tenji_str1[i+1] = 'o'
      @tenji_str2[i] = 'o'

    when text == 'YU'
      @tenji_str3[i+1] = 'o'
    when text == 'YO'
      @tenji_str2[i+1] = 'o'
    end
  end
  
  def read_and_output(text)  
   nil_number = text.count(' ')
   text_number = nil_number + 1
   text_array = text.split

   one_letter = '-- '
   @tenji_str1 = one_letter * text_number
   @tenji_str2 = one_letter * text_number
   @tenji_str3 = one_letter * text_number

   text_array.each_with_index do |text, num|
    judge_mother_text(text, num * 3)
    judge_others_text(text, num * 3)
   end
  end
end
