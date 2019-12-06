use strict; # use strict
use warnings; # use warnings
use utf8; # use unicode

binmode(STDIN,":utf8"); # need to consider for these cases":utf8" 
binmode(STDOUT,":utf8");
binmode(STDERR,":utf8");

# var decleration
my $a = "သိမ်းစရာ"; # Variable name with burmese still need to be configured

# print statement
print "၁ သိမ်းစရာa\n";
print "၂ ကျွန်တော်က print statement က စာ ပါ \n";# Need to think for this case

# dict case
my %parser_dict = ("ပြပါ" => 'print' ,"သိမ်းစရာ" => '$',"ကိုယ်ပိုင်" => 'my',"သုံးသည်"=>'use', "တင်းကျပ်"=>'strict',"အမှားပြ"=>'warnings',"ယူနီကုဒ်"=>'utf8', "အဘိဓါန်" => 'dict',
"အသုံးပြုသူ"=>'usr',"ဘင်"=>'bin',"ပါး"=>'perl',"ဘိုင်နရီမုတ်"=>'binmode',"စံအဝင်"=>'STDIN',"စံအထွက်"=>'STDOUT',"စံအမှား"=>'STDERR',"ဖြစ်လျှင်"=>'if',
"သို့မဟုတ်"=>'elsif',"အခြား"=>'else',"၀"=>'0',"၁"=>'1',"၂"=>'2',"၃"=>'3',"၄"=>'4',"၅"=>'5',"၆"=>'6',"၇"=>'7',"၈"=>'8',"၉"=>'9');

# if case Also same for elsif elcase
if (1 == 1)
{
print "၃ တူပါတယ်";
}
elsif ("A" == "a")
{
print "သို့မဟုတ် ထဲ မှာ အခြား ၏ ၏ \n";
}
else
{
print "အခြား ထဲ မှာ ရောက် နေ ပါတယ် \n"
}




