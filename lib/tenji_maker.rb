class TenjiMaker
  def new
    TenjiMaker.new
  end
  def to_tenji(text)
     
  end
  def read_text(text)  
   # 半角空白をカウントし文字数を割り出す 
   nil_number = text.count(' ')
   text_number = nil_number + 1
   text_array = text.split
   one_letter = '-- '
   tenji_base = one_letter*text_number
   @tenji_str1 = tenji_base
   @tenji_str2 = tenji_base
   @tenji_str3 = tenji_base


  end
  


  end


end
