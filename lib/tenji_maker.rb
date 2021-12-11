class TenjiMaker
  def new
    TenjiMaker.new
  end
  def to_tenji

  end

  def judge_text(text,number)
    i = number
    
    case text
    when 'A'
     @tenji_str1[i] = 'o'
    when 'I'
     @tenji_str1[i] = 'o'
     @tenji_str2[i] = 'o'
    when 'U'
     @tenji_str1[i] = 'o'
     @tenji_str1[i+1] = 'o'
    when 'E'
      @tenji_str1[i] = 'o'
      @tenji_str1[i+1] = 'o'
      @tenji_str2[i] = 'o'
    when 'O'
      @tenji_str1[i+1] = 'o'
      @tenji_str2[i] = 'o'
    end
  end
  def read_text(text)  
   # 半角空白をカウントし文字数を割り出す 
   nil_number = text.count(' ')
   text_number = nil_number + 1
   text_array = text.split

   one_letter = '-- '
   @tenji_str1 = one_letter * text_number
   @tenji_str2 = one_letter * text_number
   @tenji_str3 = one_letter * text_number
   text_array.each_with_index do |text, num|
    judge_text(text,num*3)
   end
   puts @tenji_str1
   puts @tenji_str2
   puts @tenji_str3
  end
  


  tenji_maker = TenjiMaker.new
  tenji_maker.read_text('A I U A A')
end
