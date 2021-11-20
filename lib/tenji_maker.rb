#!/usr/bin/ruby
#coding:utf-8

class TenjiMaker

    Vowels = {
        'A'=>32, 'I'=>40, 'U'=>48, 'E'=>56, 'O'=>24
    }
    VowelsDown = {
        'A'=>2, 'I'=>10, 'U'=>3, 'E'=>14, 'O'=>6
    }
    Consonants = {
        ''=>[0],       'K'=>[1],      'S'=>[5],      'T'=>[6],      'N'=>[2],
        'H'=>[3],      'M'=>[7],      'Y'=>[16],     'R'=>[4],      'W'=>[0],
        'G'=>[4, 1],   'Z'=>[4, 5],   'D'=>[4, 6],   'B'=>[4, 3],   'P'=>[1, 3],
        'KY'=>[16, 1], 'SY'=>[16, 5], 'TY'=>[16, 6], 'NY'=>[16, 2], 'HY'=>[16, 3], 'MY'=>[16, 7], 'RY'=>[16, 4],
        'GY'=>[20, 1], 'ZY'=>[20, 5], 'DY'=>[20, 6], 'BY'=>[20, 3], 'PY'=>[17, 3],
        'WH'=>[9, 0],  'KW'=>[9, 1],  'TS'=>[9, 6],  'F'=>[9, 3],
        'GW'=>[13, 1], 'V'=>[13, 3],
    }
    N = 7
    T = 8
    Dash = 12

    def codes_to_braille(codes)
        codepoint_map = [32,4,16,2,8,1]
        codes.map{|e|(0..5).reduce(0x2800){|s,i|s+e[i]*codepoint_map[i]}.chr('UTF-8')}*''
    end

    def codes_to_tenji(codes)
        codes.map{|e|('%06b'%e).tr('01','-o').scan(/../)}.transpose.map{|e|e*' '}*"\n"
    end

    def roman_to_codes(roman)
        codes = []
        current_consonant = ''
        roman.each_char{|c|
            if c == ' '
            elsif c == '-'
                raise '子音(%s)の後に長音を挿入しようとしました'%current_consonant if !current_consonant.empty?
                codes << Dash
            elsif Vowels.include?(c)
                if ['Y', 'W'].include?(current_consonant)
                    vowel_code = VowelsDown[c]
                else
                    vowel_code = Vowels[c]
                end
                consonant_code = Consonants[current_consonant]
                codes += consonant_code[0...-1] + [consonant_code[-1] | vowel_code]
                current_consonant = ''
            else
                if current_consonant[-1] == c
                    raise '複数のローマ字からなる子音(%s)の後に促音を挿入しようとしました'%current_consonant if current_consonant.size > 1
                    if current_consonant == 'N'
                        codes << N
                        current_consonant = ''
                    else
                        codes << T
                    end
                else
                    current_consonant += c
                    if !Consonants.include?(current_consonant)
                        raise '予期せぬ子音(%s)が入力されました'%current_consonant if current_consonant[0]!='N'
                        codes << N
                        current_consonant = current_consonant[1..-1]
                    end
                end
            end
        }
        if !current_consonant.empty?
            raise '文字列が子音で終端しています(%s)'%current_consonant if current_consonant != 'N'
            codes << N
        end
        codes
    end

    def to_tenji(roman)
        codes_to_tenji roman_to_codes roman
    end

    def to_braille(roman)
        codes_to_braille roman_to_codes roman
    end

end

if __FILE__ == $0
    puts TenjiMaker.new.to_tenji gets.chomp.upcase
end
