require 'roo'

xlsx = Roo::Spreadsheet.open('./graduate_school.xlsx')

1.upto(1476) do |e|
    a = Classroom.new
    a.class_day = xlsx.sheet('Sheet1').row(e)[0]
    a.class_begin = xlsx.sheet('Sheet1').row(e)[1]
    a.class_end = xlsx.sheet('Sheet1').row(e)[2]
    a.class_room = xlsx.sheet('Sheet1').row(e)[3]
    case xlsx.sheet('Sheet1').row(e)[3]
        when /청/, /네/, /호/, /생과/, /미/, /이/, /문/, /약/, /오/, /정/, /무/, /법/, /의/
            a.class_campus = "seoul"
        when /공/, /국경/, /국제학/, /글/, /멀/, /도/, /생명/, /외/, /체/, /예/, /전/
            a.class_campus = "global"
    end
    a.save
end